package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.GoodsDetailDao;

@WebServlet("/list")
public class IndexController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		GoodsDetailDao dao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailDao> list=null;
	}
}
