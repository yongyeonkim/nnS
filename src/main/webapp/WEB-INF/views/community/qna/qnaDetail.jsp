<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<html lang="ko">
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
/* 답변글 보기에 쓰는거 */
.answer a{cursor:pointer;}
.answer .hide{display:none;}
</style>
<body>
<div id="content">
   <div id="vertical_tab-container">
  
      <ul>
      
         <li><a href="noticeList">공지사항</a></li>
         <li><a href="boardList">자유게시판</a></li>
         <li><a href="reportList">신고게시판</a></li>
         <li class="selected"><a href="qnaList">Q&A게시판</a></li>
        </ul>

   </div>
   <div id="main-container">

    <form id="frm" name="frm">
	<table class="board_view" align="center">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.QNA_NUM }
				<th scope="row">조회수</th>
				<td>${map.QNA_COUNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.MEM_ID }</td>
				<th scope="row">문의유형</th>
				<td>${map.QNA_TYPE }</td>
				<th scope="row">작성시간</th>
				<td>${map.QNA_TIME }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.QNA_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4"><pre>${map.QNA_CONTENT }</pre></td>
			</tr>
			<%-- <tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
						<input type="hidden" id="QNA_NUM" value="${row.QNA_NUM }">
						<a href="#this" id="${row.QNA_NUM }" name="file">${row.ORIGINAL_FILE_NAME }</a>
						(${file.FILE_SIZE }kb)
					</c:forEach>
				</td>
			</tr> --%>
		</tbody>
	</table>
	    <c:choose>
	    <c:when test="${fn:length(list)>0 }">
	    <c:forEach items="${list }" var="answer">
		<div class="answer">
				<a><img src="" alt="답변 보기"/></a>
				<table class="hide">
					<tr>
					  <th>작성자</th><td>${answer.MEM_ID }(운영자)</td><th>작성 날짜</th><td>${answer.QNA_DATE }</td>
					</tr>
					<tr><th>제목</th><td>RE: ${answer.QNA_TITLE }</td>
					<tr>
					   <th>내용</th><td>${answer.QNA_CONTENT}</td>
					</tr>
					<tr>
					  <td><a href="#this" class="btn" id="deleteAnswer">삭제하기</a></td>
					</tr>
				</table>
		</div>
		</c:forEach>
		</c:when>
		</c:choose>
			
		<div class="answer">
				<a><img src="" alt="답변 쓰기"/></a>
				<table class="hide">
					<tr>
					  <th>제목</th>
					  <td><input type="text" id="QNA_TITLE" name="QNA_TITLE"></td>
					</tr>
					<tr>
					  <th>내용</th>
					  <td><textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea></td>
					</tr>
					<tr>
					 <td><a href="#this" class="btn" id="write">답변달기</a></td>
					
					</tr> 
				</table>
				
		</div>
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	</form>
	</div>
	</div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			$("#write").on("click", function(e){ //답변달기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			$("#deleteAnswer").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteAnswerBoard();
			});
			/* $("a[name='file']").on("click", function(e){
				e.preventDefault();
				fn_downloadFile($(this).attr('id'));
			}); */
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.QNA_NUM}";
			var type="${map.QNA_TYPE}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaModifyForm' />");
			comSubmit.addParam("QNA_NUM", idx);
			comSubmit.addParam("QNA_TYPE",type);
			comSubmit.submit();
		}
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			var idx="${map.QNA_NUM}"
			var type="${map.QNA_TYPE}"
			comSubmit.setUrl("<c:url value='/community/qnaDetail/answerWrite' />");
			comSubmit.addParam("QNA_NUM",idx);//QNA_PARENT의 값이된다.
			comSubmit.addParam("QNA_TYPE",type);//어떤 유형에 대한 답변인지 보기위해 넣는다.
			comSubmit.submit();
		}
	
		function fn_deleteBoard(){
			var idx = "${map.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaDelete' />");
			comSubmit.addParam("QNA_NUM", idx);
			comSubmit.submit();
			
		}
		function fn_deleteAnswerBoard(){
			var idx = "${answer.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaDelete' />");
			comSubmit.addParam("QNA_NUM", idx);
			comSubmit.submit();
			
		}
		/* function fn_downloadFile(obj){
			var idx=obj;
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do'/>");
			comSubmit.addParam("QNA_NUM",idx);
			comSubmit.submit();
		} */
		
		//답변글 보기에 쓰는 거 
		//html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function(){
			// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
			$(".answer>a").click(function(){
				var submenu = $(this).next("table");

				// submenu 가 화면상에 보일때는 위로 접고 아니면 아래로 펼치기
				if( submenu.is(":visible") ){
					submenu.slideUp();
				}else{
					submenu.slideDown();
				}
			});
		});
	</script>
</body>
</html>