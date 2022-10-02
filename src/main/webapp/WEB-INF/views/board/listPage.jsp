<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

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
   <li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <li><a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a></li>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
  <li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
  </c:if> 
 </ul>
</div>
    
    
    
    
    
    
    </section>
    
    
    <footer>
    	<%@include file="include/footer.jsp" %>
    </footer>
    </div>
</body>
</html>