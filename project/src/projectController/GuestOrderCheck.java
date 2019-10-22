package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.CompanyDao;
import projectDao.GoodsDao;
import projectDao.GoodsDetailDao;
import projectDao.ShoppinglistDao;
import projectVo.GoodsDetailVo;
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
		
		GoodsDetailVo gvo=GoodsDetailDao.getInstance().select("gdnum", svo.getGdNum()).get(0);
		req.setAttribute("gvo", gvo);
		
		int cpnum=GoodsDao.getInstance().select(gvo.getGdlistnum()).getCPNum();
		String cpname=CompanyDao.getInstance().select(cpnum).getCpName();
		req.setAttribute("cpname", cpname);
		
		req.getRequestDispatcher("/examples/guestordercheck.jsp").forward(req, resp);
	}
}
