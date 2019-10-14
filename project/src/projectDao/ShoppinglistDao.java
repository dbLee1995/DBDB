package projectDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import projectVo.GoodsDetailVo;
import projectVo.ShoppinglistVo;

public class ShoppinglistDao {
	private ShoppinglistDao() {}
	private static ShoppinglistDao dao=new ShoppinglistDao();
	public static ShoppinglistDao getInstance() {
		return dao;
	}
	public int getMaxNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(ordernum),0) as maxnum from shoppinglist";
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
	public int insert(ShoppinglistVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement upstmt=null;
		try {
			con=JdbcUtil.getConn();
			GoodsDetailVo gvo=new GoodsDetailVo();
			
			String usql="update goodsdetail "+ 
					"set gdstock=gdstock-(select sl.gdcount from goodsdetail gd,shoppinglist sl where gd.gdnum=? and sl.gdnum=?) "+ 
					"where gdnum=(select gd.gdnum from goodsdetail gd,shoppinglist sl where gd.gdnum=? and sl.gdnum=?)";
			
			String sql="insert into shoppinglist values(?,?,?,?,sysdate,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGdNum());
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, getMaxNum()+1);
			pstmt.setInt(4, vo.getGdCount());
			pstmt.setString(5, vo.getName());
			pstmt.setString(6, vo.getPhone());
			pstmt.setString(7, vo.getAddr());
			pstmt.setString(8, vo.getMsg());
			pstmt.setString(9, vo.getBuyway());
			pstmt.setInt(10, vo.getState());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
			JdbcUtil.close(upstmt);
		}
	}
	public ArrayList<ShoppinglistVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from shoppinglist";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<ShoppinglistVo> list=new ArrayList<ShoppinglistVo>();
			while(rs.next()) {
				ShoppinglistVo vo=
						new ShoppinglistVo(rs.getInt("gdnum"),
											rs.getString("id"),
											rs.getInt("ordernum"),
											rs.getInt("gdcount"),
											rs.getDate("regdate"),
											rs.getString("name"),
											rs.getString("phone"),
											rs.getString("addr"),
											rs.getString("msg"),
											rs.getString("buyway"),
											rs.getInt("state"));
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
	public int update(ShoppinglistVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update shoppinglist set gdcount=?,name=?,phone=?,addr=?,msg=?,buyway=?,state=? where gdnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGdCount());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddr());
			pstmt.setString(5, vo.getMsg());
			pstmt.setString(6, vo.getBuyway());
			pstmt.setInt(7, vo.getState());
			pstmt.setInt(8, vo.getGdNum());
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
			String sql="delete from shoppinglist where gdnum=?";
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
