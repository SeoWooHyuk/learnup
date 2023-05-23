package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.TalentDAO;
import vo.TalentDataType;

public class TalentListService {

	public int getListCount() throws Exception {
		int listCount = 0;
		Connection con = getConnection();
		TalentDAO talentDAO = TalentDAO.getInstance();
		talentDAO.setConnection(con);
		listCount = talentDAO.selectListCount();
		close(con);
		return listCount;

	}

	public ArrayList<TalentDataType> getArticleList(int category,int page, int limit) throws Exception {

		System.out.println("재능판매 : "+page);
		ArrayList<TalentDataType> articleList = null;
		Connection con = getConnection();
		TalentDAO talentDAO = TalentDAO.getInstance();
		talentDAO.setConnection(con);
		articleList = talentDAO.selectArticleList(category, page, limit);
		
		System.out.println(articleList.size()+"재능판매 서비스 단 사이즈크기");
		close(con);
		return articleList;

	}
	
}
