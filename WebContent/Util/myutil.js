// == 금액 세자리 마다 콤마를 리턴시켜주는 함수이다 == //
	function func_comma(num){	// 함수밖에 만들어 됨. 함수 안에서 함수 정의 못하고 변수만 가능 //(num)은 String 타입. 
		var sResult = "";
		if(isNaN(num)){
			// isNaN(문자/문자열) : 입력받은 문자/문자열이 숫자가 아니라면 true
			// isNaN(문자/문자열) : 입력받은 문자/문자열이 숫자라면 false
			// NaN : Not a Number 의미.
			alert("숫자가 아니군요!");
		}else{
			//alert("숫자 입니다!");
			//alert(num.length/3); => 3.3333333333333335
			//alert( parseInt(num.length/3) ); => 3
			var nBlockCount = 0;		// 세자리마다 분할되어 나온 블럭 수.
			var nStartCommaIndex = 0; 	// 콤마가 최초로 찍히는 인덱스 값.
			
			if(num.length % 3 != 0){ 	// 입력받은 숫자의 길이가 3의 배수가 아닌 경우 // %3 : 3으로 나눈 나머지 구할 때
				nBlockCount = parseInt(num.length / 3) + 1;
				nStartCommaIndex = num.length % 3;
			}else{	// 입력받은 숫자의 길이가 3의 배수인 경우
				nBlockCount = num.length / 3;
				nStartCommaIndex = 3;					
				// 1,123,456,789 	=> 1 콤마를 (블럭수-1=3)번 찍는다.
				// 11,123,456,789 	=> 2 콤마를 (블럭수-1=3)번 찍는다.
				// 123,456,789 		=> 3 콤마를 (블럭수-1=2)번 찍는다.
				// 5/2 => 2 parseInt(2.5)
				// 11/3 => 3.8435343453
				// 10/3 => 3 parseInt(3.33333)
				// 9/3 => 3 
			}
			var nStartIndex = 0;
			for(var i=0; i<nBlockCount; i++) {	//for(var i=0; i<4; i++)
				// num <== 1234567890
				var sComma = ( i < nBlockCount-1 )?",":"";
				sResult += num.substring(nStartIndex, nStartCommaIndex) + sComma;
				
				nStartIndex = nStartCommaIndex;
				nStartCommaIndex += 3;
				
				// num.substring(0,1) + ",";	1번째 반복횟수 1,
				// num.substring(1,4) + ",";	2번째 반복횟수 234,
				// num.substring(4,7) + ",";	3번째 반복횟수 567,
				// num.substring(7,10) + ",";	4번째 반복횟수 890
			}
		}
		return sResult;
	}
	
	//== 숫자배열 오름차순 정렬하여 리턴시켜주는 함수 == //
	  function func_ascSort(arrArray) {
		  
		  for(var i=0; i<arrArray.length; i++) {
				// i=0, i=1, i=2, i=3, i=4
				for(var j=0; j<arrArray.length-i-1; j++) {
					// j=0; j<4; j++
					// j=0; j<3; j++
					// j=0; j<2; j++
					// j=0; j<1; j++
					
					if(Number(arrArray[j]) > Number(arrArray[j+1])) {
						var temp = arrArray[j];
						arrArray[j] = arrArray[j+1];
						arrArray[j+1] = temp;
					}
				}// end of for-------------------------
				
			}// end of for------------------------------
			
		  var sResult = arrArray.join(",");
		  
		  return sResult;
	  }  
	  
	  
	  
	  
	  
	//	== 주민번호를 검사하는 함수 == //
	  /*
	   	주민번호 공식에 맞으면 true를 리턴하고, 주민번호 공식에 틀리면 false를 리턴한다.
	   */
	  function func_jubunCheck(jubun){
		  //9210201234567(공식에 틀린 것), 9010102000000(공식에 맞는것)
		  if(jubun.length != 13){
			  return false;
		  }
		  else{
			  // 9 * 2 + 2 * 3 + 1 * 4 + 0 * 5 + 2 * 6 + 0 * 7 + 1 * 8 + 2 * 9 + 3 * 2 + 4 * 3 + 5 * 4 + 6 * 5
			  var nSum = 0; //누적용 변수
			  for(var i=0; i<12; i++){
				  if(i<8)
					  nSum += Number(jubun.substring(i, i+1)) * (i+2);
				  else
					  nSum += Number(jubun.substring(i, i+1)) * (i-6);
				  // nSum ==> 134
				
			  }
			  
			  var nResult = nSum%11;  // nSum 을 11로 나눈 나머지
				nResult = 11 - nResult; // 11- nresult ==> 11-2=9
				
				nResult %= 10; // 9%10(9를 10으로 나눈 나머지)
				// 또는 nResult = nResult % 10; 
				console.log(nResult);
				console.log(Number(jubun.substring(12,13)));
				
				if( nResult == Number(jubun.substring(12,13)) )
					return true;
				else
					return false;
				
		  }
	  
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  