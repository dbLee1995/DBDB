package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.GoodsDetailDao;
import projectVo.GoodsDetailVo;

@WebServlet("/detail")
public class DetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		
		GoodsDetailDao dao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailVo> list=dao.select("gdnum", gdnum);
		
		req.setAttribute("gdnum", gdnum);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/examples/detail.jsp").forward(req, resp);
	}
}
