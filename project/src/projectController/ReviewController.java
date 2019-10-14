package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String title=req.getParameter("title");
		int score=Integer.parseInt(req.getParameter("score"));
		String content=req.getParameter("content");
	}
	protected void insert(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
		
		String id=req.getParameter("id");
		String title=req.getParameter("title");
		int score=Integer.parseInt(req.getParameter("score"));
		String content=req.getParameter("content");
	}
	protected void delete(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
		
	}
}
