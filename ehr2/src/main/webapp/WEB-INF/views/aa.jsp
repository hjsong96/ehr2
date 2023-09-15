<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<style type="text/css">
@charset "UTF-8";

.nav_container {
    position: static;
    display: flex;
    width: 106.667em;
    min-width: 106.667em;
    padding: 0 1.25em;
    margin: 1.25em auto 0;

}

.content_join{
	position: static;
	width: 60%;
	min-height: auto;
	border-radius: 2px;
	padding: 1.25em 0em 2.5em;

}

* {
	box-sizing: border-box;
}

div {
	display: block;
}

.board_head {
	position: relative;
	display: flex;
	align-items: center;
	padding: 0.417em 0;
	border-bottom: 1px solid #E2E2E2;
}

.board_name h2 {
	font-size: 1.5em;
	letter-spacing: -0.5px;
}

.board_name {
	display: flex;
	align-items: center;
	padding: 0.833em 0;
}

.board_name h2 {
	font-size: 1.5em;
	letter-spacing: -0.5px;
}

h1, h2, h3, h4 {
	font-weight: 400;
}

.form_title {
	font-size: 1.333em;
	color: #333;
	font-weight: 500;
	letter-spacing: -0.2px;
	padding: 0.75em 0;
	margin: 0.625em 0 0;
	border-bottom: 1px solid #ccc;
}

input {
	background-color: #fff;
}

.reg_text{
	font-size: 1.333em;
	font-weight: 500;
}

.form_title .title_tip {

	position: relative;
	top: -0.083em;
	font-size: .75em;
	color: #FF5722;
	padding: 0 0 0 0.417em;
}

.form.topline {
	border-top: 0;
}

.form table {
	width: 100%;
}

.form {
	padding: 1.667em 0.833em;
	border: 1px solid #ddd;
}

.form th.id {
	width: 16.25em;
}

.form th {
	width: auto;
	height: 4.167em;
	font-weight: 500;
	text-align: right;
	padding: 0.75em 0.833em;
}

.form th.id {
	width: 16.25em;
}

.form th {
	width: auto;
	height: 4.167em;
	font-weight: 500;
	text-align: right;
	padding: 0.75em 0.833em;
}

.form th, .form td {
	color: #333;
	vertical-align: top;
}

.form td {
    width: auto;
    text-align: left;
    padding: 10px 0 0.833em;
}
.form input[type="text"], .form input[type="password"], .form input[type="date"],
	.form input[type="email"], .form input[type="file"]
	{
	width: 100%;
	max-width: 16.667em;
	height: 2.5em;
	color: #333;
	padding: 0.583em 0.833em;
}

input[type="text"], input[type="password"], input[type="date"], input[type="email"],
	input[type="file"]{
	border-radius: 2px;
	border: 1px solid rgba(0, 0, 0, 0.15);
	outline: none;
	-webkit-appearance: none;
	vertical-align: middle;
}

input {
	background-color: #fff;
}

.form .alert, .form .completed, .form .tip, .form .red, .form .orange, .form .blue, .form .green {
    display: block;
    color: #D43F3A;
    line-height: 1.4;
    margin: 0.833em 0 1.25em;
}

input, optgroup, select{
    font: inherit;
    color: inherit;
    border: 0;
    border-radius: 0;
    margin: 0;
    background-color: inherit;
}

.egrade {
	margin: 7px;
	padding: 0px;
	border-radius: 2px;
    border: 1px solid rgba(0, 0, 0, 0.15);
}

.edept {
	margin: 7px;
	padding: 0px;
	border-radius: 2px;
    border: 1px solid rgba(0, 0, 0, 0.15);
}

.ebank{
	margin: 7px;
	padding: 0px;
	border-radius: 2px;
    border: 1px solid rgba(0, 0, 0, 0.15);
}

.egender{
	margin: 7px;
	padding: 0px;
	border-radius: 2px;
    border: 1px solid rgba(0, 0, 0, 0.15);
}

button {
	/* color: white;
	background-color: #37475A; */
	text-align: center;
	margin-right: 4px;
	font-size: 1.333em;
}

#navbar{
    position: fixed;
    width: 100%;
    top: 0;
    display: flex;
    justify-content: space-between;
    background-color: black;
    color: white;
    min-height: 8%;
    border-bottom: none; 
    
}

.navbar__menu{
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
    align-content: center;
}
</style>
</head>
<body>
 <nav id="navbar">
	<div class="navbar__search">
            <h3>search</h3>
        </div> 
        <div class="navbar__logo">
            <h3>logo</h3>
        </div>
        <ul class="navbar__menu">
            <li><a href="./main">홈으로&nbsp;&nbsp;</a></li>
            <li><a href="#" class="logout">로그아웃</a></li>
        </ul>
    </nav>

   <div class="nav_container">
      <div class="content_join" id="div_content">
         <div class="reg_text">관리자 - 회원등록페이지</div>
         <div class="board_head"></div>
         <h3 class="form_title">
            사원정보입력<span class="title_tip"></span>
         </h3>
         <form action="./join" method="post" enctype="multipart/form-data">
         <div class="form topline">
               <table>
                  <tbody>
                     <tr>
                        <th class="id">부서</th>
                           <td>
                              <select name="edept" class="edept">
                                 <option value="경영관리실">경영관리실</option>
                                 <option value="솔루션개발팀">솔루션개발팀</option>
                                 <option value="ICT사업팀">ICT사업팀</option>
                                 <option value="헬스케어개발팀">헬스케어개발팀</option>
                                 <option value="디자인UI-UX팀">디자인UI-UX팀</option>
                                 <option value="마케팅팀">마케팅팀</option>
                              </select>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">직급</th>
                           <td>
                              <select name="egrade" class="egrade">
                                 <option value="0">사원</option>
                                 <option value="1">주임</option>
                                 <option value="2">대리</option>
                                 <option value="3">과장</option>
                                 <option value="4">차장</option>
                                 <option value="5">부장</option>
                                 <option value="6">부사장</option>
                                 <option value="7">사장</option>
                                 <option value="8">관리자</option>
                              </select>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">입사일</th>
                           <td>
                              <input type="date" name="ehiredate" id="ehiredate" placeholder="입사일">
                              <span id="ehiredateMsg" class="tip"></span>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">주소</th>
                           <td>
                              <input type="text" name="eaddr" id="eaddr" placeholder="주소" maxlength="25"><br>
                              <input type="text" name="eaddr_detail" id="eaddr_detail" placeholder="상세주소"  maxlength="25">
                              <span id="eaddrMsg" class="tip"></span>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">생년월일</th>
                           <td>
                              <input type="date" name="ebirth" id="ebirth" placeholder="생일">
                              <span id="ebirthMsg" class="tip"></span>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">성별</th>
                           <td>
                              <select name="egender" class="egender">
                                 <option value="man">남자</option>
                                 <option value="woman">여자</option>
                              </select>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">핸드폰번호</th>
                           <td>
                              <input type="text" name="ephoneno" id="ephoneno" placeholder="핸드폰번호" maxlength="12">
                              <span id="ephonenoMsg" class="tip"></span>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">은행이름</th>
                           <td>
                              <select name="ebank" class="ebank">
                                 <option value="국민은행">국민은행</option>
                                 <option value="신한은행">신한은행</option>
                                 <option value="신한은행">농협</option>
                                 <option value="카카오뱅크">카카오뱅크</option>
                                 <option value="토스뱅크">토스뱅크</option>
                              </select>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">계좌번호</th>
                           <td>
                              <input type="text" name="eaccount" id="eaccount" placeholder="계좌번호" maxlength="5">
                              <span id="eaccountMsg" class="tip"></span>
                           </td>
                     </tr>
                     <tr>
                        <th class="id">사진</th>
                           <td>
                              <input type="file" name="eimg" id="eimg"><br>
                              <span id="eimgMsg" class="tip"></span>
                           </td>
                           </tr>
                     <tr>
                  </tbody>
               </table>
            </div>
            <div class="form_button">
               <button type="submit" class="button_join" disabled="disabled" >회원등록</button>
               <button type="button" class="register_cancel_button" onclick="location.href='./'">취소</button>
            </div>
         </form>
      </div>
   </div>

</body>
</html>