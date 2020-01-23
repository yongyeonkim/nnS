<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	var onSearch = function(){	
		submit();
	};	
</script>

<!--  Header 영역 -->
<div class="header_area">
	<h1><a href="" title="nnS#"><img class="main_image" src="resources/images/mainlogo.png" alt="nnS#"/></a></h1>
	<div class="search_main">
		<div class="search_inner">
			<form action="" method="post">
				<fieldset>
					<legend>검색</legend>
					<input type="text" class="txt" placeholder="Search" name="search"/>&nbsp;
					<input type="button" value="검색" class="search_btn" onClick="onSearch()"/>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="top_menu">
		<ul>
			<!-- href="" 링크 채워넣어야 함 -->
			<c:if test="${session_member_name == null }"> <!-- 변수명은 나중에 맞춰서 변경 -->
				<li><a href="">로그인</a></li> 
				<li><a href="">회원가입</a> </li>
				<li><a href="">ID/PW찾기</a></li>
			</c:if>
			<c:if test="${session_member_name != null }">
				<li>${session_member_name}&nbsp;님</li>
				<li><a href="">로그아웃</a></li>
				<li><a href="">마이페이지</a></li> 
				<li><a href="">내상점</a></li> 
				<li><a href="">알림버튼</a></li> 
			</c:if>
		</ul>
	</div>
</div>

<!-- 내상점 / 커뮤니티 창일 경우에 띄워주는 메뉴 시작 -->
<%-- <c:if test="${session_shopAndComunity}"> --%>
	<div class="tab_cate">    
		<div class="tabs_area">  
			<ul class="tabs">
				<li><a href="#tab1" class="tab_a1"><span>쇼핑몰</span></a></li>
				<li><a href="#tab2" class="tab_a2"><span>커뮤니티</span></a></li>
			</ul>
		</div>
	</div>
<%-- </c:if> --%>
<!--//메뉴 끝-->