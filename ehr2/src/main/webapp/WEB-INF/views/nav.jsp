<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="./css/style.css">
    <script defer src="./js/app.js"></script>
 <nav id="navbar">
	<div class="navbar__search">
            <h3>search</h3>
        </div> 
        <div class="navbar__logo">
            <h3>회사이름임ㅋㅋ</h3>
        </div>
        <ul class="navbar__menu">
            <li><a href="./main">홈으로&nbsp;&nbsp;</a></li>
            <li><a href="#" class="logout">로그아웃</a></li>
        </ul>
    </nav>
    
    <script type="text/javascript">
 $(function(){
	$(".logout").click(function(){
		if(confirm("로그아웃 하시겠습니까?")){
			alert("로그아웃 되었습니다. 다시 로그인해주세요.");
			location.href='logout';
		}
	}); 
 });
 </script>