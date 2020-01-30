<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
<head><title>로그인</title>
   
   </style>
   <%-- <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script> --%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script type="text/javascript">

      function begin(){
         document.myform.MEM_ID.focus();
       }
       function checkIt(){
         if(!document.myform.MEM_ID.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.MEM_PW.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }

       }
       
       function fsubmit(){
    		var id = $("#MEM_ID")[0].value;
    		var pw = $("#MEM_PW")[0].value;
    		if(id==null || id==''){
    			alert("아이디를 입력하세요.");
    			return false;
    		}
    		if(pw==null || pw==''){
    			alert("비밀번호를 입력하세요.");
    			return false;
    		}
    		if($(".Checkbox__CheckboxStd-ifp1yz-1").is(":checked")){
    			var id = $("#MEM_ID").val();
    			document.cookie = "storedId="+id;
    			document.cookie = "idStore=true";
    		}else{
    			document.cookie = "storedId=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    			document.cookie = "idStore=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    		}
    		var cookie = document.cookie.match('(^|;) ?'+'storedId'+'=([^;]*)(;|$)');
    		myform.submit();
    	}
       
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
<form name="myform" action="login" method="post">

   <div>
   아이디 <INPUT type="text" name="MEM_ID" id="MEM_ID" size="15" maxlength="12">
   
   </div>
   
   <div>
     비밀번호<INPUT type=password name="MEM_PW" id="MEM_PW" size="15" maxlength="12">
   </div>
   <div>
      <input type="button" value="로그인" onclick="fsubmit();">
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