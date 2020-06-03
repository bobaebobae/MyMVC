package begin.chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Get_postMethodTest4
 */



//확장자가 .java와 .xml은 web에서 경로를 알려줄 때 앞에 / 슬래시를 붙이면 앞에  ContextName  /MyMVC가 생략되어있음.
//확장자가 .jsp와 .html은 반드시 ContextName   /MyMVC를 꼭 써줘야 함.

@WebServlet("/get_postMethodTest4.do")
public class Get_postMethodTest4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// 웹브라우저에 아래와 같이 써주겠다는 말이다. 
		// Served at: /MyMVC
		
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
		   out.printf("<span style='color: green; font-weight: bold'>%s님의 개인성향은<br/><br/></span>", name);
		   
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
