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

import projectDao.ShoppinglistDao;
import projectVo.ShoppinglistVo;
@WebServlet("/admin/delivery")
public class DeliveryController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null&&cmd.equals("gdDeliveryList")) {
			gdDeliveryList(req, resp);
		}
	}
	protected void gdDeliveryList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		resp.setContentType("text/plain;charset=utf-8");
		ShoppinglistDao sdao=ShoppinglistDao.getInstance();
		ArrayList<ShoppinglistVo> list=sdao.selectAll();
		JSONArray arr=new JSONArray();
		for(int i=0;i<list.size();i++) {
			ShoppinglistVo svo=list.get(i);
			if(svo.getState()==1 || svo.getState()==2) {
				JSONObject json=new JSONObject();
				json.put("ordernum", svo.getOrderNum());
				json.put("gdname", svo.getName());
				json.put("gdcount", svo.getGdCount());
				json.put("id", svo.getId());
				json.put("name", svo.getName());
				json.put("addr", svo.getAddr());
				json.put("msg", svo.getMsg());
				json.put("state", svo.getState());
				arr.put(json);
			}
		}
		PrintWriter pw=resp.getWriter();
		pw.print(arr);
		
	}
}
