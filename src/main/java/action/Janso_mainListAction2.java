package action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.Janso_ListService;
import svc.Janso_product_registrationService;
import vo.Janso_product_registration;
import vo.ActionForward;


public class Janso_mainListAction2 implements jansoAction {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ArrayList<Janso_product_registration> articleList=new ArrayList<Janso_product_registration>();
		ArrayList<Janso_product_registration> articleList2=new ArrayList<Janso_product_registration>();
	
		String addp ="서울";
		
		if( request.getParameter("addp")!=null){
			addp = request.getParameter("addp");
		}
		
		//System.out.println(addp);
		
		
		
		
		Janso_ListService janso_mainListService = new Janso_ListService();
		
		articleList = janso_mainListService.getArticleList(addp);
		articleList2 = janso_mainListService.getArticleListall();
		
		ServletContext context = request.getServletContext();
		String directory = context.getRealPath("/jansoproduct"); 
		request.setAttribute("directory", directory);
		
	
//		StringBuilder sb = new StringBuilder("["); //[{"key" : value, "key" : "value"}, {"key" : value, "key" : "value"},.........]
//		for(int i = 0 ; i < articleList.size();i++ ){
//			sb.append("{");
//			sb.append("\"a\" : "+int+",");
//			sb.append("\"b\" : \""++"\"");
//			sb.append("}");
//		}
		
//		String json = "[\"apple\", \"banana\", \"orange\"]";
//		JSONArray jsonArray = new JSONArray(json);
//		String firstElement = jsonArray.getString(1);
//		System.out.println(firstElement); // 출력 결과: "apple"
//		request.setAttribute("fruits", jsonArray);
		
		System.out.println(articleList.size() + "길이");
		
		JSONArray jsonArray = new JSONArray(articleList);	
		String jsondata = jsonArray.toString();
		
		for(int i = 0; i < articleList.size(); i++)
		{
			System.out.println(jsondata);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsondata);
		
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("articleList2", articleList2);
		ActionForward forward= new ActionForward();
   		forward.setPath("janso_main.jsp");
   		return forward;
   		
	 }
		
}  	


