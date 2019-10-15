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
import projectVo.CompanyVo;

@WebServlet("/admin/company")

public class CompanyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null && cmd.equals("cpCheck")) {
			cpCheck(req,resp);
		}
		if(cmd!=null && cmd.equals("cpInsert")) {
			cpInsert(req,resp);
		}
		if(cmd!=null && cmd.equals("cpList")) {
			cpList(req,resp);
		}
		if(cmd!=null && cmd.equals("cpDelete")) {
			cpDelete(req,resp);
		}
		if(cmd!=null && cmd.equals("cpUpdate")) {
			cpUpdate(req,resp);
		}
		if(cmd!=null && cmd.equals("cpSelect")) {
			cpSelect(req,resp);
		}
		
	}
	protected void cpInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		String cpName=req.getParameter("cpName");
		String cpPhone=req.getParameter("cpPhone");
		CompanyDao dao=CompanyDao.getInstance();
		CompanyVo vo=new CompanyVo(0, cpName, cpPhone);
		int n=dao.insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=cpgoods.jsp");
		}
	}
	protected void cpCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		String cpName=req.getParameter("cpName");
		boolean using=false;
		JSONObject json=new JSONObject();
		CompanyDao dao=CompanyDao.getInstance();
		CompanyVo vo=new CompanyVo(0, cpName, null);
		vo=dao.select(cpName);
		if(vo!=null) {
			using=true;
		}
		json.put("using", using);
		PrintWriter pw=resp.getWriter();
		pw.print(json.toString());
		
	}
	protected void cpList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		JSONArray arr=new JSONArray();
		CompanyDao dao=CompanyDao.getInstance();
		ArrayList<CompanyVo> list=dao.selectAll();
		PrintWriter pw=resp.getWriter();
		arr.put(list);
		pw.print(arr);
	}
	protected void cpDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		int cpNum=Integer.parseInt(req.getParameter("cpnum"));
		CompanyDao dao=CompanyDao.getInstance();
		int n=dao.delete(cpNum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=cpinfo.jsp");
		}
		
	}
	protected void cpUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		int cpNum=Integer.parseInt(req.getParameter("cpNum"));
		String cpName=req.getParameter("cpName");
		String cpPhone=req.getParameter("cpPhone");
		
		CompanyDao dao=CompanyDao.getInstance();
		CompanyVo vo=new CompanyVo(cpNum,cpName,cpPhone);
		int n=dao.update(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=cpinfo.jsp");
		}
	}
	protected void cpSelect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		int cpNum=Integer.parseInt(req.getParameter("cpnum"));
		CompanyDao dao=CompanyDao.getInstance();
		CompanyVo vo=dao.select(cpNum);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("adindex.jsp?page=cpupdate.jsp").forward(req, resp);
	}

}
