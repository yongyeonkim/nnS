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
         <li class="selected"><a href="accountDetail">ȸ�� ���� ����</a></li>
         <li><a href="pwModifyForm">��й�ȣ ����</a></li>
         <li><a href="deleteAccount">ȸ�� Ż��</a></li>
         <li><a href="reportList">�Ű� ����</a></li>
         <li><a href="qnaList">Q&A</a></li>
      </ul>
   </div>
   <div id="main-container">
				<form id="accountModifyForm" method="post">
				<h2>ȸ�� ���� ����</h2>

				<div>
					���̵� ${map.MEM_ID}
				</div>
				
				<div>
					�̸� ${map.MEM_NAME }
				</div>
				
				<div>
					������� ${map.MEM_BIRTH }
				</div>
				
				<div>			
					���� ${map.MEM_GEN }		
				</div>
				
				<div>
               	�̸���<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" value="${map.MEM_EMAIL }">
				</div>
				
				<div>
					�޴���ȭ<input type="text" id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE }"> 
				</div>
							
				<div>
					�����ȣ<input type="text" id="MEM_ZIP" name="MEM_ZIP" value="${map.MEM_ZIP }">
               		<input type="button" onclick="zipcode()" value="�����ȣ ã��"><br> 
				</div>
				
				<div>
					�� �ּ�<input type="text" id="MEM_ADD1" name="MEM_ADD1" value="${map.MEM_ADD1 }"> 
				</div>
				
				<div>
					�� �ּ�<input type="text" id="MEM_ADD2" name="MEM_ADD2" value="${map.MEM_ADD2 }"> 
				</div>									
				<p/>
			<button id="check">����Ϸ�</button>
			<button onclick="back();" type="button">����ϱ�
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

function zipcode() {//�����ȣ �˻�â
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var addr = ''; // �ּ� ����

            //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                addr = data.roadAddress;
                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("MEM_ADD2").focus();
            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                alert("���θ� �ּҸ� �Է����ּ���.");
            	return false;
            }
           
        }
    }).open();
}

$(document).ready(function() { //���� ��ư Ŭ����
    $("#check").on("click", function(e) {
       e.preventDefault();
       fn_check();
    });
 });
 
 function fn_check(accountModifyForm) { //���� ��ư Ŭ����(��ȿ������, �������Է�)
    var chk = $("input[name=agree_required]");

    if(!$("#MEM_EMAIL").val()){
       alert("�̸����� �Է����ּ���.");
       $("#MEM_EMAIL").focus();
       return false;
    }
    
    if(!$("#MEM_PHONE").val()){
        alert("�޴���ȭ�� �Է����ּ���.");
        $("#MEM_PHONE").focus();
        return false;
     }

    if(!$("#MEM_ZIP").val()){
        alert("�����ȣ�� �Է����ּ���.");
        $("#MEM_ZIP").focus();
        return false;
     }
    if(!$("#MEM_ADD1").val()){
        alert("���ּ� �Է����ּ���.");
        $("#MEM_ADD1").focus();
        return false;
     }
    if(!$("#MEM_ADD2").val()){
        alert("���ּҸ� �Է����ּ���.");
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