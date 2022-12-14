<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 <title>게시판</title>
 
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 
</head>
<body>

<div id="root">
 <header>
  <h1>게시판 글쓰기 페이지</h1>
 </header>

 
 <nav>
  메인화면 - 글쓰기 - 로그인
 </nav>


 <section id="container">
 </section>
  <form role="form" method="post" autocomplete="off">
  <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
  <input type="hidden" id="keyword" name="keyword" "value="${scri.keyword}" readonly="readonly" />
  
  
   <p>
    <label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}" readonly="readonly" />
   </p>
  
 </form>
   <p>
    <label for="title">글 제목</label><input type="text" id="title" name="title" value="${read.title} readonly="readonly"/>
   </p>
   <p>
    <label for="content">글 내용</label><textarea id="content" name="content" readonly="readonly">${read.content}</textarea>
   </p>
   <p>
    <label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" readonly="readonly"/>
    <label>작성 날짜</label> <span><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/></span>
   </p>
 <p><button type = "button" id="upvote_btn">좋아요</button></p>
   
   
   
 <p>
 <button type="button" id="list_btn">목록</button>
  <button type="button" id="modity_btn">수정</button>
  <button type="button" id="delete_btn">삭제</button>
 </p>
 
  <script>
 
 // 폼을 변수에 저장
 var formObj = $("form[role='form']");
 
 
 // 목록 버튼 클릭
 $("#list_btn").click(function(){
	 self.location = "/board/listSearch?"
			 +"page=${scri.page}&perPageNum=${scri.perPageNum}"
			 +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
 });
 
 
 
 // 수정 버튼 클릭
 $("#modity_btn").click(function(){
  
  formObj.attr("action", "/board/modify");
  formObj.attr("method", "get");  
  formObj.submit();     
  
 });
 
 
 // 삭제 버튼 클릭
 $("#delete_btn").click(function(){
  
  formObj.attr("action", "/board/delete");
  formObj.attr("method", "get");  
  formObj.submit();
  
 });
 </script>
<!-- 게시물 끝 -->
<div id="reply">
 <ol class="replyList">
 <c:forEach items="${repList}" var="repList">
 <li>
  <p>
   작성자 : ${repList.writer}<br />
   작성 날짜 :<fmt:formatDate value="${repList.regdate}" pattern="yyyy-MM-dd" />
  </p>
  
  <p>${repList.content}</p>
  
  <p>              
 <button type="button" class="replyUpdate" data-rno="${repList.rno}">수정</button>
 <button type="button" class="replyDelete" data-rno="${repList.rno}">삭제</button>
 
 <script>
  $(".replyUpdate").click(function(){
   self.location = "/board/replyUpdate?bno=${read.bno}"
    + "&page=${scri.page}"
    + "&perPageNum=${scri.perPageNum}"
    + "&searchType=${scri.searchType}"
    + "&keyword=${scri.keyword}"
    + "&rno=" + $(this).attr("data-rno");        
  });
  
  $(".replyDelete").click(function(){
   self.location = "/board/replyDelete?bno=${read.bno}"
    + "&page=${scri.page}"
    + "&perPageNum=${scri.perPageNum}"
    + "&searchType=${scri.searchType}"
    + "&keyword=${scri.keyword}"
    + "&rno=" + $(this).attr("data-rno"); 
  });       
 </script>
</p>
 </li>
 </c:forEach>   
 </ol>
</div>

</div>



<section class="replyForm">
<form role="form" method="post" autocomplete="off">

 <input type="hidden" id="bno" name="bno" value="${read.bno}" readonly="readonly" />
 <input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly" />
 <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
 <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" readonly="readonly" />
 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" readonly="readonly" />

 <p><label for="writer">작성자</label><input type="text" id="writer" name="writer" /></p>
 <p><label for="content">댓글 내용</label><textarea id="content" name="content"></textarea></p>
 <p>
  <button type="button" class="repSubmit">작성</button>
  <script>
  var formObj = $(".replyForm form[role='form']");
        
  $(".repSubmit").click(function(){
   formObj.attr("action", "replyWrite");
   formObj.submit();
  });
  </script>
 </p>
</form>
</section>





</body>
</html>
