<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
<head><title>로그인</title>
   <style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 80px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		background:linear-gradient(to bottom right, #ffffff, #ffffff);
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}

   
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
</head>
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<form name="myform" action="login" method="post" class="form-signin">
		<div class="card align-middle" style="width:20rem; border-radius:20px;">
			<div>
				<div class="card-title" style="margin-top:30px;">
					<h2 class="card-title text-center" style="color:#113366;">로그인 폼</h2>
				</div>
				
				<div class="card-body">	
					<INPUT type="text" name="MEM_ID" id="MEM_ID" size="15" maxlength="12" class="form-control" placeholder="Your ID"><br>  
				</div>
   
				<div class="card-body">
					<INPUT type=password name="MEM_PW" id="MEM_PW" size="15" maxlength="12" class="form-control" placeholder="Password"> <br>
				</div>
			
				<div class="card-body">
					<input type="button" class="btn btn-lg btn-primary btn-block" value="로그인" onclick="fsubmit();">
				</div>
			
				<div class="checkbox" align="center">
					<label>
						<input type="checkbox" value="remember-me" >아이디저장
					</label>
				</div> 

    
			</div>
		</div>
	</form>
	
	<div align="center">
		<input type="button" value="회원가입" onclick="location.href='/nnS/joinForm'"/><input type="button" value="ID/PW 찾기" onclick="location.href='/nnS/findId'"/>
    </div>

</body>
</HTML>