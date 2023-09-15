<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
    <script src="./js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="../css/notice.css"> 

</head>
<body>
<%@ include file="nav.jsp" %>
<%@ include file="sidebar.jsp" %>
 <article id="article">
 <br>	
 <div class="atList">
       <h1 class="title">공지사항</h1>
       <c:choose><c:when test="${fn:length(list) gt 0 }">
             <div class="atList2">
             <div class="div-btn">
             <c:if test="${sessionScope.eid ne null }">
                <button type="button" class="viewBtn" onclick="location.href='./noticeWrite'">글쓰기</button>
             </c:if>
   </div>
                  <table class="table">
                     <thead>
                     <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                     </tr>
                     </thead>
                     <tbody><c:forEach items="${list }" var="row">
                     <tr onclick="location.href='./noticeDetail?nno=${row.nno}'">
                        <td>${row.nno}</td>
                        <td>${row.ntitle}
                        <td>${row.ename}</td>
                        <td>${row.ndate}</td>
                     </tr></c:forEach>
                     </tbody>
               </table></div></c:when><c:otherwise>
                     <h1>게시판에 글이 없습니다.</h1></c:otherwise></c:choose>

	</div>
</article> 
      
</body>
</html>