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

import projectDao.CompanyDao;
import projectDao.GoodsDao;
import projectVo.CompanyVo;
import projectVo.GoodsVo;
@WebServlet("/admin/goods")
public class GoodsController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&& cmd.equals("cpList")) {
			cpList(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdCheck")){
			gdCheck(req, resp);
		}
		if(cmd!=null&&cmd.equals("gdInsert")) {
			gdInsert(req, resp);
		}
	}
	protected void cpList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		JSONArray arr=new JSONArray();
		GoodsDao dao=GoodsDao.getInstance();
		CompanyDao cpdao=CompanyDao.getInstance();
		ArrayList<CompanyVo> list=cpdao.selectAll();
		arr.put(list);
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
	}
	protected void gdCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		int cpListNum=Integer.parseInt(req.getParameter("cpListNum"));
		String gdList=req.getParameter("gdList");
		GoodsDao gdao=GoodsDao.getInstance();
		GoodsVo gvo=gdao.cpSelect(cpListNum,gdList);
		JSONObject json=new JSONObject();
		boolean using=false;
		if(gvo!=null) {
			using=true;
		}
		json.put("using", using);
		PrintWriter pw=resp.getWriter();
		pw.print(json);

	}
	protected void gdInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		String gdList=req.getParameter("gdList");
		
		
		
		
	}
}
