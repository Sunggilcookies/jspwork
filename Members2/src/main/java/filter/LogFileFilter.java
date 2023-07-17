package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	
	PrintWriter writer;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename");
		if(filename == null) {
			throw new ServletException("로그파일의 이름을 찾을 수 없습니다."); //강제로 예외 발생
		}
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그파일을 읽을 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//콘솔에 기록 내용
		String clientAddr = request.getRemoteAddr(); //IP 주소
		writer.printf("클라이언트 IP 주소: %s %n", clientAddr); 
		
		long start = System.currentTimeMillis();
		writer.println("접근한 url 경로" + getURLPATH(request));
		writer.println("요청 처리 시작 시각: " + getCurrentTime());
		chain.doFilter(request, response); //필터 처리
		
		long end = System.currentTimeMillis();
		writer.println("요청 처리 종료 시각: " + getCurrentTime());
		writer.println("요청 처리 종료 시각: " + (end-start) +"ms");
		writer.println("===================================");
	}

	
	@Override
	public void destroy() {
		writer.close();
	}
	private String getURLPATH(ServletRequest request) {
		HttpServletRequest req;	//ServletRequest를 상속받은 인터페이스임
		String currentPath = "";
		String queryString = "";
		//다운 캐스팅
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request; //다운 캐스팅( 형변환)
			
			currentPath = req.getRequestURI(); //uri
			queryString = req.getQueryString(); // ? -> 쿼리스트링
			queryString = (queryString == null)? "" : "?" + queryString;
			
		}			
		return currentPath+queryString;
	}
	
	private String getCurrentTime() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter datetime =
				DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm: ss");
		
		return now.format(datetime);
	}
}

	
