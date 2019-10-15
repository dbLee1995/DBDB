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

import projectDao.CartDao;
import projectDao.GoodsDetailDao;
import projectDao.ReviewDao;
import projectVo.CartVo;
import projectVo.GoodsDetailVo;
import projectVo.ReviewVo;

@WebServlet("/cart")
public class CartController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null && cmd.equals("list")) {
			list(req, resp);
		}if(cmd!=null && cmd.equals("insert")) {
			insert(req, resp);
			System.out.println("dd");
		}if(cmd!=null && cmd.equals("delete")) {
			delete(req, resp);
		}if(cmd!=null && cmd.equals("deleteall")) {
			deleteall(req, resp);
		}if(cmd!=null && cmd.equals("cartpage")) {
			
		}
	}
	protected void list(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		
		CartDao cdao=CartDao.getInstance();
		ArrayList<CartVo> list=cdao.selectAll();
		JSONArray arr=new JSONArray();
		arr.put(list);
		pw.print(arr);
	}
	protected void insert(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
	
		int gdnum=Integer.parseInt(req.getParameter("gdnum"));
		int count=Integer.parseInt(req.getParameter("count"));
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		
		CartDao cdao=CartDao.getInstance();
		CartVo cvo=new CartVo(0,gdnum,count,null);
		int n=cdao.insert(cvo);
		JSONObject json=new JSONObject();
		json.put("insert", n);
		pw.println(json);
	}
	protected void delete(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
	
		int cnum=Integer.parseInt(req.getParameter("cnum"));
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		
		CartDao cdao=CartDao.getInstance();
		int n=cdao.delete(cnum);
		JSONObject json=new JSONObject();
		json.put("delete", n);
		pw.println(json);
	}
	protected void deleteall(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException{
	
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		
		CartDao cdao=CartDao.getInstance();
		int n=cdao.deleteAll();
		JSONObject json=new JSONObject();
		json.put("deleteall", n);
		pw.println(json);
	}
}
