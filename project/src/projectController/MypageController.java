package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import projectDao.AccountDao;
import projectVo.AccountVo;

@WebServlet("/mypage")
public class MypageController extends HttpServlet{
	public static String id="";
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		
		if(cmd!=null && cmd.equals("user")) {
			user(req, resp);
		}if(cmd!=null && cmd.equals("shoppinglist")) {
			shoppinglist(req, resp);
		}if(cmd!=null && cmd.equals("cart")) {
			cart(req, resp);
		}if(cmd!=null && cmd.equals("point")) {
			point(req, resp);
		}if(cmd!=null && cmd.equals("qna")) {
			qna(req, resp);
		}
	}
	protected static void user(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		String rid=req.getParameter("id");
		if(id!=null && id.equals("")) {id=rid;}
		
		AccountDao adao=AccountDao.getInstance();
		AccountVo avo=adao.select(id);
		
		req.setAttribute("id", id);
		req.setAttribute("email", avo.getEmail());
		req.getRequestDispatcher("/mypage/userpage.jsp").forward(req, resp);
	}
	protected static void shoppinglist(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
	}
	protected static void cart(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/mypage/cartpage.jsp").forward(req, resp);
	}
	protected static void point(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
	}
	protected static void qna(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
