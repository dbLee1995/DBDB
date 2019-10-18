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
	public int getCount(int com,String list,int array,String keyword,
							int startnum,int endnum) {
		
		return 0;
	}
	public ArrayList<GoodsDetailVo> search(int com,String list,int array,
							String keyword,int startnum,int endnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmtMS=null;
		PreparedStatement pstmtHA=null;
		ResultSet rs=null;
		
		if(array==3) {
			
		}else if(array==4) {
			
		}
		
		try {
			con=JdbcUtil.getConn();
			String sql="select * from" + 
					" (" + 
					" select mb.*, rownum rnum from" + 
					" (" + 
					"    select gd.*, cpnum, gdlist" + 
					"    from goodsdetail gd, goods g"+
					"    where gd.gdlistnum=g.gdlistnum ";
			if(com!=0) {sql+=" and g.cpnum="+com;}
			if(list!=null && !list.equals("0")) {
				sql+=" and g.gdlist="+list;}
			if(keyword!=null && !keyword.equals("")) {
				sql+=" and gd.gdname like '%"+keyword+"%'";}
			if(array==0) {sql+=" order by gd.gdnum desc";}
			else if(array==1) {sql+=" order by gd.gdprice";}
			else if(array==2) {sql+=" order by gd.gdprice desc";}
					
			sql+= " ) mb" + 
				  " ) where rnum>=? and rnum<=?";
			
			
			return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			se.printStackTrace();
			return null;	
		}finally {
			JdbcUtil.close(con, pstmt, rs);
		}
	}
	public int insert(GoodsDetailVo vo) {
		System.out.println("aaaaaaaaa");
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JdbcUtil.getConn();
			String sql="insert into goodsdetail values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getGdlistnum());
			pstmt.setInt(2, getMaxNum()+1);
			pstmt.setString(3, vo.getGdname());
			pstmt.setInt(4, vo.getGdprice());
			pstmt.setInt(5, vo.getGdstock());
			pstmt.setString(6, vo.getGddetail());
			pstmt.setString(7, vo.getGdsumary());
		 int n= pstmt.executeUpdate();
		 System.out.println(n);
		 return n;
		}catch(SQLException se) {
			se.printStackTrace();
			return -1;
		}finally {
			JdbcUtil.close(con, pstmt, null);
		}
	}
	public ArrayList<GoodsDetailVo> select(String strdetail, int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			ArrayList<GoodsDetailVo> list=new ArrayList<GoodsDetailVo>();
			if(strdetail.equals("gdprice")) {
				con=JdbcUtil.getConn();
				String sql="select * from goodsdetail order by "+strdetail+" desc";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					GoodsDetailVo vo=
							new GoodsDetailVo(rs.getInt("gdlistnum"),
											rs.getInt("gdnum"),
											rs.getString("gdname"),
											rs.getInt("gdprice"),
											rs.getInt("gdstock"),
											rs.getString("gddetail"),
											rs.getString("gdsumary"));
					list.add(vo);
				}
			}else {
				con=JdbcUtil.getConn();
				String sql="select * from goodsdetail where "+strdetail+"=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					GoodsDetailVo vo=
							new GoodsDetailVo(rs.getInt("gdlistnum"),
											rs.getInt("gdnum"),
											rs.getString("gdname"),
											rs.getInt("gdprice"),
											rs.getInt("gdstock"),
											rs.getString("gddetail"),
											rs.getString("gdsumary"));
					list.add(vo);
				}
			}
			return list;
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
			String sql="select * from goodsdetail order by gdlistnum";
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
											rs.getString("gddetail"),
											rs.getString("gdsumary"));
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
			String sql="update goodsdetail set gdname=?,gdprice=?,gdstock=?,gddetail=?,gdsumary=? where gdnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getGdname());
			pstmt.setInt(2, vo.getGdprice());
			pstmt.setInt(3, vo.getGdstock());
			pstmt.setString(4, vo.getGddetail());
			pstmt.setString(5, vo.getGdsumary());
			pstmt.setInt(6, vo.getGdnum());
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
