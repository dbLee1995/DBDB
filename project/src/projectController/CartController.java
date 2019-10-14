package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.CartDao;
import projectDao.GoodsDetailDao;
import projectVo.CartVo;
import projectVo.GoodsDetailVo;

@WebServlet("/cart")
public class CartController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		int count=Integer.parseInt(req.getParameter("count"));
		
		GoodsDetailDao gddao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailVo> gdlist=gddao.select("gdnum", gdnum);
		gdlist.get(0);
		
		CartDao cdao=CartDao.getInstance();
		CartVo cvo=new CartVo(0,gdnum, null);
		int n=cdao.insert(cvo);
	}
}
