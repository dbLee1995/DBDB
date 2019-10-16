package projectController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectDao.AccountDao;
import projectDao.UserInfoDao;
import projectVo.AccountVo;
import projectVo.UserInfoVo;

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
		String email=req.getParameter("email");
		String addr=req.getParameter("addr");
		String buyway=req.getParameter("bwvalue");
		int point=Integer.parseInt(req.getParameter("point"));
		String msg=req.getParameter("msg");
		
		AccountDao adao=AccountDao.getInstance();
		AccountVo avo=adao.select(id);
		AccountVo auvo=new AccountVo(id,avo.getPwd(),email,point);
		adao.update(auvo);
		
		UserInfoDao udao=UserInfoDao.getInstance();
		UserInfoVo uvo=udao.select(id);
		UserInfoVo uuvo=new UserInfoVo(id,uvo.getFname(),uvo.getLname(),addr);
		udao.update(uuvo);
	}
	protected void guest(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		
	}
}
