package begin.chap03;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/personInterestResult.do")
public class PersonInterestResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		// 전송되어져온 방식(method)이 GET인지 POST인지 알아오기 
		String method = request.getMethod();
		
		String name = request.getParameter("name");
		String school = request.getParameter("school");
		String color = request.getParameter("color");
		String[] foodNumArr = request.getParameterValues("food");
		
		String foodImages="";
		
		if(foodNumArr!= null) {
			
			String[] foodImgFilenameArr = new String[foodNumArr.length];
			
			for(int i=0; i<foodNumArr.length; i++) {
				switch (foodNumArr[i]) {
					case "1": // 자장면
						foodImgFilenameArr[i] = "jjm.png";	// 배열이 i라면 해당  이미지를 보여줘라
						break;
					case "2": // 짬뽕
						foodImgFilenameArr[i] = "jjbong.png";
						break;
					case "3": // 탕수육
						foodImgFilenameArr[i] = "tangsy.png";
						break;
					case "4": // 양장피
						foodImgFilenameArr[i] = "yang.png";
						break;
					case "5": // 팔보채
						foodImgFilenameArr[i] = "palbc.png";
						break;
				}
			}
			foodImages = String.join(",", foodImgFilenameArr);  // foodImgFilenameArr를 스트링 타입으로 바꾸고 구분자 콤마 , 로 구분한다.
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("method", method);
		map.put("name", name);
		map.put("school", school);
		map.put("color", color);
		map.put("foodImages", foodImages);
		
		
		// !!! === request는 또한 저장소 기능을 가지고 있다 === !!! //
		request.setAttribute("map",map); // (key값, value값)
		// request 저장영역에 데이터 map을 "map"이라는 키이름으로 저장해두었다.
		
		/*
			MVC
			M->Model단(DB와 관련도니 업무를 처리해주는 곳->DAO클래스,DTO클래스)
			V->View단(결과물을 보여주는 곳->.jsp)
			C->Controller단(서블릿클래스 .java)
		*/
		
		/// !!! === View단(.jsp 파일) 지정하기 === !!! ///
		RequestDispatcher dispatcher = request.getRequestDispatcher("/01begin/chap03/personInterestResult.jsp"); // 파라미터 패스가 경로를 알려달라는 뜻...  이름 복사해서 /MyMVC/WebContent/ 지워야함 
		dispatcher.forward(request, response); //forward 저장소에 있던 것을 넘겨주겠다는 뜻. /01begin/chap03/personInterestResult.jsp"에만 넘겨주겠다.
		// 뷰단을 알고 있는 dispatcher에 request,respons 넘겨주겠다.
		
		/* 웹브라우저 상에서 URL 주소는 그대로 /personInterestResult.do 인데
		     웹브라우저 상에 보여지는 내용물은  "/01begin/chap03/personInterestResult.jsp"의 내용이 보여진다.
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

			doGet(request, response);
		}

}
