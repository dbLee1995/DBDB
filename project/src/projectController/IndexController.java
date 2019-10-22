package projectController;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.GoodsDetailDao;
import projectVo.GoodsDetailVo;

@WebServlet("/index")
public class IndexController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		DecimalFormat df = new DecimalFormat("###,###.####");
		req.setAttribute("df", df);
		
		String id="";
		String rid=req.getParameter("id");
		if(rid==null) {id="guest";}
		else if(rid.equals("")) {id="guest";}
		else {id=rid;}
		
		System.out.println(id);
		
		GoodsDetailDao dao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailVo> pricelist=dao.select("gdprice", 0);
		ArrayList<GoodsDetailVo> steaklist=dao.select("gdlistnum", 1);
		ArrayList<GoodsDetailVo> cblist=dao.select("gdlistnum", 4);
		
		req.setAttribute("id", id);
		req.setAttribute("pricelist", pricelist);
		req.setAttribute("steaklist", steaklist);
		req.setAttribute("cblist", cblist);
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
