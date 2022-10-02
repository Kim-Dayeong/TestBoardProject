<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
  <form role="form" method="post" autocomplete="off">
   <p>
    <label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}" readonly="readonly" />
   </p>
   
   <p>삭제하시겠습니까?</p>
   
   <p>
   <button type="submit">예</button><br />
   <button type="button" id="cancel_btn">아니오</button>

  <script>
 
 // 폼을 변수에 저장
 var formObj = $("form[role='form']");
 
 
 //취소 버튼 클릭
 
 $("#cancel_btn").click(function() {
	 self.location = "/board/read?bno=${delete}"
		   + "&page=${scri.page}"
		   + "&perPageNum=${scri.perPageNum}"
		   + "&searchType=${scri.searchType}"
		   + "&keyword=${scri.keyword}";
 });
 
 </script>
 
 </p>

</form>
 </section>

</div>

</body>
</html>
