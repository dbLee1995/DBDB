package projectDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import projectVo.NoticeVo;

public class NoticeDao {
	private NoticeDao() {}
	private NoticeDao dao=new NoticeDao();
	public NoticeDao getInstance() {
		return dao;
	}
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(ntnum),0) as maxnum from notice";
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
	public int insert(NoticeVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into goodsdetail values(?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, getMaxNum());
			pstmt.setString(2, vo.getNtTitle());
			pstmt.setString(3, vo.getNtContent());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public NoticeVo select(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from notice where ntnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				NoticeVo vo=
						new NoticeVo(rs.getInt("ntnum"),
										rs.getString("nttitle"),
										rs.getString("ntcontent"),
										rs.getDate("ntdate"));
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
	public ArrayList<NoticeVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from notice";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<NoticeVo> list=new ArrayList<NoticeVo>();
			while(rs.next()) {
				NoticeVo vo=
						new NoticeVo(rs.getInt("ntnum"),
									rs.getString("nttitle"),
									rs.getString("ntcontent"),
									rs.getDate("ntdate"));
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
	public int update(NoticeVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update notice set nttitle=?,ntcontent=? where ntnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getNtTitle());
			pstmt.setString(2, vo.getNtContent());
			pstmt.setInt(3, vo.getNtNum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int delete(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="delete from notice where ntnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
}
