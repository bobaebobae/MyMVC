package begin.chap02;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 		※※ 서블릿 클래스를 작성할때 지켜야 할 규칙 3가지 ※※

	   1). 서블릿(Servlet) 클래스는 반드시
	       javax.servlet.http.HttpServlet 클래스를 부모 클래스로 상속을 받아야 한다.

	   2). 웹클라이언트의 요청 방식이 GET 방식으로 요청을 해오면 doGet() 메소드로 응답을 해주도록 코딩을 해야 하고,
		     웹클라이언트의 요청 방식이 POST 방식으로 요청을 해오면 doPost() 메소드로 응답을 해주도록 코딩을 해주어야 한다.
		     그러므로 반드시 doGet() 메소드와 doPost() 메소드를  Overriding(재정의)를 해주어야 한다.
		       
		   doGet()메소드와 doPost()메소드의 
		     	첫번째 파라미터는 HttpServletRequest 타입이고,
		     	두번째 파라미터는 HttpServletResponse 타입이다.    

	   3). 응답처리 결과인 HTML 문서는 doGet() 메소드, doPost() 메소드 모두 
	       	두번째 파라미터를 이용해서 출력해야 한다.
 */
/*
		=== Servlet : 웹서비스 기능을 해주는 자바 클래스 ===
		
		*** Servlet 이 되기 위한 조건은 3가지 규칙을 따라야 한다. ***
		1. javax.servlet.http.HttpServlet클래스를 상속 
		              
		2. 웹클라이언트의 요청방식(GET/POST/…)에 알맞는 메소드(doGet()/doPost()/…)를 오버라이드함
			      doGet() 메소드와 doPost() 메소드의 
			              첫번째 파라미터는 HttpServletRequest 타입이고,
			              두번째 파라미터는 HttpServletResponse 타입이다. 
		           
		3. 만약에  서블릿(Servlet)에서 결과물을 웹브라우저상에 출력하고자 한다라면 
		   doGet() 메소드와 doPost() 메소드 모두 
		           서블릿(Servlet)의 두번째 파라미터인 HttpServletResponse response 를 
		           사용하여 출력해준다.
*/
	
public class Get_postMethodTest3 extends HttpServlet { // HttpServlet  에 정의되어있는 접근제한자는  protected /public 이라고 되야한다....
		
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 	// get방식이라 doGet함   // requet는 입력도구/ response는 출력도구
		throws IOException { // 호출하는 쪽(WAS/웹컨테이너/톰캣)에서 exception 처리를 하겠다는 뜻!  대부분 이렇게 씀. 개발자가 굳이 할 필요 없음.  /기본적으로 항상 붙여줌.
		execute(request,response);
	}		 
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	// post방식이라 doPost함
		throws IOException {
		execute(request,response);
	}	
		
	
	private void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*
	    post 방식으로 넘어온 데이터중 영어는 글자가 안깨지지만,
	       한글은 글자모양이 깨져나온다.
	       그래서  post 방식에서 넘어온 한글 데이터가 글자가 안깨지게 하려면 
	       아래처럼 request.setCharacterEncoding("UTF-8"); 을 해야 한다.
	       주의할 것은 request.getParameter("변수명"); 보다 먼저 기술을 해주어야 한다는 것이다.      
	 */
	
	request.setCharacterEncoding("UTF-8");
	
	// HttpServletRequest request 객체는 전송되어져 온 데이터를 처리해주는 용도로 쓰인다. ( 전송되어져 온 것은 request가 몽땅 처리함)			
	   String name = request.getParameter("name");   // ☆★☆★☆★☆★ (name)은 input태그에 있는 name 값 의미. string 타입의 name 값  // 웹은 모든 것의 기본이 string 타입이다!!!!!!!!!!
	   String school = request.getParameter("school");	// 웹에서 전송해준 값을 그대로 읽어 옴 콘솔에서 확인!
	   String color = request.getParameter("color");
	   //String food = request.getParameter("food"); // food는 복수개 선택인데 위처럼 하면 한개만 보여줌. 복수개는 아래처럼  배열로 받아야 함.
	   String[] foodArr = request.getParameterValues("food"); // 복수개는 string[] 배열로!!!
	   
	   // *** 콘솔에 출력하기 시작 *** //
	   
	   request.getMethod();
	   // 전송방식을 알아오는 것
	   // GET 또는 POSTㅋ
	   
	   // *** 콘솔에 출력하기 끝 *** //
	   
	   // *** 웹브라우저에 출력하기 시작 *** //
	   response.setContentType("text/html; charset=UTF-8"); // 이거없으면 한글 깨져서 나옴
	   // HttpServletResponse response 객체는 넘어온 데이터를 조작해서 결과물을 나타내고자 할 때 쓰인다.
	   PrintWriter out = response.getWriter(); //필기구 쓰는 것, 쓰는 사람, 쓰는 애가 필요함. 리턴타입은 PrintWriter로 나옴  //  PrintWriter에서 빨간말 나오면 import 해줘 / 마우스 올리면 Unhandled exception type IOException 입출력 exception을 유발시킨다. 트라이캐치를 하거나. add throw 어쩌거 누르면 위 메소드에 throws IOException 생김.  
	   			// out은 웹브라우저에 기술하는 대상체라고 생각하자!
	   
	   out.println("<html>");	// 웹브라우저에 쓰겠다!
	   out.println("<head><title>개인 성향 테스트 결과화면</title></head>");
	   out.println("<body>");
	   out.println("<h2>개인 성향 테스트 결과(POST)</h2>");
	   out.printf("<span style='color: blue; font-weight: bold'>%s님의 개인성향은<br/><br/></span>", name);
	   
	   if(color != null) {
		   out.printf("학력은 %s 이며, %s 색을 좋아합니다<br/><br/>", school, color);
	   }else {
		   out.printf("학력은 %s 이며, 좋아하는 색이 없습니다. <br/><br/>", school);
	   }
	   
	   /*
	    	%d -->decimal 정수
	    	%f --> float 실수
	    	%s --> string 문자열
	    */
	   out.println("좋아하는 음식은 "); 
	   if(foodArr != null) {
		   for(int i=0; i<foodArr.length; i++) {
			   String comma = (i < foodArr.length-1)?",":"";
			   out.printf("%s", foodArr[i]);	// printf는 줄바꿈이 없음.
		   }
		   out.println(" 입니다.");
	   } else {
		   out.println("없습니다.");
	   }
	   
	   out.println("</body>");
	   out.println("</html>");
	

	}
		
}

