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
	public int insert(QnaVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into goodsdetail values(?,?,?,?,sysdate,?,sysdate,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getCategory());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getAnswer());
			pstmt.setInt(6, vo.getAnswerstate());
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
						new QnaVo(rs.getString("id"),
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
						new QnaVo(rs.getString("id"),
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
}
