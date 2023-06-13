package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloSevlet
 */
@WebServlet("/hello")
public class HelloSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문서의 컨텐츠 유형 - 한글 인코딩
		response.setContentType("text/html; charset=utf-8");
		
		//출력 스트림 out 객체 생성
		//서버에서 페이지로 보낸거임
		PrintWriter out = response.getWriter();
		
		out.println("Hello~ Sevlet!<br>");
		out.println("안녕~ Sevlet!");
	}
	
	public void destroy() {
		System.out.println("destroy() 호출");
	}

}
