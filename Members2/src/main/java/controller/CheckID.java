package controller;

import java.awt.print.PrinterAbortException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDAO;


@WebServlet("/checkid")
public class CheckID extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out= response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		int duplicateID= dao.duplicatedID(id);
		
		if(duplicateID==1) { //아이디가 중복되었으면
			out.println("not_useable"); //not_useable ㅊ문자전송
			
		}else {
			out.println("useable");
		}
		
		//boolean duplicateID= dao.duplicatedID(id);
//		
//		if(duplicateID==true) {
//			out.println("not_useable");
//			
//		}else {
//			out.println("useable");
//		}
		
	}

}
