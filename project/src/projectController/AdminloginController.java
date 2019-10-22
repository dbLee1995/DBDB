package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/admin/adlogin")
public class AdminloginController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd=req.getParameter("cmd");
		
		if(cmd!=null && cmd.equals("adminlogin")) {
			adminlogin(req, resp);
		}
		if(cmd!=null && cmd.equals("adminlogout")) {
			adminlogout(req, resp);
		}	
	}
	protected void adminlogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		HttpSession session=req.getSession();
		if(id.equals("admin") && pwd.equals("1111")) {
			session.setAttribute("id", id);
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=main.jsp");
		}else {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=login.jsp");
		}
	}
	protected void adminlogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.invalidate();
		resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=login.jsp");
	}
}
