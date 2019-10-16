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
import projectDao.ShoppinglistDao;
import projectDao.UserInfoDao;
import projectVo.AccountVo;
import projectVo.CartInfoVo;
import projectVo.UserInfoVo;

@WebServlet("/buypage")
public class BuyPageController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		
		if(cmd!=null && cmd.equals("guestdetail")) {
			guestdetail(req, resp);
		}if(cmd!=null && cmd.equals("userdetail")) {
			userdetail(req, resp);
		}if(cmd!=null && cmd.equals("cart")) {
			cart(req, resp);
		}
	}
	protected void guestdetail(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
	}
	protected void userdetail(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
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
