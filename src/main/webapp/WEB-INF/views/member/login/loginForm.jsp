<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
<head><title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
   
   </style>
   <script language="javascript">
    
      function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
         if(!document.myform.id.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.passwd.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }
         
         
       } 
       </script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script type="text/javascript">
       $(document).ready(function(){
    	   
    	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    	    var key = getCookie("key");
    	    $("#userId").val(key); 
    	     
    	    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    	    }
    	     
    	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
    	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
    	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
    	        }else{ // ID 저장하기 체크 해제 시,
    	            deleteCookie("key");
    	        }
    	    });
    	     
    	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    	    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
    	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
    	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
    	        }
    	    });
    	});
    	 
    	function setCookie(cookieName, value, exdays){
    	    var exdate = new Date();
    	    exdate.setDate(exdate.getDate() + exdays);
    	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    	    document.cookie = cookieName + "=" + cookieValue;
    	}
    	 
    	function deleteCookie(cookieName){
    	    var expireDate = new Date();
    	    expireDate.setDate(expireDate.getDate() - 1);
    	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    	}
    	 
    	function getCookie(cookieName) {
    	    cookieName = cookieName + '=';
    	    var cookieData = document.cookie;
    	    var start = cookieData.indexOf(cookieName);
    	    var cookieValue = '';
    	    if(start != -1){
    	        start += cookieName.length;
    	        var end = cookieData.indexOf(';', start);
    	        if(end == -1)end = cookieData.length;
    	        cookieValue = cookieData.substring(start, end);
    	    }
    	    return unescape(cookieValue);
    	}
    	</script>

  
</head>
<BODY onload="begin()">
<form name="myform" action="login" method="post" onSubmit="return checkIt()">

  <div>
  
  </div>
 
  
    
   <div>
   아이디 <INPUT type="text" name="id" id="userId" size="15" maxlength="12">
   
   </div>
   
   <div>
     비밀번호<INPUT type=password name="passwd"  size="15" maxlength="12">
   </div>
   <div>
      <INPUT type=submit value="로그인">
   </div>
    <div>
      <input type="checkbox" value="idSaveCheck">아이디저장
    </div> 
    <div>
      <a href="joinForm">회원가입</a>|<a href="findId">ID/PW 찾기</a>
    </div>
</form>

</BODY>
</HTML>