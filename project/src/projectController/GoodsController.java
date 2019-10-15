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

import projectDao.GoodsDao;
import projectVo.GoodsVo;
@WebServlet("/admin/goods")
public class GoodsController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&& cmd.equals("goodsList")) {
			goodsList(req, resp);
		}
	}
	protected void goodsList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/plain;charset=utf-8");
		JSONArray arr=new JSONArray();
		GoodsDao dao=GoodsDao.getInstance();
		ArrayList<GoodsVo> list=dao.selectAll();
		arr.put(list);
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
	}
}
