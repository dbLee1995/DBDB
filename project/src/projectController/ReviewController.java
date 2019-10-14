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

import projectDao.ReviewDao;
import projectVo.ReviewVo;

@WebServlet("/review")
public class ReviewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null && cmd.equals("list")) {
			list(req, resp);
		}if(cmd!=null && cmd.equals("insert")) {
			insert(req, resp);
		}if(cmd!=null && cmd.equals("delete")) {
			delete(req, resp);
		}
	}
	protected void list(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
		
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		ReviewDao dao=ReviewDao.getInstance();
		ArrayList<ReviewVo> list=dao.select(gdnum);
		JSONArray arr=new JSONArray();
		arr.put(list);
		pw.print(arr);
	}
	protected void insert(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
		
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		String id=req.getParameter("id");
		String title=req.getParameter("title");
		int score=Integer.parseInt(req.getParameter("score"));
		String content=req.getParameter("content");
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		ReviewDao dao=ReviewDao.getInstance();
		ReviewVo vo=new ReviewVo(0,gdnum, id, title, content, null, score);
		int n=dao.insert(vo);
		JSONObject json=new JSONObject();
		json.put("insert", n);
		pw.println(json);
	}
	protected void delete(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
		
		String id=req.getParameter("id");
		String rid=req.getParameter("rid");
		int revnum=Integer.parseInt(req.getParameter("revnum"));
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		if(id.equals(rid)) {
			ReviewDao dao=ReviewDao.getInstance();
			dao.delete(revnum);
		}
		req.getRequestDispatcher("/detail?gdnum="+gdnum).forward(req, resp);
	}
}
