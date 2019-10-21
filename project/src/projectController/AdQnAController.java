package projectController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import projectDao.QnaDao;
import projectVo.QnaVo;
@WebServlet("/admin/qna")
public class AdQnAController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&&cmd.equals("qlist")){
			qlist(req, resp);
		}
		if(cmd!=null&&cmd.equals("alist")){
			alist(req, resp);
		}
		if(cmd!=null&&cmd.equals("stateChange")){
			stateChange(req, resp);
		}
		if(cmd!=null&&cmd.equals("answer")){
			answer(req, resp);
		}
		if(cmd!=null&&cmd.equals("answerUpdate")){
			answerUpdate(req, resp);
		}
		
	}
	protected void qlist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		QnaDao qdao=QnaDao.getInstance();
		ArrayList<QnaVo> list=qdao.selectAll();
		JSONArray arr=new JSONArray();
		for(int i=0;i<list.size();i++) {
			QnaVo qvo=list.get(i);
			if(qvo.getAnswerstate()==1 || qvo.getAnswerstate()==2) {
				JSONObject json=new JSONObject();
				json.put("qnum", qvo.getQnum());
				json.put("id", qvo.getId());
				json.put("category", qvo.getCategory());
				json.put("title", qvo.getTitle());
				json.put("content", qvo.getContent());
				json.put("regdate", qvo.getRegdate());
				json.put("answerstate", qvo.getAnswerstate());
				arr.put(json);
			}
		}
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
	}
	protected void alist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		QnaDao qdao=QnaDao.getInstance();
		ArrayList<QnaVo> list=qdao.completeselectAll();
		JSONArray arr=new JSONArray();
		arr.put(list);
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
		
	}
	protected void stateChange(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		int state=Integer.parseInt(req.getParameter("state"));
		int qnum=Integer.parseInt(req.getParameter("qnum"));
		int n=0;
		QnaDao qdao=QnaDao.getInstance();
		n=qdao.update(qnum, 2);
		QnaVo qvo=qdao.select(qnum);
		if(state==1) {
			if(n>0) {
				req.setAttribute("qvo", qvo);
				req.getRequestDispatcher("/admin/adindex.jsp?page=answer.jsp").forward(req, resp);
			}	
		}else if(state==2){
			if(n>0) {
				req.setAttribute("qvo", qvo);
				req.getRequestDispatcher("/admin/adindex.jsp?page=answer.jsp").forward(req, resp);
			}	
		}
		
	}
	protected void answer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			req.setCharacterEncoding("utf-8");
			String answer=req.getParameter("answer");
			int answerstate=Integer.parseInt(req.getParameter("answerstate"));
			QnaDao qdao=QnaDao.getInstance();
			int n=qdao.update(answer,answerstate);
			if(n>0) {
				resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=completedqna.jsp");
			}
	}
	protected void answerUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		int qnum=Integer.parseInt(req.getParameter("qnum"));
		QnaDao qdao=QnaDao.getInstance();
		QnaVo qvo=qdao.select(qnum);
		req.setAttribute("qvo", qvo);
		req.getRequestDispatcher("/admin/adindex.jsp?page=answer.jsp").forward(req, resp);
		
	}
	
}
