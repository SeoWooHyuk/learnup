package action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletContext;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import svc.Janso_product_registrationService;
import vo.Janso_product_registration;
import vo.ActionForward;


public class Janso_product_registrationAction implements jansoAction {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		Janso_product_registration registration = null;
		
		String realFolder="";
		String saveFolder="/jansoproduct";
		
		ServletContext context = request.getServletContext();
		String directory = context.getRealPath("/jansoproduct"); 
		File dir = new File(directory);  //upload 폴더가 없는 경우 폴더를 만들어라
		if (!dir.exists()) dir.mkdirs();
		
		int fileSize=1024*1024*5;
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		List<String> list = new ArrayList<String>();
		String[] chkbox = multi.getParameterValues("group");  //시설물 채크박스 
		
		List<String> list2 = new ArrayList<String>();
		String[] chkbox2 = multi.getParameterValues("group2");  //휴일

		if(chkbox != null)
		{
			for( int i = 0; i < chkbox.length; i++ )
			{
				list.add(chkbox[i]);
			}
		}else
		{
			
		}
		
		if(chkbox2.length == 1)
		{
			list2.add(chkbox2[0]);
		}
		else
		{
			for( int i = 1; i < chkbox2.length; i++ )
			{
				list2.add(chkbox2[i]);
			}
		}
		
		String addCommaString = StringUtils.join(list, ",");
		
		String addCommaString2 = StringUtils.join(list2, ",");
		//System.out.println(addCommaString);
	
		String area1 = multi.getParameter("area1");
		String area2 = multi.getParameter("area2");
		String area3 = multi.getParameter("address2");
		String totaladdress = area1 +","+ area2 +","+ area3;
		
		registration = new Janso_product_registration();
		registration.setEmail(multi.getParameter("email"));
		//System.out.println(multi.getParameter("email"));
		
		registration.setRoom_title(multi.getParameter("roomtitle"));
		registration.setRoom_categories(multi.getParameter("select-box0")); //시설물선택
		registration.setRoom_area(multi.getParameter("spacearea")); //공간유형
		
		registration.setMin_personnel(multi.getParameter("select-box1")); //최소인원
		registration.setMax_personnel(multi.getParameter("select-box2")); //최대인원
		
		registration.setFacility_categories(addCommaString); //시설물선택체크
		
		registration.setRoom_address(totaladdress);	//주소
		
		registration.setOpen_time(multi.getParameter("select-box4")); //오픈시간
		registration.setClose_time(multi.getParameter("select-box5")); //마감시간
		registration.setReservationtime(multi.getParameter("select-box6")); //예약시간
		
		registration.setRoom_introduction(multi.getParameter("writes")); //공간소개
		registration.setRoom_precautions(multi.getParameter("writes2")); //유의사항
		
		registration.setHoliday(addCommaString2);  //휴일선택
		
		registration.setRoom_price(multi.getParameter("priceperhour").replace(",", "")); //가격
		registration.setPersonnel_price(multi.getParameter("timeperonce").replace(",", ""));
	
		registration.setMain_img(multi.getFilesystemName("coverimage0"));
		registration.setSub_img1(multi.getFilesystemName("coverimage1"));
		registration.setSub_img2(multi.getFilesystemName("coverimage2"));
		registration.setSub_img3(multi.getFilesystemName("coverimage3"));
		registration.setSub_img4(multi.getFilesystemName("coverimage4"));
		
		Janso_product_registrationService janso_product_registrationService = new Janso_product_registrationService();
		boolean isWriteSuccess = janso_product_registrationService.registArticle(registration);
		System.out.println(isWriteSuccess);
		
	
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fails')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("jangso.learnup.com");
		}
			
			
	

		return forward;
		
	}  	

}
