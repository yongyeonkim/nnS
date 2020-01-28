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
<<<<<<< HEAD
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
=======
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
>>>>>>> 6fd2e3c34695e4f6720af9aae3f4fb4ea7ff030b
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
<<<<<<< HEAD
  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="accountModifyForm">ȸ������ ����</a></li>
         <li class="selected"><a href="pwModifyForm">��й�ȣ ����</a></li>
         <li><a href="myInfoDelete">ȸ��Ż��</a></li>
=======

  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="accountModifyForm">ȸ����������</a></li>
         <li class="selected"><a href="pwModifyForm">��й�ȣ ����</a></li>
         <li><a href="myInfoDelete">ȸ�� Ż��</a></li>
>>>>>>> 6fd2e3c34695e4f6720af9aae3f4fb4ea7ff030b
         <li><a href="reportList">�Ű���</a></li>
         <li><a href="qnaList">Q&A</a></li>
      </ul>
   </div>
   <div id="main-container">
<<<<<<< HEAD
   <center>
         <table border="0" class="pwModify">
         <br/><br/><br/>
        <h2>��й�ȣ ����</h2>
            <tbody>
            <tr>
            	<td>
               * ���� ��й�ȣ &nbsp;&nbsp;&nbsp;   <input type="password" id="mem_check_pw" name="mem_check_pw">
               </td>
               </tr>
               <tr>
               <td>
               * �� ��й�ȣ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <input type="password" id="mem_check_pw1" name="mem_check_pw1">
               </td>
               </tr>

               <tr>
               <td>
               * �� ��й�ȣ Ȯ�� <input type="password" id="mem_check_pw2" name="mem_check_pw2">
               </td>
               </tr>
               
            <br/><br/>
            <tr>
            <td align="center">
            <br/>
            <input type="button" value="���� �Ϸ�" />
            <input type="button" value="����ϱ�" onclick="document.location.href='/nnS/main'"/>
            </td>
            </tr>
            </tbody>
         </table>
         </center>
   </div>
  </div>
=======
   <form action="modify" method="post">
        
		<table border="1" align="center">
		
			<tr>
				<td>
					<table border="1" align="center">
						�� ��й�ȣ<input type="password"><br/><br/><br/>
						��й�ȣȮ��<input type="password"><br/><br/><br/>
						<input type="submit" value="����"><br/><br/><br/>
					</table>
					
	</table>
	</form>
   </div>
</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
</script>
>>>>>>> 6fd2e3c34695e4f6720af9aae3f4fb4ea7ff030b
</body>
</html>