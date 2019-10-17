package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.GoodsDetailDao;
import projectVo.GoodsDetailVo;
@WebServlet("/admin/goodsdetail")
public class GoodsDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&&cmd.equals("gdDetailinsert")) {
			gdDetailinsert(req, resp);
		}
		if(cmd!=null&&cmd.equals("introAdd")) {
			introAdd(req, resp);
		}
	}
	protected void gdDetailinsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
	//	int gdListNum=Integer.parseInt(req.getParameter("gdList"));
		String gdName=req.getParameter("gdName");
	//	int gdPrice=Integer.parseInt(req.getParameter("gdPrice"));
	//	int gdStock=Integer.parseInt(req.getParameter("gdStock"));
	//  int cpListNum=Integer.parseInt(req.getParameter("cpListNum"));
		String introFileAdd=req.getParameter("introFileAdd");
		String detailFileAdd=req.getParameter("detailFileAdd");
		// 파일 저장
//		System.out.println("1:"+gdListNum);
		System.out.println("2:"+gdName);
//		System.out.println("3:"+gdPrice);
	//	System.out.println("4:"+gdStock);
		System.out.println("5:"+introFileAdd);
		System.out.println("6:"+detailFileAdd);
		
		//db 저장
		GoodsDetailDao gddao=GoodsDetailDao.getInstance();
	//	GoodsDetailVo gdvo=new GoodsDetailVo(gdListNum, 0, gdName, gdPrice, gdStock, introFileAdd, detailFileAdd);
		//int n=gddao.insert(gdvo);
		//if(n>0) {
		//	resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp");
	//	}
	}
	protected void introAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
	
	}
}
