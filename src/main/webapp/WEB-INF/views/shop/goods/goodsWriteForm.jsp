<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

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
</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<div id="content">
	<div id="main-container">
		<form  method="post" id="frm" name="frm" enctype="multipart/form-data" onsubmit="return formCheck();">
		<table style="width:100%; height:412px;">
		<h1 align="center"> 상품 등록</h1>
	      <br/><br/>
	
	      <ul>
	      	<li>
	      		카테고리 &nbsp;
				<select name="GOODS_CATEGORY" id="GOODS_CATEGORY">
				    <option value="1">의류</option>
				    <option value="2">전자기기</option>
				    <option value="3">악세서리</option>
				    <option value="4">기타</option>
				</select>
	      	</li>
	      	<li>
	      		작성자 &nbsp;&nbsp; <input type="text" id="MEM_ID" name="MEM_ID">
	      	</li>
	      	<li>
	      		브랜드 &nbsp;&nbsp; <input type="text" id="GOODS_BRAND" name="GOODS_BRAND">
      		</li>
      		<li>
	      		해시태그 &nbsp;&nbsp; <input type="text" id="GOODS_HASH" name="GOODS_HASH">
	      	</li>
	      	<li>
	      		판매지역 &nbsp;&nbsp; <input type="text" id="GOODS_REGION" name="GOODS_REGION">
	      	</li>
	      	<li>
	      		중고상태 &nbsp;&nbsp;
				<select name="GOODS_STATUS">
				    <option value="1">A</option>
				    <option value="2">B</option>
				    <option value="3">C</option>
				    <option value="4">D</option>
				</select>
	      	</li>
	      	<li>
	      		가격 &nbsp;&nbsp; <input type="text" id="GOODS_PRICE" name="GOODS_PRICE" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
	      	</li>
	      	<li>
	      		배송비 &nbsp;&nbsp; <input type="text" id="GOODS_DCOST" name="GOODS_DCOST" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
	      	</li>
	      	<li>
	      		제목 &nbsp;&nbsp; <input type="text" id="GOODS_TITLE" name="GOODS_TITLE">
	      	</li>
	      	<li>
	      		상품정보 
				<br/>
					<tr>
						<td style="margin:0; padding:0;" colspan="2"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;"></textarea></td>
					</tr>
			</table>
			<!-- 
			<input id="addBtn" type="submit" value="전송">
			 -->
			
      	</li>
      	<!--
      	<li>
      		첨부파일 <input type="file" id="fileUpload" name="fileUpload" value="첨부">
      		<br><input type="button" id="addUpload" name="addUpload" value="파일추가">
      	</li>
      	 -->
      	<div id="fileDiv">
			<p>
				<input type="file" name="file">
				<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			</p>
		</div>
		
		<br/><br/>
		
      	<p align="right">
      		<a href="#this" class="btn" id="addFile">파일추가</a>
			<a href="#this" class="btn" id="addBtn">작성하기</a>
			<a href="#this" class="btn" id="list">목록으로</a>
      	</p>
      </ul>
      </form>
	</div>
</div>

<script type="text/javascript">
	var gfv_count = 1;
	
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault();
			fn_openGoodsList();
		});
		
		$("#addBtn").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			if(fn_formCheck()){
				fn_insertGoods();	
			}
		});
		
		$("#addFile").on("click", function(e){ //파일추가 버튼
			e.preventDefault();
			fn_addFile();
		});
		$("#delete").on("click", function(e){ //삭제하기 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
		
		
	});
	
	function fn_openGoodsList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
		comSubmit.submit();
	}
	
	function fn_insertGoods(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/shop/goodsWrite' />");
		comSubmit.submit();
	} 

	function fn_addFile(){
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str); 
		
		$("a[name='delete']").on("click", function(e){ //삭제 버튼 
			e.preventDefault(); 
			fn_deleteFile($(this)); 
		}); 
	} 
	
	function fn_deleteFile(obj){ 
		obj.parent().remove(); 
	}
	
	function fn_formCheck() {
		// submit을 제외한 모든 input태그의 갯수를 가져옴
	    var length = document.frm.length;
	 
	    for ( var i = 0; i < length; i++) { // 길이만큼 루프를 돌면서
	 
	        if (document.frm[i].value == null
	                || document.frm[i].value == "") {
	            // 경고창을 띄우고
	            alert("값을 입력하세요.");
	            //alert(document.frm[i].name + "을(를) 입력하세요.");
	            // null인 태그에 포커스를 줌
	            document.frm[i].focus();
	            return false;
	        }//end if
	    }//end for
	    return true;
		}
</script>
</body>
</html>