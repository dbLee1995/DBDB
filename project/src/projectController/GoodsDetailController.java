package projectController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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
		if(cmd!=null&&cmd.equals("gdDetailDelete")) {
			gdDetailDelete(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdPageCount")) {
			gdPageCount(req, resp);
		}
	}
	protected void gdDetailDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		int gdNum=Integer.parseInt(req.getParameter("gdNum"));
		GoodsDetailDao dao=GoodsDetailDao.getInstance();
		int n=dao.delete(gdNum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/admin/adindex.jsp?page=goodsdetailinfo.jsp");
		}
		
	}
	protected void gdPageCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		GoodsDetailDao gdao=GoodsDetailDao.getInstance();
		JSONObject json=new JSONObject();
		//전체 페이지 갯수
		int pagecount=(int)Math.ceil(gdao.getCount(0, null, 0, null, 0, 0)/10.0);
		json.put("pagecount",pagecount );
		PrintWriter pw=resp.getWriter();
		pw.print(json);
	}
	protected void gdDetailList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
	//	int cpNum=Integer.parseInt(req.getParameter("cpNum"));
		//	GoodsVo gvo=gdao.select(cpNum);
		//	int gdListNum=gvo.getGDListNum();
		//	String gdListCol=gdListNum+"";
		//ArrayList<GoodsDetailVo> list=gddao.select(gdListCol, gdListNum);
//		JSONObject cpjson=new JSONObject();
//		cpjson.put("cpNum", cpNum);
/*		for(int i=0;i<list.size();i++) {
			GoodsDetailVo gdvo=list.get(i);
			JSONObject json=new JSONObject();
			json.put("gdListNum", gdvo.getGdlistnum());
			json.put("gdNum", gdvo.getGdnum());
			json.put("gdName", gdvo.getGdnum());
			json.put("gdPrice", gdvo.getGdprice());
			json.put("gdStock", gdvo.getGdstock());
			json.put("gdDetail",gdvo.getGddetail());
			json.put("gdSumary", gdvo.getGdsumary());
	//		json.put("cpNum", cpNum);
			arr.put(json);	
		}
		*/
	//	arr.put(list);
	//	arr.put(json);
		//	ArrayList<GoodsDetailVo> list=gddao.selectAll();
//		arr.put(list);
	/*	String spagenum=req.getParameter("pagenum");
		int pagenum=1;
		if(spagenum!=null) {
			pagenum=Integer.parseInt("spagenum");
			System.out.println(pagenum);
		}
		*/
		
		//
	
		int pagenum=Integer.parseInt(req.getParameter("pagenum"));
		GoodsDetailDao gdao=GoodsDetailDao.getInstance();
		int startrow=(pagenum-1)*10+1;
		int endrow=startrow+9;
		ArrayList<GoodsDetailVo> list=gdao.search(0, null, 0, null, startrow, endrow);
		JSONArray arr=new JSONArray();
		arr.put(list);
		PrintWriter pw=resp.getWriter();
		pw.print(arr);

		
	}
	protected void gdDetailinsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   //  String saveDirectory = req.getContextPath()+"/WebContent/images";
	     String saveDirectory = "C:\\Users\\JHTA\\Desktop\\DBDB\\project\\WebContent\\images";
	     
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
