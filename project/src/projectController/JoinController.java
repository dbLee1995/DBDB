package projectController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import projectDao.AccountDao;
import projectVo.AccountVo;
@WebServlet("/join")
public class JoinController extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		if(cmd!=null && cmd.equals("check")) {
			check(req,resp);
		}
		if(cmd!=null && cmd.equals("insert")) {
			insert(req,resp);
		}
	}
	
	protected void check(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			resp.setContentType("text/plain;charset=utf-8");
			String id=req.getParameter("id");
			JSONObject json=new JSONObject();
			boolean idusing=false;
			AccountDao dao=AccountDao.getInstance();
			AccountVo vo=new AccountVo(id,null,null,0);
			vo=dao.select(id);

			ArrayList<AccountVo> list=new ArrayList<AccountVo>();
			if(vo!=null){
				idusing=true;
				list.add(vo);
				list.get(0);
				json.put("pwd", vo.getPwd());
			}
			json.put("idusing", idusing);
			PrintWriter pw=resp.getWriter();
			pw.println(json.toString());
		
	}
	protected void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id=(String)req.getParameter("id");
		String email=(String)req.getParameter("email");
		String pwd=(String)req.getParameter("pwd");
		AccountDao dao=AccountDao.getInstance();
		AccountVo vo=new AccountVo(id,pwd,email,0);
		PrintWriter pw=resp.getWriter();
		int n=dao.insert(vo);
		if(n>0) {
			pw.print("alert(\"가입완료\")");
			resp.sendRedirect("/index.html");
		}else {
			req.setAttribute("id", id);
			req.setAttribute("pwd", pwd);
			req.setAttribute("email", email);
			req.getRequestDispatcher("/join.html").forward(req, resp);
		}
	}
}
	/*
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("inputId4");
		String email=req.getParameter("inputEmail4");
		String pwd=req.getParameter("inputPassword4");
		String pwdr=req.getParameter("inputPasswordR4");
		
		AccountDao dao=AccountDao.getInstance();
		AccountVo vo=new AccountVo(id, pwd, email, 0);
		//유효성 - 아이디, 이메일, 비밀번호 일치 확인
		
				
	}
 */

