<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">

h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {width: 700px; margin: 10px auto;}
ul.goodsTabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}
ul.goodsTabs li {
	
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px;
	background: #F0F0F0;
	overflow: hidden;
	position: relative;
}
ul.goodsTabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff;
	outline: none;
}
ul.goodsTabs li a:hover {
	background: #ccc;
}	
html ul.goodsTabs li.active, html ul.goodsTabs li.active a:hover  {
	background: #fff;
	border-bottom: 1px solid #fff;
}
.goodsTab_container {
	border: 1px solid #999;
	border-top: none;
	clear: both;
	float: left; 
	width: 100%;
	background: #fff;
	-moz-border-radius-bottomright: 5px;
	-khtml-border-radius-bottomright: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-bottomleft: 5px;
	-khtml-border-radius-bottomleft: 5px;
	-webkit-border-bottom-left-radius: 5px;
}
.goodsTab_content {
	padding: 20px;
	font-size: 1.2em;
}
.goodsTab_content h2 {
	font-weight: normal;
	padding-bottom: 10px;
	border-bottom: 1px dashed #ddd;
	font-size: 1.8em;
}
.goodsTab_content h3 a{
	color: #254588;
}
.goodsTab_content img {
	float: left;
	margin: 0 20px 20px 0;
	border: 1px solid #ddd;
	padding: 5px;
}
 #content
{
   background-color: #ffffff;
   padding: 20px 10px;
   overflow: auto;
}
#vertical_tab-container
{
   float: left;
   margin: 50px 0 0 0;
   width: 126px;
}
#vertical_tab-container ul
{
   list-style: none;
   text-align: center;
}
#vertical_tab-container ul li
{
   border-top: 1px solid #666;
   border-right: 1px solid #666;
   border-bottom: 1px solid #666;
   border-left: 8px solid #666;
   background-color: #ddd;
   margin: 8px 0;
}
#vertical_tab-container ul li a,
#vertical_tab-container ul li a:visited
{
   text-decoration: none;
   color: #666;
   display: block;
   padding: 15px 5px;
}
#vertical_tab-container ul li:hover
{
   border-left: 8px solid #333;
}
#vertical_tab-container ul li a:hover
{
   color: #000;
}
#vertical_tab-container ul li.selected
{
   border-right: none;
   background-color: #fff;
   border-left: 8px solid #006699;
}
#main-container
{
   min-height: 600px;
   margin: 0 0 0 125px;
   padding: 20px;
   background-color: #fff;
   border: 1px solid #888;
}
</style>
</head>
<body>

  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li class="selected"><a href="accountDetail">회원 정보 변경</a></li>
         <li><a href="pwModifyForm">비밀번호 변경</a></li>
         <li><a href="deleteAccount">회원 탈퇴</a></li>
         <li><a href="reportList">신고 내역</a></li>
         <li><a href="qnaList">Q&A</a></li>
      </ul>
   </div>
   <div id="main-container">
				<form id="accountModifyForm" method="post">
				<h2>회원 정보 변경</h2>

				<div>
					아이디 ${map.MEM_ID}
				</div>
				
				<div>
					이름 ${map.MEM_NAME }
				</div>
				
				<div>
					생년월일 ${map.MEM_BIRTH }
				</div>
				
				<div>			
					성별 ${map.MEM_GEN }		
				</div>
				
				<div>
               	이메일<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" value="${map.MEM_EMAIL }">
				</div>
				
				<div>
					휴대전화<input type="text" id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE }"> 
				</div>
							
				<div>
					우편번호<input type="text" id="MEM_ZIP" name="MEM_ZIP" value="${map.MEM_ZIP }">
               		<input type="button" onclick="zipcode()" value="우편번호 찾기"><br> 
				</div>
				
				<div>
					집 주소<input type="text" id="MEM_ADD1" name="MEM_ADD1" value="${map.MEM_ADD1 }"> 
				</div>
				
				<div>
					상세 주소<input type="text" id="MEM_ADD2" name="MEM_ADD2" value="${map.MEM_ADD2 }"> 
				</div>									
				<p/>
			<button id="check">변경완료</button>
			<button onclick="back();" type="button">취소하기
		</tbody>
   </div>
</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function() {

	//Default Action
	$(".goodsTab_content").hide(); //Hide all content
	$("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
	$(".goodsTab_content:first").show(); //Show first goodsTab content
	
	//On Click Event
	$("ul.goodsTabs li").click(function() {
		$("ul.goodsTabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected goodsTab
		$(".goodsTab_content").hide(); //Hide all goodsTab content
		var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
		$(activegoodsTab).fadeIn(); //Fade in the active content
		return false;
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

$(document).ready(function() { //변경 버튼 클릭시
    $("#check").on("click", function(e) {
       e.preventDefault();
       fn_check();
    });
 });
 
 function fn_check(accountModifyForm) { //변경 버튼 클릭시(유효성검증, 데이터입력)
    var chk = $("input[name=agree_required]");

    if(!$("#MEM_EMAIL").val()){
       alert("이메일을 입력해주세요.");
       $("#MEM_EMAIL").focus();
       return false;
    }
    
    if(!$("#MEM_PHONE").val()){
        alert("휴대전화를 입력해주세요.");
        $("#MEM_PHONE").focus();
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

    var comSubmit = new ComSubmit("accountModifyForm");
    comSubmit.setUrl("<c:url value='/myPage/accountModify'/>");
    comSubmit.submit();
 }
 $("#accountModifyForm").on("submit",function(e){
 });


function back(){
	history.go(-1);
}
</script>
</body>
</html>