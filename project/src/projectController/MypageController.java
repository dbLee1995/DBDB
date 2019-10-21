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
import projectDao.QnaDao;
import projectDao.ShoppinglistDao;
import projectDao.UserInfoDao;
import projectVo.AccountVo;
import projectVo.CartInfoVo;
import projectVo.GoodsDetailVo;
import projectVo.OrdernumInfoVo;
import projectVo.QnaVo;
import projectVo.ShoppinglistVo;
import projectVo.UserInfoVo;

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
		}if(cmd!=null && cmd.equals("userinfo")) {
			userinfo(req, resp);
		}if(cmd!=null && cmd.equals("shoppinglist")) {
			shoppinglist(req, resp);
		}if(cmd!=null && cmd.equals("updateshoppinglist")) {
			updateshoppinglist(req, resp);
		}if(cmd!=null && cmd.equals("trade")) {
			trade(req, resp);
		}if(cmd!=null && cmd.equals("updatetrade")) {
			updatetrade(req, resp);
		}if(cmd!=null && cmd.equals("cart")) {
			cart(req, resp);
		}if(cmd!=null && cmd.equals("cartdelete")) {
			cartdelete(req, resp);
		}if(cmd!=null && cmd.equals("point")) {
			point(req, resp);
		}if(cmd!=null && cmd.equals("qna")) {
			qna(req, resp);
		}if(cmd!=null && cmd.equals("updateqna")) {
			qnaupdate(req, resp);
		}
	}
	protected static void user(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		String rid=req.getParameter("id");
		if(id!=null && id.equals("")) {id=rid;}
		
		AccountVo avo=AccountDao.getInstance().select(id);
		UserInfoVo uvo=UserInfoDao.getInstance().select(id);
		
		req.setAttribute("id", id);
		req.setAttribute("email", avo.getEmail());
		req.setAttribute("fname", uvo.getLname());
		req.setAttribute("lname", uvo.getFname());
		req.setAttribute("addr", uvo.getAddr());
		req.getRequestDispatcher("/mypage/userpage.jsp").forward(req, resp);
	}
	protected static void userinfo(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		String id=req.getParameter("id");
		String email=req.getParameter("email");
		String fname=req.getParameter("fname");
		String lname=req.getParameter("lname");
		String addr=req.getParameter("addr");
		
		AccountDao adao=AccountDao.getInstance();
		AccountVo avo=adao.select(id);
		AccountVo avoUpdate=new AccountVo(id, avo.getPwd(), email, avo.getPoint());
		adao.update(avoUpdate);
		
		UserInfoDao udao=UserInfoDao.getInstance();
		UserInfoVo uvoUpdate=new UserInfoVo(id, fname, lname, addr);
		udao.update(uvoUpdate);
		
		user(req, resp);
	}
	protected static void shoppinglist(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		ArrayList<ShoppinglistVo> slist=ShoppinglistDao.getInstance().select(id);
		req.setAttribute("shoppinglist", slist);
		
		ArrayList<GoodsDetailVo> glist=GoodsDetailDao.getInstance().selectAll();
		req.setAttribute("goodsdetaillist", glist);
		
		req.getRequestDispatcher("/mypage/shoppinglistpage.jsp").forward(req, resp);
	}
	protected static void updateshoppinglist(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		int snum=Integer.parseInt(req.getParameter("snum"));
		int state=Integer.parseInt(req.getParameter("state"));
		
		ShoppinglistDao.getInstance().update(snum, state);
		
		shoppinglist(req, resp);
	}
	protected static void trade(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		ShoppinglistDao sdao=ShoppinglistDao.getInstance();
		ArrayList<ShoppinglistVo> slist=sdao.select(id);
		req.setAttribute("shoppinglist", slist);
		
		int tnum=0;
		String snum=req.getParameter("snum");
		if(snum!=null && !snum.equals("")) {tnum=Integer.parseInt(snum);}
		
		String display="";
		String getdisplay=req.getParameter("display");
		if(getdisplay!=null && getdisplay.equals("block")) {
			display=getdisplay;
		}else {
			display="none";
		}
		req.setAttribute("display", display);

		ShoppinglistVo tradeinfo=sdao.select(tnum);
		req.setAttribute("tradeinfo", tradeinfo);
		
		GoodsDetailDao gdao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailVo> glist=gdao.selectAll();
		req.setAttribute("goodsdetaillist", glist);
		
		req.getRequestDispatcher("/mypage/tradepage.jsp").forward(req, resp);
	}
	protected static void updatetrade(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		int snum=Integer.parseInt(req.getParameter("snum"));
		String state=req.getParameter("state");
		
		ShoppinglistDao sdao=ShoppinglistDao.getInstance();
		
		if(state!=null && state.equals("trade")) {sdao.update(snum, 2);}
		if(state!=null && state.equals("return")) {sdao.update(snum, 4);}
		
		trade(req, resp);
	}
	protected static void cart(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		String rid=req.getParameter("id");
		if(id!=null && id.equals("")) {id=rid;}
		
		ArrayList<CartInfoVo> clist=CartDao.getInstance().getCartInfo();
		
		req.setAttribute("cartlist", clist);
		req.getRequestDispatcher("/mypage/cartpage.jsp").forward(req, resp);
	}
	protected static void cartdelete(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		int cnum=Integer.parseInt(req.getParameter("cnum"));
		
		CartDao cdao=CartDao.getInstance();
		cdao.delete(cnum);
		
		cart(req, resp);
	}
	protected static void point(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/mypage/pointpage.jsp").forward(req, resp);
	}
	protected static void qna(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		String rid=req.getParameter("id");
		if(id!=null && id.equals("")) {id=rid;}
		
		UserInfoVo uvo=UserInfoDao.getInstance().select(id);
		
		req.setAttribute("id", id);
		req.setAttribute("name", uvo.getFname()+uvo.getLname());
		
		ArrayList<QnaVo> qvolist=QnaDao.getInstance().selectAll();
		
		req.setAttribute("volist", qvolist);
		
		req.getRequestDispatcher("/mypage/qnapage.jsp").forward(req, resp);
	}
	protected static void qnaupdate(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		
		String rid=req.getParameter("id");
		if(id!=null && id.equals("")) {id=rid;}
		
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String qnaselect=req.getParameter("qnaselect");
		
		QnaVo qvo=new QnaVo(0, id, qnaselect, title, content, null, null, null, 1);
		int n=QnaDao.getInstance().insert(qvo);
		
		qna(req, resp);
	}
}
