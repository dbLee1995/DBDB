package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import projectDao.CompanyDao;
import projectVo.CompanyVo;

@WebServlet("/company")
public class CompanyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd=req.getParameter("cmd");
		if(cmd!=null && cmd.equals("cpCheck")) {
			cpCheck(req,resp);
		}
		if(cmd!=null && cmd.equals("cpInsert")) {
			cpInsert(req,resp);
		}
		
	}
	protected void cpInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	protected void cpCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cpName=req.getParameter("cpName");
		String cpPhone=req.getParameter("cpPhone");
		CompanyDao dao=CompanyDao.getInstance();
		CompanyVo vo=new CompanyVo(0, cpName, cpPhone);
		int n=dao.insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/temporaily/");
		}
	}
}
