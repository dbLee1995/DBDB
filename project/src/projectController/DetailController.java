package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import projectDao.CompanyDao;
import projectDao.GoodsDao;
import projectDao.GoodsDetailDao;
import projectVo.CompanyVo;
import projectVo.GoodsDetailVo;
import projectVo.GoodsVo;

@WebServlet("/detail")
public class DetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		
		GoodsDetailDao dao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailVo> list=dao.select("gdnum", gdnum);
		GoodsDetailVo vo=list.get(0);
		GoodsDao goodsdao=GoodsDao.getInstance();
		GoodsVo goodsvo=goodsdao.select(vo.getGdlistnum());
		CompanyDao comdao=CompanyDao.getInstance();
		CompanyVo comvo=comdao.select(goodsvo.getCPNum());
		String id="allen1225";
		
		req.setAttribute("id", id);
		req.setAttribute("gdnum", gdnum);
		req.setAttribute("sumimg", vo.getGdsumary());
		req.setAttribute("compname", comvo.getCpName());
		req.setAttribute("list", list);
		req.getRequestDispatcher("/examples/detail.jsp").forward(req, resp);
	}
}
