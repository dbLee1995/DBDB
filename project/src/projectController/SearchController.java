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

@WebServlet("/search")
public class SearchController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		String keyword=req.getParameter("keyword");
		
		String companyS=req.getParameter("company");
		int company=0;
		if(companyS!=null && !companyS.equals("")) {
			company=Integer.parseInt(companyS);
		}
		String list=req.getParameter("list");
		String arrayS=req.getParameter("array");
		int array=0;
		if(arrayS!=null && !arrayS.equals("")) {
			array=Integer.parseInt(arrayS);
		}
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null && !spageNum.equals("")) {
			pageNum=Integer.parseInt(spageNum);
		}
		int endRow=pageNum*10;
		int startRow=endRow-9;
		
		GoodsDetailDao gdao=GoodsDetailDao.getInstance();
		ArrayList<GoodsDetailVo> gdvolist=gdao.search(company, list, array, keyword, startRow, endRow);
		
		int pageCount=(int)Math.ceil(gdao.getCount(company, list, array, keyword, startRow, endRow)/10.0);
		int startPageNum=(pageNum-1)/10*10+1;
		int endPageNum=startPageNum+9;
		if(endPageNum>pageCount) endPageNum=pageCount;
		
		req.setAttribute("keyword", keyword);
		req.setAttribute("company", company);
		req.setAttribute("list", list);
		req.setAttribute("array", array);
		
		req.setAttribute("gdvolist", gdvolist);
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageCount", pageCount);
		
		req.getRequestDispatcher("/examples/search.jsp").forward(req, resp);
	}
}
