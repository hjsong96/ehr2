<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function ndetailCancel(){
	location.href="./noticeDetail?nno=${res.nno}";
}

/* function ndetailUp(){
	if(confirm("수정하시겠습니까?")){
		location.href="./ndetailUp";
	}
} */
</script>

</head>
<body>
<%@ include file="nav.jsp" %>
<%@ include file="sidebar.jsp" %>
 <article id="article">
 <br>	
 <form action="/ndetailUp" method="post">
제목<input type="text" name="ntitle" value="${res.ntitle }"><br>
내용 : <input type="text" name="ncontent" value="${res.ncontent }"><br>
<button class="ndetailcancel" onclick="ndetailCancel()">취소</button>
<button class="ndetailUp" onclick="ndetailUp()">수정</button>
<input type="text" name="ename" value="${res.ename }"hidden="hidden" ><br>
<input type="text" name="ndate" value="${res.ndate }" hidden="hidden">
<input type="text" name="eno" value="${res.eno }" hidden="hidden">
<input type="text" name="nno" value="${res.nno}" hidden="hidden">
 </form>
</article>
</body>
</html>