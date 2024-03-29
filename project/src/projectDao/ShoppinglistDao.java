package projectDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.JdbcUtil;
import projectVo.GoodsDetailVo;
import projectVo.OrdernumInfoVo;
import projectVo.ShoppinglistVo;

public class ShoppinglistDao {
	private ShoppinglistDao() {}
	private static ShoppinglistDao dao=new ShoppinglistDao();
	public static ShoppinglistDao getInstance() {
		return dao;
	}
	public static int getMaxNum() {
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
	public static int getMaxNumSeq() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select NVL(max(snum),0) as maxnum from shoppinglist";
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
		try {
			con=JdbcUtil.getConn();
			String sql="insert into shoppinglist values(?,?,?,?,?,sysdate,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, getMaxNumSeq()+1);
			pstmt.setInt(2, vo.getGdNum());
			pstmt.setString(3, vo.getId());
			pstmt.setInt(4, vo.getOrderNum());
			pstmt.setInt(5, vo.getGdCount());
			pstmt.setString(6, vo.getName());
			pstmt.setString(7, vo.getPhone());
			pstmt.setString(8, vo.getAddr());
			pstmt.setString(9, vo.getMsg());
			pstmt.setString(10, vo.getBuyway());
			pstmt.setInt(11, vo.getState());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public ArrayList<ShoppinglistVo> select(String id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from shoppinglist where id=? order by ordernum";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			ArrayList<ShoppinglistVo> list=new ArrayList<ShoppinglistVo>();
			while(rs.next()) {
				ShoppinglistVo vo=
						new ShoppinglistVo(rs.getInt("snum"),
											rs.getInt("gdnum"),
											rs.getString("id"),
											rs.getInt("ordernum"),
											rs.getInt("gdcount"),
											rs.getDate("regdate"),
											rs.getString("name"),
											rs.getString("email"),
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
	public ShoppinglistVo select(int snum){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from shoppinglist where snum=? order by ordernum";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, snum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ShoppinglistVo vo=
						new ShoppinglistVo(rs.getInt("snum"),
											rs.getInt("gdnum"),
											rs.getString("id"),
											rs.getInt("ordernum"),
											rs.getInt("gdcount"),
											rs.getDate("regdate"),
											rs.getString("name"),
											rs.getString("email"),
											rs.getString("addr"),
											rs.getString("msg"),
											rs.getString("buyway"),
											rs.getInt("state"));
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
	public ShoppinglistVo selectOrdernum(int ordernum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from shoppinglist where ordernum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ShoppinglistVo vo=
						new ShoppinglistVo(rs.getInt("snum"),
											rs.getInt("gdnum"),
											rs.getString("id"),
											rs.getInt("ordernum"),
											rs.getInt("gdcount"),
											rs.getDate("regdate"),
											rs.getString("name"),
											rs.getString("email"),
											rs.getString("addr"),
											rs.getString("msg"),
											rs.getString("buyway"),
											rs.getInt("state"));
				return vo;
			}
			return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public ArrayList<ShoppinglistVo> gdnameselectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select sp.*,gd.gdname from shoppinglist sp, goodsdetail gd where sp.gdnum=gd.gdnum order by ordernum";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<ShoppinglistVo> list=new ArrayList<ShoppinglistVo>();
			while(rs.next()) {
				ShoppinglistVo vo=
						new ShoppinglistVo(rs.getInt("snum"),
											rs.getInt("gdnum"),
											rs.getString("id"),
											rs.getInt("ordernum"),
											rs.getInt("gdcount"),
											rs.getDate("regdate"),
											rs.getString("name"),
											rs.getString("email"),
											rs.getString("addr"),
											rs.getString("msg"),
											rs.getString("buyway"),
											rs.getInt("state"),
											rs.getString("gdname"));
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
	public ArrayList<ShoppinglistVo> selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select * from shoppinglist order by ordernum";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<ShoppinglistVo> list=new ArrayList<ShoppinglistVo>();
			while(rs.next()) {
				ShoppinglistVo vo=
						new ShoppinglistVo(rs.getInt("snum"),
											rs.getInt("gdnum"),
											rs.getString("id"),
											rs.getInt("ordernum"),
											rs.getInt("gdcount"),
											rs.getDate("regdate"),
											rs.getString("name"),
											rs.getString("email"),
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
	public ArrayList<OrdernumInfoVo> getOrdernumInfo(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JdbcUtil.getConn();
			String sql="select ordernum, count(ordernum) as count from shoppinglist" + 
					" group by ordernum";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<OrdernumInfoVo> list=new ArrayList<OrdernumInfoVo>();
			while(rs.next()) {
				OrdernumInfoVo vo=
						new OrdernumInfoVo(rs.getInt("ordernum"),
											rs.getInt("count"));
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			se.printStackTrace();
			return null;
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int update(ShoppinglistVo vo, int snum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update shoppinglist set gdcount=?,name=?,email=?,addr=?,msg=?,buyway=?,state=? where snum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGdCount());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddr());
			pstmt.setString(5, vo.getMsg());
			pstmt.setString(6, vo.getBuyway());
			pstmt.setInt(7, vo.getState());
			pstmt.setInt(8, vo.getSnum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public int update(int snum, int state) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="update shoppinglist set state=? where snum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, state);
			pstmt.setInt(2, snum);
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
			String sql="delete from shoppinglist where snum=?";
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
