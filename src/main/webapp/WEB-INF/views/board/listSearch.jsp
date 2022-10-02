<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<body>
<div id="root">
	<header>
		<%@include file="include/header.jsp" %>
	</header>

		<nav>
			<%@include file="include/nav.jsp" %>
		</nav>
		<section id="container">

   
    <h2>글 목록</h2>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>글쓴이</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        <!-- forEach 문은 리스트 객체 타입을 꺼낼때 많이 활용된다. -->
        <c:forEach var="list" items="${list}"> <!-- var: 변수명  items: 콜랙션 객체 -->
        <tr>
            <!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
            <td>${list.bno}</td>
            
            <td>
            	<a href="/board/read?bno=${list.bno}&
            	page=${scri.page}&
            	perPageNum=${scri.perPageNum}&
           		searchType=${scri.searchType}&
            	keyword=${scri.keyword}">${list.title}</a>
            	
            	</td>
        
            <td>
            	<a>${list.title}</a>
            </td>
        
            <td>${list.writer}</td>
            <td>
                <!-- 데이터 타입을 사용하는 방법 -->
                <fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
            <td>${list.viewcnt}</td>
        </tr>
        </c:forEach>
    </table>
    
    <div>
 <ul>
  <c:if test="${pageMaker.prev}">
   <li><a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <li><a href="listsearch${pageMaker.makeSearch(idx)}">${idx}</a></li>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
  <li><a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
  </c:if> 
 </ul>
</div>
    
    
    <div class="search">
 <select name="searchType">
  <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
  <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
  <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
  <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
 </select>
 
 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

 <button id="searchBtn">검색</button>
 
 <script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listSearch"
     + '${pageMaker.makeQuery(1)}'
     + "&searchType="
     + $("select option:selected").val()
     + "&keyword="
     + encodeURIComponent($('#keywordInput').val());
    });
 });   
 </script>
</div>
    
    
    
    </section>
    
    
    <footer>
    	<%@include file="include/footer.jsp" %>
    </footer>
    </div>
</body>
</html>