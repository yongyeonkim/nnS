<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>board</title>
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
   <div id="vertical_tab-container">
   <ul>
      <li><a href="noticeList">공지사항</a></li>
         <li class="selected"><a href="boardList">자유게시판</a></li>
         <li><a href="reportList">신고게시판</a></li>
         <li><a href="qnaList">Q&A게시판</a></li>
   </ul>
   </div>
   <div id="main-container">
   <table border="1" align="center" class="board_view">
      <colgroup>
         <col width="15%"/>
         <col width="35%"/>
         <col width="15%"/>
         <col width="35%"/>
      </colgroup>
      <caption><h2>자유게시판</h2></caption>
      <p/>
      <tbody>
         <tr>
            <th scope="row">글 번호</th>
            <td>${map.NUM }
            <input type="hidden" id="NUM" name="NUM" value="${map.NUM }"></td>
            <th scope="row">조회수</th>
            <td>${map.COUNT }</td>
         </tr>
         <tr>
            <th scope="row">작성자</th>
            <td>${map.WRITER }</td>
            <th scope="row">작성일자</th>
            <td>${map.DATE }</td>
         </tr>
         <tr>
            <th scope="row">제목</th>
            <td colspan="3">${map.TITLE }</td>
         </tr>
         <tr>
            <td colspan="4"><pre>${map.CONTENT }</pre></td>
         </tr>
         <tr>
            <th scope="row">첨부파일</th>
            <td colspan="3">
               <c:forEach var="row" items="${list }">
                  <input type="hidden" id="NUM" value="${row.NUM }">
                  <a href="#this" id="${row.NUM }" name="file">${row.ORG}</a>
                  (${file.SIZE }kb)
               </c:forEach>
            </td>
         </tr>
      </tbody>
   </table>
   </div>
</div>
   
   <a href="#this" class="btn" id="list">목록으로</a>
   <a href="#this" class="btn" id="update">수정하기</a>
   <a href="#this" class="btn" id="delete">삭제하기</a>
   
   
   <script type="text/javascript">
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
         });
         
         $("#update").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_openBoardUpdate();
         });
         $("#delete").on("click", function(e){ //삭제하기 버튼
            e.preventDefault();
            fn_deleteBoard();
         });
         $("a[name='file']").on("click", function(e){
            e.preventDefault();
            fn_downloadFile($(this).attr('id'));
         });
      });
      
      function fn_openBoardList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/nnS/community/boardList' />");
         comSubmit.submit();
      }
      
      function fn_openBoardUpdate(){
         var idx = "${map.NUM}";
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/nnS/community/boardUpate' />");
         comSubmit.addParam("NUM", num);
         comSubmit.submit();
      }
   
      function fn_deleteBoard(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
         comSubmit.addParam("NUM", $("#NUM").val());
         comSubmit.submit();
         
      }
      function fn_downloadFile(obj){
         var idx=obj;
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/nnS/common/downloadFile.do'/>");
         comSubmit.addParam("NUM",num);
         comSubmit.submit();
      }
   </script>
</body>
</html>