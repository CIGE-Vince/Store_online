package com.eshore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import com.eshore.pojo.Goods;
import com.eshore.tag.PageObject;
import com.eshore.utils.SetPageObject;

public class GoodDaoImpl implements GoodDao {

	private Connection conn = null; // 数据库连接对象
	private PreparedStatement pstmt = null; // 数据库操作对象
	ResultSet rs = null;
	// 通过构造方法取得数据库连接
	public GoodDaoImpl(Connection conn) { 
		this.conn = conn;  
	}
	//向数据库中插入商品数据
	public int addGood(Goods good) throws Exception{
		String sql = "insert into goods(gname,gphoto,kinds,types,producer,"
				+ "price,carriage,pdate,paddress,described) values(?,?,?,?,?,?,?,?,?,?)";
		int result = 0;
		this.pstmt = this.conn.prepareStatement(sql);//获取PreparedStatement对象
		this.pstmt.setString(1, good.getGname());//设定商品名称
		this.pstmt.setString(2, good.getGphoto());//设定商品照片
		this.pstmt.setString(3, good.getKinds());//设定商品类别
		this.pstmt.setString(4, good.getTypes());//设定商品型号
		this.pstmt.setString(5, good.getProducer());//设定商品生产者
		this.pstmt.setFloat(6, good.getPrice());//设定商品价格
		this.pstmt.setFloat(7, good.getCarriage());//设定商品运费
		this.pstmt.setDate(8, good.getPdate());//设定商品生产日期
		this.pstmt.setString(9, good.getPaddress());//设定商品生产地址
		this.pstmt.setString(10, good.getDescribed());
		result = this.pstmt.executeUpdate();//执行数据库操作
		this.pstmt.close();
		return result;
	}

	public int deleteGood(int gid) throws Exception{
		String sql = "delete from goods whser gid=?";
		int result = 0;
		this.pstmt = this.conn.prepareStatement(sql);//获取PreparedStatement对象
		this.pstmt.setInt(1, gid);
		result = this.pstmt.executeUpdate();//执行数据库操作
		this.pstmt.close();
		return result;
	}

	public Vector<Goods> queryAll(String keyWord, String keyClass) throws Exception{
		Vector<Goods> goodVector = new Vector<Goods>();
		String sql = "select gid,gname,gphoto,kinds,types,producer,"
				+ "price,carriage,pdate,paddress,described from goods ";
		if(keyClass!=null&&!"".equals(keyClass)){
			if("1".equals(keyClass)){//商品名称查询
				sql = "select gid,gname,gphoto,kinds,types,producer,"
					+ "price,carriage,pdate,paddress,described from goods where gname like '%"
					 +keyWord+"%' ";
			}else if("2".equals(keyClass)){//按照商品种类查询
				sql = "select gid,gname,gphoto,kinds,types,producer,"
					+ "price,carriage,pdate,paddress,described from goods where kinds like '%"
					 +keyWord+"%' ";
			}
		}
		this.pstmt = this.conn.prepareStatement(sql);//获取PreparedStatement对象
		rs = this.pstmt.executeQuery();//执行数据库操作
		while (rs.next()) { 
			Goods good = new Goods();
			good.setGid(rs.getInt(1));
			good.setGname(rs.getString(2));//设定商品名称
			good.setGphoto(rs.getString(3));//设定商品照片
			good.setKinds(rs.getString(4));//设定商品类别
			good.setTypes(rs.getString(5));//设定商品型号
			good.setProducer(rs.getString(6));//设定商品生产者
			good.setPrice(rs.getFloat(7));//设定商品价格
			good.setCarriage(rs.getFloat(8));//设定商品运费
			good.setPdate(rs.getDate(9));//设定商品生产日期
			good.setPaddress(rs.getString(10));//设定商品生产地址
			good.setDescribed(rs.getString(11));//设定商品描述
			goodVector.add(good);
		}
		rs.close();
		this.pstmt.close();
		return goodVector;
	}

	public int updateGood(Goods good) throws Exception{
		String sql = "update goods set gname=?,gphoto=?,kinds=?,types=?,producer=?,"
				+ "price=?,carriage=?,pdate=?,paddress=?,described=? where gid=?";
		int result = 0;
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, good.getGname());//设定商品名称
		this.pstmt.setString(2, good.getGphoto());//设定商品照片
		this.pstmt.setString(3, good.getKinds());//设定商品类别
		this.pstmt.setString(4, good.getTypes());//设定商品型号
		this.pstmt.setString(5, good.getProducer());//设定商品生产者
		this.pstmt.setFloat(6, good.getPrice());//设定商品价格
		this.pstmt.setFloat(7, good.getCarriage());//设定商品运费
		this.pstmt.setDate(8, good.getPdate());//设定商品生产日期
		this.pstmt.setString(9, good.getPaddress());//设定商品生产地址
		this.pstmt.setString(10, good.getDescribed());//设定商品描述
		this.pstmt.setInt(11, good.getGid());
		result = this.pstmt.executeUpdate();
		this.pstmt.close();
		return result;
	}
    
	public PageObject getPageObject(String curPage,PageObject pageObject,List<Object> listObject){
		SetPageObject setPageObject = SetPageObject.getInstance();//获取分页对象PageObject
		pageObject = setPageObject.setPageObjectData(curPage, pageObject, listObject);
		return pageObject;
	}
	//根据商品id查询指定商品
	public Vector<Goods> queryGoodBySid(int sid) throws Exception {
		Vector<Goods> goodVector = new Vector<Goods>();
		String sql = "select gid,gname,gphoto,kinds,types,producer,"
				+ "price,carriage,pdate,paddress,described from goods where gid="+sid;
		this.pstmt = this.conn.prepareStatement(sql);//获取PreparedStatement对象
		rs = this.pstmt.executeQuery();//执行数据库操作
		while (rs.next()) { 
			Goods good = new Goods();
			good.setGid(rs.getInt(1));//设定商品ID
			good.setGname(rs.getString(2));//设定商品名称
			good.setGphoto(rs.getString(3));//设定商品照片
			good.setKinds(rs.getString(4));//设定商品类别
			good.setTypes(rs.getString(5));//设定商品型号
			good.setProducer(rs.getString(6));//设定商品生产者
			good.setPrice(rs.getFloat(7));//设定商品价格
			good.setCarriage(rs.getFloat(8));//设定商品运费
			good.setPdate(rs.getDate(9));//设定商品生产日期
			good.setPaddress(rs.getString(10));//设定商品生产地址
			good.setDescribed(rs.getString(11));//设定商品描述
			goodVector.add(good);
		}
		rs.close();
		this.pstmt.close();
		return goodVector;
	}
}
