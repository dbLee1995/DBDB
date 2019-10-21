package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.AccountDao;
import projectDao.CartDao;
import projectDao.GoodsDetailDao;
import projectDao.ShoppinglistDao;
import projectDao.UserInfoDao;
import projectVo.AccountVo;
import projectVo.CartInfoVo;
import projectVo.GoodsDetailVo;
import projectVo.UserInfoVo;

@WebServlet("/buypage")
public class BuyPageController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String cmd=req.getParameter("cmd");
		
		if(cmd!=null && cmd.equals("guest")) {
			guest(req, resp);
		}if(cmd!=null && cmd.equals("cart")) {
			cart(req, resp);
		}
	}
	protected void guest(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		System.out.println("guestpage");
		
		String id=req.getParameter("id");
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		int count=Integer.parseInt(req.getParameter("count"));
		
		req.setAttribute("id", id);
		
		GoodsDetailVo gvo=GoodsDetailDao.getInstance().select("gdnum", gdnum).get(0);
		req.setAttribute("gvo", gvo);
		req.setAttribute("count", count);
		req.setAttribute("totalprice", count*gvo.getGdprice());
		
		int ordernum=ShoppinglistDao.getMaxNum()+1;
		req.setAttribute("ordernum", ordernum);
		System.out.println("guestdetail");
		
		req.getRequestDispatcher("/examples/buy.jsp").forward(req, resp);
	}
	protected void cart(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		CartDao vdao=CartDao.getInstance();
		ArrayList<CartInfoVo> clist=vdao.getCartInfo();
		req.setAttribute("cartlist", clist);
		
		int total=0;
		for(int i=0;i<clist.size();++i) {
			total+=clist.get(i).getCount()*clist.get(i).getGdprice();
		}
		req.setAttribute("totalprice", total);
		
		String id=req.getParameter("id");
		UserInfoDao udao=UserInfoDao.getInstance();
		UserInfoVo uvo=udao.select(id);
		req.setAttribute("userinfo", uvo);

		AccountDao adao=AccountDao.getInstance();
		AccountVo avo=adao.select(id);
		req.setAttribute("account", avo);
		
		int ordernum=ShoppinglistDao.getMaxNum()+1;
		req.setAttribute("ordernum", ordernum);
		
		req.getRequestDispatcher("/examples/buy.jsp").forward(req, resp);
	}
}
