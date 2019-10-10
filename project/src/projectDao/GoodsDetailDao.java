package projectDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import projectVo.GoodsDetailVo;

public class GoodsDetailDao {
	private GoodsDetailDao() {}
	private static GoodsDetailDao dao=new GoodsDetailDao();
	public static GoodsDetailDao getInstance() {
		return dao;
	}
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(gdnum),0) as maxnum from goodsdetail";
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
	public int insert(GoodsDetailVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into goodsdetail values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGDListNum());
			pstmt.setInt(2, getMaxNum());
			pstmt.setString(3, vo.getGDName());
			pstmt.setInt(4, vo.getGDPrice());
			pstmt.setInt(5, vo.getGDStock());
			pstmt.setString(6, vo.getGDDetail());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public GoodsDetailVo select(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from goodsdetail where gdnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				GoodsDetailVo vo=
						new GoodsDetailVo(rs.getInt("gdlistnum"),
										rs.getInt("gdnum"),
										rs.getString("gdname"),
										rs.getInt("gdprice"),
										rs.getInt("gdstock"),
										rs.getString("gddetail"));
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
	public ArrayList<GoodsDetailVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from goodsdetail";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<GoodsDetailVo> list=new ArrayList<GoodsDetailVo>();
			while(rs.next()) {
				GoodsDetailVo vo=
						new GoodsDetailVo(rs.getInt("gdlistnum"),
											rs.getInt("gdnum"),
											rs.getString("gdname"),
											rs.getInt("gdprice"),
											rs.getInt("gdstock"),
											rs.getString("gddetail"));
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
	public int update(GoodsDetailVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update goodsdetail set gdname=?,gdprice=?,gdstock=?,gddetail=? where gdnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getGDName());
			pstmt.setInt(2, vo.getGDPrice());
			pstmt.setInt(3, vo.getGDStock());
			pstmt.setString(4, vo.getGDDetail());
			pstmt.setInt(5, vo.getGDNum());
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
			String sql="delete from goodsdetail where gdnum=?";
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
