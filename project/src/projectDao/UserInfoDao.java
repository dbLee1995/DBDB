package projectDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import projectVo.UserInfoVo;

public class UserInfoDao {
	private UserInfoDao() {}
	private static UserInfoDao dao=new UserInfoDao();
	public static UserInfoDao getInstance() {
		return dao;
	}
	public int insert(UserInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into userinfo values(?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getFname());
			pstmt.setString(3, vo.getLname());
			pstmt.setString(4, vo.getAddr());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public UserInfoVo select(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from userinfo where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				UserInfoVo vo=
						new UserInfoVo(rs.getString("id"),
									rs.getString("fname"),
									rs.getString("lname"),
									rs.getString("addr"));
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
	public ArrayList<UserInfoVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from userinfo";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<UserInfoVo> list=new ArrayList<UserInfoVo>();
			while(rs.next()) {
				UserInfoVo vo=
						new UserInfoVo(rs.getString("id"),
								rs.getString("fname"),
								rs.getString("lname"),
								rs.getString("addr"));
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
	public int update(UserInfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update userinfo set fname=?,lname=?,addr=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getFname());
			pstmt.setString(2, vo.getLname());
			pstmt.setString(3, vo.getAddr());
			pstmt.setString(4, vo.getId());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int delete(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="delete from userinfo where id=?";
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
