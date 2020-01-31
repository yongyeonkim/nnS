<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">

$(function(){
	$(document).on("click", "#emailBtn", function(){ //이메일 발송
	$.ajax({
		type:"get",
		url : "<c:url value='/createEmailAuth'/>",
		data : "userEmail=" + $("#email1").val()+"@"+$("#email2").val() + "&random=" + $("#random").val(),
		success : function(data){
			alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
		},
		error: function(data){
			alert("에러가 발생했습니다.");
			return false;
		}
	});
	});	
	
	$(document).on("click", "#emailAuthBtn", function(){ //인증번호 확인
		$.ajax({
			type:"get",
			url:"<c:url value='/emailConfirm'/>",
			data:"authCode="+$('#emailAuth').val()+"&random="+$("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증 완료되었습니다.");
					$('#chkEm').html("이메일 인증 완료").css("color", "blue");  
				}else if(data=="false"){
					alert("인증번호를 잘못 입력하셨습니다.");
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.")
			}
		});
	});
});


function zipcode() {//우편번호 검색창
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MEM_ADD2").focus();
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                alert("도로명 주소를 입력해주세요.");
            	return false;
            }
           
        }
    }).open();
}

   function back(){
      history.go(-1);
   }
   $(document).ready(function() { //id check
      $("#idCheck").on("click", function(e) {
         e.preventDefault();
         fn_idCheck();
      });
   });
 
   $(function(){ //email select  
   $(document).ready(function(){
      $('select[name=email]').change(function() {
         if($(this).val()=="self"){
            $('#email2').val("");
            $("#email2").attr("readonly", false);
            $('#email2').focus();
         } else {
            $('#email2').val($(this).val());
            $("#email2").attr("readonly", true);
         }
      });
   });
   });

   function fn_idCheck(){ //id check
       var MEM_ID = {MEM_ID : $('#MEM_ID').val()};
       $.ajax({
           url:"<c:url value='/join/idCheck'/>",
           type:'get',
           data: MEM_ID,
           success:function(data){              
               if($.trim(data)=="0"){
                  $('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");         
               }else{
                  $('#chkMsg').html("사용불가능한 아이디 입니다.").css("color", "red");
               }
           },
           error:function(){
                   alert("에러입니다");
           }
       });
   };
  
   $(document).ready(function(){ //email select value
         $("#email").change(function(){
            $("#email2").val($(this).val());
         });
      });

   $(document).ready(function() { //비밀번호 일치 확인
        //[1] lblError 레이어 클리어
        $('#MEM_PW').keyup(function() {
            //$('#pwr').remove(); // 제거
            $('#pw').text(''); // 제거가 아니라 클리어
               $('#password2').val('');
        });
        //[2] 암호 확인 기능 구현
        $('#password2').keyup(function() {
            if ($('#MEM_PW').val() != $('#password2').val()) {
                $('#pw').text(''); // 클리어
                $('#pw').html("암호가 일치하지 않습니다.").css("color", "red");          //레이어에 HTML 출력
            }
            else {
                $('#pw').text(''); // 클리어
                $('#pw').html("암호가 일치합니다.").css("color", "blue");
            }
        });
    });
   
   $(document).ready(function() { //회원가입 버튼 클릭시
      $("#join").on("click", function(e) {
         e.preventDefault();
         fn_join();
      });
   });
   
   function fn_join(joinForm) { //회원가입 버튼 클릭시(유효성검증, 데이터입력)
      var chk = $("input[name=agree_required]");
      if(!$("#MEM_ID").val()){
         alert("아이디를 입력해주세요.");
         $("#MEM_ID").focus();
         return false;
      }
      if($("#chkMsg").html()!="사용가능한 아이디 입니다."){
         alert("아이디 중복확인을 해주세요.");
         return false;
      }
      if(!$("#MEM_PW").val()){
         alert("비밀번호를 입력해주세요.");
         $("#MEM_PW").focus();
         return false;
      }
      if(!$("#password2").val()){
         alert("비밀번호 확인을 입력해주세요.");
         $("#password2").focus();
         return false;
      }
      if($("#pw").html()!="암호가 일치합니다."){
         alert("암호가 일치하지 않습니다.");
         return false;
      }
      if(!$("#MEM_NAME").val()){
         alert("이름을 입력해주세요.");
         $("#MEM_NAME").focus();
         return false;
      }
      if(!$("#MEM_BIRTH").val()){
          alert("생년월일을 입력해주세요.");
          $("#MEM_BIRTH").focus();
          return false;
       }
      
      var MEM_GEN = $('#MEM_GEN_M');
       
      if($(':radio[name="MEM_GEN"]:checked').length < 1){
          alert('성별을 선택해주세요');                        
          MEM_GEN.focus();
          return false;
      }
      if(!$("#email1").val() || !$("#email2").val()){
         alert("이메일을 입력해주세요.");
         if(!$("#email1").val()){
            $("#email1").focus();
         }else{
            $("#email2").focus();
         }
         return false;
      }
      if($("#chkEm").html()!="이메일 인증 완료"){
          alert("이메일 인증을 해주세요.");
          return false;
       }
      if(!$("#phone2").val() || !$("#phone3").val()){
         alert("휴대전화를 입력해주세요.");
         if(!$("#phone2").val()){
            $("#phone2").focus();
         }else{
            $("#phone3").focus();
         }
         return false;
      }

      if(!$("#MEM_ZIP").val()){
          alert("우편번호를 입력해주세요.");
          $("#MEM_ZIP").focus();
          return false;
       }
      if(!$("#MEM_ADD1").val()){
          alert("집주소 입력해주세요.");
          $("#MEM_ADD1").focus();
          return false;
       }
      if(!$("#MEM_ADD2").val()){
          alert("상세주소를 입력해주세요.");
          $("#MEM_ADD2").focus();
          return false;
       }
      if(chk[0].checked==false){
         alert("서비스 이용약관에 동의해주세요.");
         return false;
      }
      var comSubmit = new ComSubmit("joinForm");
      comSubmit.setUrl("<c:url value='/memberVerify'/>");
      var email = $("#email1").val()+"@"+$("#email2").val();
      var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
      $("#MEM_EMAIL").val(email);
      $("#MEM_PHONE").val(phone);
      comSubmit.submit();
   }
   $("#joinForm").on("submit",function(e){
   });
   </script>
</head>


<body>
   <div>
   <div>
      <div>
      <h1>회원가입</h1>
      </div>
      <form id="joinForm" method="post">
         <div>
            <div>
               아이디<input type="text" id="MEM_ID" name="MEM_ID" > 
               <button onclick="fn_idCheck();" type="button">아이디 중복 확인
            </div>
            <span id = "chkMsg"></span>
            
            <div>
               비밀번호<input type="password" id="MEM_PW" name="MEM_PW"> 
            </div>
            
            <div>
               비밀번호 확인<input type="password" id="password2"> 
            </div>
            <span id="pw"></span>
            
            
            <div>
               이름<input type="text" id="MEM_NAME" name="MEM_NAME"> 
            </div>
            
            <div>

               생년월일<input type="text" id="MEM_BIRTH" name="MEM_BIRTH" placeholder="ex)19950703"> 

            </div>
            
            <div>
               <form>

                  <input type="radio" id="MEM_GEN_M" name="MEM_GEN" value="남성"/>남성
                  <input type="radio" id="MEM_GEN_F" name="MEM_GEN" value="여성"/>여성

               </form>
            </div>
            
            <div>
               <input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
               이메일<input type="text" id="email1" name="email1"> 
               @
               <input type="text" id="email2" name="email2" value=""> 
            
               <select id="email" name="email">
                  <option value="self">직접입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="nate.com">nate.com</option>

               </select>

               <button type="button" id="emailBtn">이메일 발송</button>
               <input type="text" id="emailAuth" name="emailAuth" placeholder="인증번호"/>
               <button type="button" id="emailAuthBtn">이메일 인증</button>
               <input type="hidden" path="random" id="random" value="${random }"/>
               
               <span id = "chkEm"></span>
               
            </div>
            <div>
               <input type="hidden" id="MEM_PHONE" name="MEM_PHONE">
               	휴대전화<select id="phone1" name="phone1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
               </select> 
               
               -<input type="number" id="phone2" name="phone2"> 
               
               -<input type="number" id="phone3" name="phone3">
            </div>
            
            <div>
               우편번호<input type="text" id="MEM_ZIP" name="MEM_ZIP">
               <input type="button" onclick="zipcode()" value="우편번호 찾기"><br>
            </div>
            
            <div>
               집 주소<input type="text" id="MEM_ADD1" name="MEM_ADD1">
            </div>
            
            <div>
               상세 주소<input type="text" id="MEM_ADD2" name="MEM_ADD2">
            </div>
         
            <div>
               <label>
                  <h1>nns# 서비스 이용약관 동의 <span>(필수)</span></h1>
                  <input type="checkbox" name="agree_required">
                  <svg width="30" height="30" viewBox="0 0 31 31">
                     <g fill="none" fill-rule="evenodd">
                        <g>
                           <circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
                           <circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
                        </g>
                        <path stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
                     </g>
                  </svg>
               </label>
               <div class="lReCa">
                  <iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/station3_180816_dabang_serviceaccessterms.html"
                     scrolling="yes" width="100%" height="100%" frameborder="0" allowtransparency="true"></iframe>
               </div>
            </div>
         </div>
         <button id="join">회원가입</button>
         <button onclick="back();" type="button">취소</button>

      </form>

   </div>
   </div>
</body>
</html>