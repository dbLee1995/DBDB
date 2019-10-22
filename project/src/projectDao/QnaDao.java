package projectDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import projectVo.QnaVo;

public class QnaDao {
	private QnaDao() {}
	private static QnaDao dao=new QnaDao();
	public static QnaDao getInstance() {
		return dao;
	}
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(qnum),0) as maxnum from qna";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int num=rs.getInt("maxnum");
				return num;
			}else {
				return 0;
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int insert(QnaVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into qna values(?,?,?,?,?,sysdate,?,sysdate,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(0,getMaxNum()+1);
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getCategory());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getAnswer());
			pstmt.setInt(7, vo.getAnswerstate());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public QnaVo select(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from qna where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				QnaVo vo=
						new QnaVo(
								rs.getInt("qnum"),
								rs.getString("id"),
								rs.getString("category"),
								rs.getString("title"),
								rs.getString("content"),
								rs.getDate("regdate"),
								rs.getString("answer"),
								rs.getDate("answerdate"),
								rs.getInt("answerstate"));
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public QnaVo select(int qnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from qna where qnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				QnaVo vo=
						new QnaVo(
								rs.getInt("qnum"),
								rs.getString("id"),
								rs.getString("category"),
								rs.getString("title"),
								rs.getString("content"),
								rs.getDate("regdate"),
								rs.getString("answer"),
								rs.getDate("answerdate"),
								rs.getInt("answerstate"));
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<QnaVo> completeselectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select to_char(regdate,'YYYY/MM/DD HH:MI:SS')qdate,qna.* " + 
						  " from qna qna " + 
						  " where answerstate=3" +
					      " order by regdate";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<QnaVo> list=new ArrayList<QnaVo>();
			while(rs.next()) {
				QnaVo vo=
						new QnaVo(
								rs.getInt("qnum"),
								rs.getString("id"),
								rs.getString("category"),
								rs.getString("title"),
								rs.getString("content"),
								rs.getDate("regdate"),
								rs.getString("answer"),
								rs.getDate("answerdate"),
								rs.getInt("answerstate"));
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<QnaVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select to_char(regdate,'YYYY/MM/DD HH:MI:SS')qdate,qna.* " + 
						  " from qna qna " + 
					      " order by regdate";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<QnaVo> list=new ArrayList<QnaVo>();
			while(rs.next()) {
				QnaVo vo=
						new QnaVo(
								rs.getInt("qnum"),
								rs.getString("id"),
								rs.getString("category"),
								rs.getString("title"),
								rs.getString("content"),
								rs.getDate("regdate"),
								rs.getString("answer"),
								rs.getDate("answerdate"),
								rs.getInt("answerstate"));
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int delete(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="delete from qna where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int update(String answer,int answerstate) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			QnaVo qvo=new QnaVo();
			int state=qvo.getAnswerstate();
			String sql="update qna set answerstate=3, answer=?, answerdate=sysdate where answerstate=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, answerstate);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int update(int qnum, int state) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update qna set answerstate=? where qnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, state);
			pstmt.setInt(2, qnum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
