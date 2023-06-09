package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.TalentBuyDataType;
import vo.TalentDataType;
import vo.TalentLikeDataType;
import vo.TalentVersionDataType;

public class TalentDAO {

	DataSource ds;
	Connection con;
	private static TalentDAO talentDAO;
	

	public TalentDAO() {
	}

	public static TalentDAO getInstance(){
		if(talentDAO == null){
			talentDAO = new TalentDAO();
		}
		return talentDAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	public int insertArticle(TalentDataType talent, String[] keyword){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num =0;
		String sql="";
		int insertCount=0;

		try{
			pstmt=con.prepareStatement("select max(product_num) as 'num' from learnup.product");
			rs = pstmt.executeQuery();

			if(rs.next())
				num =rs.getInt("num")+1;
			else
				num=1;

			sql="insert into learnup.product(email, product_num, title, category,";
			sql+="keyword, service_descript, service_text,"+
					"recruit, image, image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9) "+
					"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			System.out.println("�����ͺ��̽� �̸��� : " + talent.getEmail());
			pstmt.setString(1, talent.getEmail());
			pstmt.setInt(2, num);
			pstmt.setString(3, talent.getTitle());
			pstmt.setInt(4, talent.getCategory());
			if (keyword != null) {
				pstmt.setString(5, String.join(", ", keyword));
			}
			if (talent.getService_descript() != null) {
				pstmt.setString(6, talent.getService_descript());
			} else {
			    pstmt.setNull(6, java.sql.Types.VARCHAR);
			}
			if (talent.getService_text() != null) {
				pstmt.setString(7, talent.getService_text());
			} else {
			    pstmt.setNull(7, java.sql.Types.VARCHAR);
			}
			if (talent.getRecruit() != null) {
				pstmt.setString(8, talent.getService_text());
			} else {
			    pstmt.setNull(8, java.sql.Types.VARCHAR);
			}
			System.out.println("�̹��� �̸� : " + talent.getImage());
			pstmt.setString(9, talent.getImage());
			
			if (talent.getImage_1() != null) {
			    pstmt.setString(10, talent.getImage_1());
			} else {
			    pstmt.setNull(10, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_2() != null) {
			    pstmt.setString(11, talent.getImage_2());
			} else {
			    pstmt.setNull(11, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_3() != null) {
			    pstmt.setString(12, talent.getImage_3());
			} else {
			    pstmt.setNull(12, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_4() != null) {
			    pstmt.setString(13, talent.getImage_4());
			} else {
			    pstmt.setNull(13, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_5() != null) {
			    pstmt.setString(14, talent.getImage_5());
			} else {
			    pstmt.setNull(14, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_6() != null) {
			    pstmt.setString(15, talent.getImage_6());
			} else {
			    pstmt.setNull(15, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_7() != null) {
			    pstmt.setString(16, talent.getImage_7());
			} else {
			    pstmt.setNull(16, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_8() != null) {
			    pstmt.setString(17, talent.getImage_8());
			} else {
			    pstmt.setNull(17, java.sql.Types.VARCHAR);
			}

			if (talent.getImage_9() != null) {
			    pstmt.setString(18, talent.getImage_9());
			} else {
			    pstmt.setNull(18, java.sql.Types.VARCHAR);
			}

			insertCount=pstmt.executeUpdate();
			
			System.out.println("talent insert �Ϸ� �Ǿ����ϴ�.");

		}catch(Exception ex){
			System.out.println(ex+"talent insert �����Դϴ�.");
		}finally{
			close(rs);
			close(pstmt);
		}

		return num;

	}
	
	public void insertVersion(int insertCount, TalentVersionDataType version) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		
		try{
			sql="insert into learnup.vers_info(product_num, vers_num, vers_title, vers_descript, vers_price, vers_date, recruit_num)";
			sql+="values(?, ?, ?, ?, ?, ?, ?)";
			
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, insertCount);
				pstmt.setInt(2, 1);
				pstmt.setString(3, version.getTitle());
				pstmt.setString(4, version.getDescript());
				pstmt.setInt(5, version.getPrice());
				pstmt.setInt(6, version.getDate());
				pstmt.setInt(7, version.getNum());
				
				pstmt.executeUpdate();
				
				System.out.println("talent version 1�� insert �Ϸ� �Ǿ����ϴ�.");

		}catch(Exception ex){
			System.out.println(ex+"talent version insert �����Դϴ�.");
		}finally{
			close(rs);
			close(pstmt);
		}
		
	}

	public int selectListCount() {
		// TODO Auto-generated method stub
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
			pstmt=con.prepareStatement("select count(*) from learnup.product");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){

		}finally{
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<TalentDataType> selectArticleList(int category, int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String board_list_sql="select*from learnup.product pr, learnup.information info, learnup.vers_info ve where pr.email = info.email and pr.product_num = ve.product_num and pr.category = ? order by pr.product_num asc limit ?,24;";
		ArrayList<TalentDataType> articleList = new ArrayList<TalentDataType>();
		TalentDataType talent = null;
		int startrow=(page-1)*24;

		System.out.println(category +"카테고리");
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, category);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				talent = new TalentDataType();
				talent.setProduct_num(rs.getInt("product_num"));
				talent.setTitle(rs.getString("title"));
				talent.setCategory(rs.getInt("category"));
				talent.setImage(rs.getString("image"));
				talent.setNickname(rs.getString("nickname"));
				talent.setPrice(rs.getInt("vers_price"));
				articleList.add(talent);
				
			}

		}catch(Exception ex){
			System.out.println(ex+"오류임");
		}finally{
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

//	public int updateReadCount(int product_num) {
//		PreparedStatement pstmt = null;
//		int updateCount = 0;
//		String sql="update board set BOARD_READCOUNT = "+
//				"BOARD_READCOUNT+1 where BOARD_NUM = "+product_num;
//
//		try{
//			pstmt=con.prepareStatement(sql);
//			updateCount = pstmt.executeUpdate();
//		}catch(SQLException ex){
//			System.out.println(ex+"�����Դϴ�.");
//		}
//		finally{
//			close(pstmt);
//
//		}
//
//		return updateCount;
//	}

	public TalentDataType selectArticle(int product_num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TalentDataType talentDataType = null;

		try{
			pstmt = con.prepareStatement(
					"select*from learnup.product pr, learnup.vers_info ve where pr.product_num = ve.product_num and pr.product_num = ?;");
			pstmt.setInt(1, product_num);
			rs= pstmt.executeQuery();
			

			if(rs.next()){
				talentDataType = new TalentDataType();
				talentDataType.setEmail(rs.getString("email"));
				talentDataType.setProduct_num(rs.getInt("product_num"));
				talentDataType.setTitle(rs.getString("title"));
				talentDataType.setCategory(rs.getInt("category"));
				if(rs.getString("keyword") != null) {
					talentDataType.setKeyword(rs.getString("keyword"));
				}
				if(rs.getString("service_descript") != null) {
					talentDataType.setService_descript(rs.getString("service_descript"));
				}if(rs.getString("service_text") != null) {
					talentDataType.setService_text(rs.getString("service_text"));
				}if(rs.getString("recruit") != null) {
					talentDataType.setRecruit(rs.getString("recruit"));
				}
				talentDataType.setImage(rs.getString("image"));
				talentDataType.setProduct_date(rs.getString("product_date"));
//				if(rs.getString("image_1") != null) {
//					talentDataType.setImage_1(rs.getString("image_1"));
//				}if(rs.getString("image_2") != null) {
//					talentDataType.setImage_2(rs.getString("image_2"));
//				}if(rs.getString("image_3") != null) {
//					talentDataType.setImage_3(rs.getString("image_3"));
//				}if(rs.getString("image_4") != null) {
//					talentDataType.setImage_4(rs.getString("image_4"));
//				}if(rs.getString("image_5") != null) {
//					talentDataType.setImage_5(rs.getString("image_5"));
//				}if(rs.getString("image_6") != null) {
//					talentDataType.setImage_6(rs.getString("image_6"));
//				}if(rs.getString("image_7") != null) {
//					talentDataType.setImage_7(rs.getString("image_7"));
//				}if(rs.getString("image_8") != null) {
//					talentDataType.setImage_8(rs.getString("image_8"));
//				}if(rs.getString("image_9") != null) {
//					talentDataType.setImage_9(rs.getString("image_9"));
//				}
				talentDataType.setImage_1(rs.getString("image_1"));
				talentDataType.setImage_2(rs.getString("image_2"));
				talentDataType.setImage_3(rs.getString("image_3"));
				talentDataType.setImage_4(rs.getString("image_4"));
				talentDataType.setImage_5(rs.getString("image_5"));
				talentDataType.setImage_6(rs.getString("image_6"));
				talentDataType.setImage_7(rs.getString("image_7"));
				talentDataType.setImage_8(rs.getString("image_8"));
				talentDataType.setImage_9(rs.getString("image_9"));
				talentDataType.setVers_num(rs.getInt("vers_num"));
				talentDataType.setVers_title(rs.getString("vers_title"));
				talentDataType.setVers_descript(rs.getString("vers_descript"));
				talentDataType.setPrice(rs.getInt("vers_price"));
				talentDataType.setVers_date(rs.getInt("vers_date"));
				talentDataType.setRecruit_num(rs.getInt("recruit_num"));
				System.out.println("�����Ϸ��.");
			}
		}catch(Exception ex){
			System.out.println(ex+"�����Դϴ�.");
		}finally{
			close(rs);
			close(pstmt);
		}

		return talentDataType;
	}

	public int buyinsertArticle(TalentBuyDataType buy) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;

		try{
			sql="insert into learnup.order(email, product_num, order_money, buy_way) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			System.out.println("�����ͺ��̽� �̸��� : " + buy.getEmail());
			pstmt.setString(1, buy.getEmail());
			pstmt.setInt(2, buy.getProduct_num());
			pstmt.setInt(3, buy.getOrder_money());
			pstmt.setString(4, buy.getBuy_way());

			insertCount=pstmt.executeUpdate();
			
			System.out.println("talent buy �Ϸ� �Ǿ����ϴ�.");

		}catch(Exception ex){
			System.out.println(ex+"talent buy �����Դϴ�.");
		}finally{
			close(rs);
			close(pstmt);
		}

		return insertCount;
	}

	public int insertLike(TalentLikeDataType like) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;
		
		try{
			sql="insert into learnup.like(email, product_num) values(?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, like.getEmail());
			pstmt.setInt(2, like.getProduct_num());

			insertCount=pstmt.executeUpdate();
			
			System.out.println("talent �� �Ϸ� �Ǿ����ϴ�.");
		}catch(Exception ex){
			System.out.println(ex+"talent �� �����Դϴ�.");
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public int deleteLike(TalentLikeDataType like) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount=0;
		
		try{
			sql="delete from learnup.like where email = ? and product_num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, like.getEmail());
			pstmt.setInt(2, like.getProduct_num());

			insertCount=pstmt.executeUpdate();
			System.out.println("talent �� �Ϸ� �Ǿ����ϴ�.");
			
		}catch(Exception ex){
			System.out.println(ex+"talent �� �����Դϴ�.");
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}
}
