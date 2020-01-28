<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   background-color: #fff;
   border: 1px solid #888;
}
</style>
</head>
<body>

  <div id="content">
   
   <div id="main-container">
		<table border="1" align="center">
		<tbody>
			<tr>
				<td>
					<div class="container">
					    <ul class="goodsTabs">
					        <li><a href="#goodsTab1">아이디찾기</a></li>
					        <li><a href="#goodsTab2">비밀번호찾기</a></li>
					    </ul>
					    <div class="goodsTab_container">
					        <div id="goodsTab1" class="goodsTab_content">
					            <h2>아이디찾기</h2>
					            <form id="frm" method="post" action="findIdResult">
								<br>
									* 이름 <input type="text" name="MEM_NAME" id="MEM_NAME"><br>
									<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
									<div>
										<input type="hidden" id="mem_email" name="mem_email">
										* Email<input type="text" id="email1" name="email1"> 
										@
										<input type="text" id="email2" name="email2" value=""> 
				
										<select id="email">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>hanmail.net</option>
											<option>gmail.com</option>
											<option>nate.com</option>
										</select> 
									</div>
								</form>
								<p/>
								<button id="findid" onclick="fsubmitid();">찾기</button>
								<input type="button" value="취소" onclick="document.location.href='/nnS/main'"/>
								
								<table align="center">

							</table>
							</div>
							
						</div>
					        <div id="goodsTab2" class="goodsTab_content">
					           	<h2>비밀번호찾기</h2>
					            <form id="frm" method="post" action="findPwResult">
									<br>
									* 아이디 <input type="text" name="MEM_ID" id="MEM_ID"><br>
									<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
									<div>
										<input type="hidden" id="mem_email" name="mem_email">
										* Email<input type="text" id="email1" name="email1"> 
										@
										<input type="text" id="email2" name="email2" value=""> 
				
										<select id="email">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>hanmail.net</option>
											<option>gmail.com</option>
											<option>nate.com</option>
										</select> 
									</div>
								</form>
								<p/>
									<button id="findpw" onclick="fsubmitpw();">찾기</button>
									<input type="button" value="취소" onclick="document.location.href='/nnS/main'"/>

									
									<div>
								<br>
							</div>
							</div>
				</div>
			</td>
		</tr>
	</tbody>
	</table>
   </div>
</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function fsubmitid(){
	
	if(id.MEM_ID!=null && id.MEM_ID!=''){
		str += "<tr>"
			+ "<td>"
			+ "입력하신 정보로 등록된 아이디는"
			+ id.MEM_ID
			+ "입니다."
	}
	else if(id.MEM_ID==null || id.MEM_ID!=''){
		str += "조회된 아이디가 없습니다."
	}
	body.append(str);
}


function fsubmitpw(){	
	if(id.MEM_ID!=null&&id.MEM_ID!=''){
		str+="임시 비밀번호를 회원님의 이메일로 발송하였습니다"
	}
	body.append(str);
}

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
</script>
</body>
</html>