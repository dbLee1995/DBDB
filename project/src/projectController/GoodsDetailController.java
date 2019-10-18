package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import projectDao.CompanyDao;
import projectDao.GoodsDao;
import projectDao.GoodsDetailDao;
import projectVo.CompanyVo;
import projectVo.GoodsDetailVo;
import projectVo.GoodsVo;
@WebServlet("/admin/goodsdetail")
public class GoodsDetailController extends HttpServlet{
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&&cmd.equals("gdDetailinsert")) {
			gdDetailinsert(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdDetailPreview")) {
			gdDetailPreview(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdDetailList")) {
			gdDetailList(req, resp);
		}
		
	}
	protected void gdDetailList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		int cpNum=Integer.parseInt(req.getParameter("cpNum"));
		GoodsDao gdao=GoodsDao.getInstance();
		GoodsVo gvo=gdao.select(cpNum);
		int gdListNum=gvo.getGDListNum();
		
		GoodsDetailDao gddao=GoodsDetailDao.getInstance();
		
		
		
		
	}
	protected void gdDetailinsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	     String saveDirectory = "C:/Users/JHTA/Desktop/project/WebContent/images";
	     MultipartRequest mr=new MultipartRequest(
	                             req,//request 객체
	                             saveDirectory, //업로드할 디렉토리 경로
	                             1024*1024*10,//최대 업로드 크기 (byte단위 ->5MB로 설정함)
	                             "utf-8",//인코딩 방식
	                             new DefaultFileRenamePolicy()//동일한 파일명이 존재할 시 파일명에 일련번호를 붙여서 파일 생성하는 객체
	                     );
		int gdListNum=Integer.parseInt(mr.getParameter("gdList"));
		String gdName=mr.getParameter("gdName");
		int gdPrice=Integer.parseInt(mr.getParameter("gdPrice"));
		int gdStock=Integer.parseInt(mr.getParameter("gdStock"));
		String introFileAdd=mr.getFilesystemName("introFileAdd");
		String detailFileAdd=mr.getFilesystemName("detailFileAdd");
		//db 저장
		GoodsDetailDao gddao=GoodsDetailDao.getInstance();
		GoodsDetailVo gdvo=new GoodsDetailVo(gdListNum, 0, gdName, gdPrice, gdStock, detailFileAdd, introFileAdd);
		int n=gddao.insert(gdvo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp");
		}
	}
	protected void gdDetailPreview(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		int cpNum=Integer.parseInt(req.getParameter("cpList"));
		int gdListNum=Integer.parseInt(req.getParameter("gdList"));
		String gdName=req.getParameter("gdName");
		int gdPrice=Integer.parseInt(req.getParameter("gdPrice"));
		int gdStock=Integer.parseInt(req.getParameter("gdStock"));
		String introFileAdd=req.getParameter("introFileAdd");
		String detailFileAdd=req.getParameter("detailFileAdd");
		
		CompanyDao cdao=CompanyDao.getInstance();
		CompanyVo cvo=cdao.select(cpNum);
		
		req.setAttribute("cvo", cvo);
		req.setAttribute("gdListNum", gdListNum);
		req.setAttribute("gdName", gdName);
		req.setAttribute("gdPrice", gdPrice);
		req.setAttribute("gdStock", gdStock);
		req.setAttribute("introFileAdd", introFileAdd);
		req.setAttribute("detailFileAdd", detailFileAdd);
		
		
		resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp");
		
		
	}
}
