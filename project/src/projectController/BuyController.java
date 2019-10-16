package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/buy")
public class BuyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		
		if(cmd!=null && cmd.equals("user")) {
			user(req, resp);
		}if(cmd!=null && cmd.equals("guest")) {
			guest(req, resp);
		}
	}
	protected void user(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
	}
	protected void guest(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
	}
}
