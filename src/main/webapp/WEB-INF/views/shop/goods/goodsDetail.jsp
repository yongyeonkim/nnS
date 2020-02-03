<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
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
   width: 1024px;
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
	<div id="vertical_tab-container">
		<ul>
			<li class="selected"><a href="goodsList">전체상품</a></li>
			<li><a href="allgoodsList">인기상품</a></li>
			<li><a href="newgoodsList">신규상품</a></li>
			<li><a href="goodsList">카테고리</a></li>
		</ul>
	</div>
	<div id="main-container">
		<table border="1" align="center">
		<tbody>
			<tr>
				<td>
					<table border="1" align="center">
						<colgroup>
							<col width="15%"/>
							<col width="35%"/>
							<col width="15%"/>
							<col width="35%"/>
						</colgroup>
						<caption>상품 상세</caption>
						<tbody>
							<tr colspan="2">
								<td rowspan="2">
									<img src="https://m.sandboxstore.net/web/product/big/201812/fc5894526dadbe5e309f0eb69df14097.jpg"
										alt="" width="202" height="202" />
								</td>
								<td>
									브랜드 : ${map.GOODS_BRAND}<br />
									모델명 : ${map.GOODS_TITLE} <br />	<!-- 테이블에 없음 --> 
									성별 : ${map.GOODS_NUM} <br /><!-- 테이블에 없음 --> 
									좋아요 : ${GOODS_LIKE_COUNT} <br /><!-- 테이블에 없음 -->
									중고상태 : ${map.GOODS_STATUS}
									<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NUM}">
								</td>
							</tr>
							<tr>
								<td>
									판매가 : ${map.GOODS_PRICE}<br /> 
									할인가 : ${GOODS}<br /><!-- 테이블에 없음 --> 
									배송비: ${GOODS} <br /><!-- 테이블에 없음 --> 
									======================= <br /><!-- 테이블에 없음 --> 
									합계 : ${GOODS}
								</td>
								<td>
									SIZE : ${GOODS_BRAND} <br /> 
									COLOR : ${GOODS_MODEL} <br /><!-- 테이블에 없음 --> 
									AMOUNT : ${GOODS_GEN} <br /><!-- 테이블에 없음 -->
								</td>
							</tr>
						</tbody>
					</table>
					<p align="center">
						<input type="button" id="buy" name="buy" value="바로구매" /> 
						<input type="button" id="like" name="like" value="좋아요" /> 
						<input type="button" id="report" name="report" value="신고하기" />
						
						<c:choose>
							<c:when test="${goodsLikeMap.GOODS_LIKE_YN eq 0}">
						    	<a href='javascript: like_func();'><img src=<c:url value="/resources/images/unlike_btn.png"/> id='unlike_img' style="width:30px; height:30px"></a>
						  	</c:when>
						  	<c:otherwise>
						    	<a href='javascript: unlike_func();'><img src=<c:url value="/resources/images/like_btn.png"/> id='like_img' style="width:30px; height:30px"></a>
						  	</c:otherwise>
						</c:choose>						
						
					</p>
					<div class="container">
					    <ul class="goodsTabs">
					        <li><a href="#goodsTab1">상품정보</a></li>
					        <li><a href="#goodsTab2">상품문의</a></li>
					        <li><a href="#goodsTab3">판매자정보</a></li>
					    </ul>
					    <div class="goodsTab_container">
					        <div id="goodsTab1" class="goodsTab_content">
					            <h2>상품정보</h2>
					            <p>${map.GOODS_CONTENT}</p>
					        </div>
					        <div id="goodsTab2" class="goodsTab_content">
					             <h2>상품문의</h2>
					            <p>상품에 대한 문의가 있음</p>
					        </div>
					        <div id="goodsTab3" class="goodsTab_content">
					             <h2>판매자정보</h2>
					            <p>판매자에 대한 정보가 있음</p>
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
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_goodsModify();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteGoods();
			});
			$("a[name='file']").on("click", function(e){
				e.preventDefault();
				fn_downloadFile($(this).attr('id'));
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop' />");
			comSubmit.submit();
		}
		
		function fn_goodsModify(){
			var GOODS_NUM = "${map.GOODS_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsModifyForm' />");
			comSubmit.addParam("GOODS_NUM", GOODS_NUM);
			comSubmit.submit();
		}
	
		function fn_deleteGoods(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDelete' />");
			comSubmit.addParam("GOODS_NUM", $("#IDX").val());
			comSubmit.submit();
			
		}
		function fn_downloadFile(obj){
			var idx=obj;
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do'/>");
			comSubmit.addParam("IDX",idx);
			comSubmit.submit();
		}
		
		/* 좋아요 */
		function like_func(){
			var GOODS_NUM = "${map.GOODS_NUM}";
			var MEM_ID = 1234;
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsLike'/>");
			comSubmit.addParam("LIKE_GOODS_NUM", GOODS_NUM);
			comSubmit.addParam("LIKE_MEM_ID", MEM_ID);
			alert(GOODS_NUM + " " + MEM_ID)
			comSubmit.submit();
		}
		
		function unlike_func(){
			var GOODS_NUM = "${map.GOODS_NUM}";
			var MEM_ID = 1234;
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsUnlike'/>");
			comSubmit.addParam("LIKE_GOODS_NUM", GOODS_NUM);
			comSubmit.addParam("LIKE_MEM_ID", MEM_ID);
			alert(GOODS_NUM + " " + MEM_ID)
			comSubmit.submit();
		}
	</script>

</body>
</html>