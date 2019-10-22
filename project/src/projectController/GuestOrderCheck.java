package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.ShoppinglistDao;
import projectVo.ShoppinglistVo;

@WebServlet("/guestordercheck")
public class GuestOrderCheck extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		String id=req.getParameter("id");
		int ordernum=Integer.parseInt(req.getParameter("ordernum"));
		
		ShoppinglistVo svo=ShoppinglistDao.getInstance().selectOrdernum(ordernum);
		req.setAttribute("id", id);
		req.setAttribute("svo", svo);
		req.getRequestDispatcher("/examples/guestordercheck.jsp").forward(req, resp);
	}
}
