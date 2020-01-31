<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<meta charset="UTF-8">
<style type="text/css">
#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   background-color: #fff;
   border: 1px solid #888;
}
</style>
<body>
<form id="frm" name="frm" enctype="multipart/form-data">
<div id="content">
	<div id="main-container">
      <h1 align="center"> 상품 수정</h1>
      <br/><br/>
      <ul>
      	<li>
      		카테고리 &nbsp;
			<select name="goodsCate">
			    <option value="">상품 종류</option>
			    <option value="">상품 종류</option>
			    <option value="">상품 종류</option>
			    <option value="">상품 종류</option>
			</select>
      	</li>
      	<li>
      		중고상태 &nbsp;&nbsp;
			<select name="goodsStat">
			    <option value="">A</option>
			    <option value="">B</option>
			    <option value="">C</option>
			    <option value="">D</option>
			</select>
      	</li>
      	<li>
      		상품정보 
			<br/>
			<textarea cols="50" rows="15">
해당 게시글의 정보입니다. 아래 인풋만 입력하여	   	
수정을 확인해 주세요 (글번호는 확인용 냅두세요)  
				${map.GOODS_NUM},
				${map.MEM_ID},
				${map.GOODS_TITLE},
				${map.GOODS_CONTENT},
			        ${map.GOODS_PRICE},
			        ${map.GOODS_REGION},
			        ${map.GOODS_CATEGORY},
			        ${map.GOODS_HASH},
			        ${map.GOODS_DCOST},
			        ${map.GOODS_BRAND},
			        ${map.GOODS_COUNT},
			        ${map.GOODS_STATUS},
			        ${map.GOODS_THUMBNAIL},
			        ${map.GOODS_TSTATUS}
			</textarea>
      	</li>
      	
      	<li>
      		글번호<input type="text" id="IDX" name="IDX" value="${map.GOODS_NUM}">
      	</li>
      	<li>
      		제목<input type="text" id="GOODS_TITLE" name="GOODS_TITLE">
      	</li>
      	<li>
      		가격<input type="number" id="GOODS_PRICE" name="GOODS_PRICE">
      	</li>
      	<li>
      		브랜드<input type="text" id="GOODS_BRAND" name="GOODS_BRAND">
      	</li>
      	<li>
      		내용<input type="text" id="GOODS_CONTENT" name="GOODS_CONTENT">
      	</li>
      	
      	<li>
      		첨부파일 <input type="file" id="fileUpload" name="fileUpload" value="첨부">
      		<br><input type="button" id="addUpload" name="addUpload" value="파일추가">
      	</li>

      	<p align="right">
      		<a href="#this" class="btn" id="list">목록으로</a>
			<a href="#this" class="btn" id="update">저장하기</a>
      	</p>
      </ul>
	</div>
</div>
</form>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
	<script type="text/javascript">
		var gfv_count='${fn:length(list)+1}'
		$(document).ready(function(){
			var gfv_count='${fn:length(list)+1}';
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateGoods();
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop' />");
			comSubmit.submit();
		}
		
		function fn_updateGoods(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/shop/goodsModify' />");
			comSubmit.submit();
		}
	</script>
	
</body>
</html>