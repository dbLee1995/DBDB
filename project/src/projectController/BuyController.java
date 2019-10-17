package projectController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.AccountDao;
import projectDao.CartDao;
import projectDao.ShoppinglistDao;
import projectVo.AccountVo;
import projectVo.CartVo;
import projectVo.ShoppinglistVo;

@WebServlet("/buy")
public class BuyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		
		if(cmd!=null && cmd.equals("user")) {
			user(req, resp);
		}if(cmd!=null && cmd.equals("guest")) {
			guest(req, resp);
		}
	}
	protected void user(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String addr=req.getParameter("addr");
		String buyway=req.getParameter("bwvalue");
		int point=Integer.parseInt(req.getParameter("point"));
		int totalprice=Integer.parseInt(req.getParameter("totalprice"));
		int ordernum=Integer.parseInt(req.getParameter("ordernum"));
		String msg=req.getParameter("msg");
		
		double fpoint=totalprice*0.1;
		AccountDao adao=AccountDao.getInstance();
		AccountVo avo=adao.select(id);
		AccountVo auvo=new AccountVo(id,avo.getPwd(),avo.getEmail(),
								point+(int)fpoint);
		adao.update(auvo);
		
		CartDao cdao=CartDao.getInstance();
		ArrayList<CartVo> cvolist=cdao.selectAll();
		ShoppinglistDao sdao=ShoppinglistDao.getInstance();
		for(int i=0;i<cvolist.size();++i) {
			ShoppinglistVo svo=
					new ShoppinglistVo(0,cvolist.get(i).getGdNum(),
							id,ordernum,cvolist.get(i).getCount(),
							null,name,email,addr,msg,buyway,1);
			sdao.insert(svo);
		}
		cdao.deleteAll();
	}
	protected void guest(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
	}
}
