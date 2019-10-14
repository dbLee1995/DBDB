package projectController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
}
