<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="./css/style.css">
    <script defer src="./js/app.js"></script>
	<aside id="sidebar">
            <ul class="sidebar__menu">
                <li id="menu1">
                    <a href="./main">메인페이지</a>
                </li>
                <li id="menu2">
                    <a href="#">인사관리</a>
                    <ul>
                        <li><a href="./join">사원등록</a></li>
                        <li><a href="#">text2</a></li>
                        <li><a href="#">text3</a></li>
                        <li><a href="#">text4</a></li>
                    </ul>
                </li>
                <li id="menu3">
                    <a href="#"">급여관리</a>
                    <ul>
                        <li><a href="./salary?eno=${sessionScope.eno}">개인월급여내역</a></li>
                        <li><a href="./contract?eno=${sessionScope.eno}">연봉계약서</a></li>
                        <li><a href="./salary2?eno=${sessionScope.eno}">관리자-급여목록</a></li>
                        <li><a href="./contract2?eno=${sessionScope.eno}">관리자-연봉동의목록</a></li>
                    </ul>
                </li>
                <li id="menu4">
                    <a href="#">근태관리</a>
                    <ul>
                        <li><a href="./attendRegister">근태관리</a></li>
                        <li><a href="#">text2</a></li>
                        <li><a href="#">text3</a></li>
                        <li><a href="#">text4</a></li>
                    </ul>
                </li>
                <li id="menu5">
                    <a href="#">게시판</a>
                    <ul>
                        <li><a href="./notice">공지사항</a></li>
                        <li><a href="#">익명게시판</a></li>
                        <li><a href="#">text3</a></li>
                        <li><a href="#">text4</a></li>
                    </ul>
                </li>
                <li id="menu6">
                    <a href="#" id="menu6" class="logout">로그아웃</a>
                </li>
            </ul>
        </aside>
        
