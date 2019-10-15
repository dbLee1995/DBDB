package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.CartDao;
import projectDao.ShoppinglistDao;
import projectDao.UserInfoDao;
import projectVo.CartInfoVo;
import projectVo.UserInfoVo;

@WebServlet("/buy")
public class BuyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		CartDao vdao=CartDao.getInstance();
		ArrayList<CartInfoVo> clist=vdao.getCartInfo();
		req.setAttribute("cartlist", clist);
		
		String id=req.getParameter("id");
		UserInfoDao udao=UserInfoDao.getInstance();
		UserInfoVo uvo=udao.select(id);
		req.setAttribute("userinfo", uvo);
		// account 넣ㅇ서ㅓ 이메일 받아야댐 
		
		int ordernum=ShoppinglistDao.getMaxNum()+1;
		req.setAttribute("ordernum", ordernum);
		
		req.getRequestDispatcher("/examples/buy.jsp").forward(req, resp);
	}
}
