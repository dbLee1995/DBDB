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

import projectDao.CompanyDao;
import projectDao.GoodsDao;
import projectVo.CompanyVo;
import projectVo.GoodsVo;
@WebServlet("/admin/goods")
public class GoodsController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&& cmd.equals("cpList")) {
			cpList(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdCheck")){
			gdCheck(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdInsert")) {
			gdInsert(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdList")) {
			gdList(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdSelect")) {
			gdSelect(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdUpdate")) {
			gdUpdate(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdDelete")) {
			gdDelete(req, resp);
		}
	}
	int cpNum=0;
	protected void cpList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		JSONArray arr=new JSONArray();
		GoodsDao dao=GoodsDao.getInstance();
		CompanyDao cpdao=CompanyDao.getInstance();
		ArrayList<CompanyVo> list=cpdao.selectAll();
		arr.put(list);
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
	}
	protected void gdCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		int cpListNum=Integer.parseInt(req.getParameter("cpListNum"));
		String gdList=req.getParameter("gdList");
		GoodsDao gdao=GoodsDao.getInstance();
		GoodsVo gvo=gdao.cpSelect(cpListNum,gdList);
		JSONObject json=new JSONObject();
		boolean using=false;
		if(gvo!=null) {
			using=true;
		}
		json.put("using", using);
		PrintWriter pw=resp.getWriter();
		pw.print(json);

	}
	protected void gdInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		String gdList=req.getParameter("gdList");
		int cpListNum=Integer.parseInt(req.getParameter("cpListNum"));
		GoodsDao gdao=GoodsDao.getInstance();
		GoodsVo vo=new GoodsVo(cpListNum, 0, gdList);
		int n=gdao.insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=cpgoods.jsp");
		}
	}
	protected void gdList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		GoodsDao gdao=GoodsDao.getInstance();
		ArrayList<GoodsVo> list=gdao.selectAll();
		
		
		JSONArray arr=new JSONArray();
		arr.put(list);
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
		
	}
	protected void gdSelect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		int GDListNum=Integer.parseInt(req.getParameter("GDListNum"));
		GoodsDao dao=GoodsDao.getInstance();
		GoodsVo vo=dao.select(GDListNum);
		cpNum=	vo.getCPNum();
		CompanyDao cdao=CompanyDao.getInstance();
		CompanyVo cvo=cdao.select(cpNum);


		req.setAttribute("vo", vo);
		req.setAttribute("cvo", cvo);
		req.getRequestDispatcher("adindex.jsp?page=gdupdate.jsp").forward(req, resp);
		
	}
	
	protected void gdUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		String gdList=req.getParameter("gdList");
		int gdListNum=Integer.parseInt(req.getParameter("gdListNum"));
		GoodsDao gdao=GoodsDao.getInstance();
		GoodsVo gvo=new GoodsVo(0,gdListNum, gdList);
		GoodsVo gvoAll=new GoodsVo(cpNum, gdListNum, gdList);
		int n=gdao.update(gvo);
		if(n>0) {
			req.setAttribute("gvo", gvoAll);
			req.getRequestDispatcher("/admin/adindex.jsp?page=cpgoodsinfo.jsp").forward(req, resp);
		}
		
	}
	protected void gdDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
	}
}
