<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	if(message!=null && message!=''){
		alert(message);
		if(url!=null && url!=''){
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='/main'/>";
	}
})
/* message는 아이디가 없을 때,비밀번호가 맞지않을 때 이메일 인증을 하지 않았을 때, 제재기한이 남았을때 출력
url은 메인으로 스크립트 */
</script>
</head>
</html>