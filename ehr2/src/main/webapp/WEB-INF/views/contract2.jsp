<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="./css/modal2.css" rel="stylesheet" />
<link href="./css/style.css" rel="stylesheet" />
<link href="./css/contract.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$(".tr")
				.click(
						function() {
							let ename = $(this).find(".ename").text();
							let edept = $(this).find(".edept").text();
							let eemail = $(this).find(".eemail").text();

							let text = edept
									+ " "
									+ ename
									+ "님 연봉계약서 동의 여부가 선택되지 않았습니다.                                    확인 후 연봉계약서 동의 부탁드립니다.^^";

							$(".email").val(eemail);
							$(".content").val(text);

							$("#exampleModal").modal("show");

						});
	});
</script>
</head>
<body>
<%@ include file="nav.jsp" %>
<%@ include file="sidebar.jsp" %>
	<div class="total-content">
		<div class="top-area">
			<h1 class="example">관리자-연봉 동의목록</h1>
			<form action="./contract2" method="get">
				<ul>
					<li>조회기간<input type="month" name="cstrdate"> ~ <input
						type="month" name="cenddate"></li>
					<li>소속<input name="edept"></li>
					<li>직급 <select name="egrade">
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
					</li>
					<li>사번<input name="eid"></li>
					<li>성명<input name="ename" class="ename"></li>
					<li>재직상태 <select name="estate">
							<option value="0">재직</option>
							<option value="1">퇴사</option>
					</select>
					</li>
					<li>동의 <select name="cagree">
							<option value="0">비동의</option>
							<option value="1">동의</option>
					</select>
					</li>
				</ul>
				<button class="search">조회</button>
				<input type="hidden" name="eno" value="${sessionScope.eno}">
			</form>
		</div>
		<div class="middle">
			<table border="1">
				<tr>
					<th>No</th>
					<th>사번</th>
					<th>성명</th>
					<th>부서</th>
					<th>직급</th>
					<th>재직상태</th>
					<th>이메일주소</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>동의</th>
					<th>동의일자</th>
				</tr>
				<c:forEach items="${adclist }" var="row">
					<tr class="tr modalOpen">
						<td>${row.cno }</td>
						<td>${row.eid }</td>
						<td class="ename">${row.ename }</td>
						<td class="edept">${row.edept }</td>
						<td>${row.egrade }</td>
						<td>${row.estate }</td>
						<td class="eemail">${row.eemail }</td>
						<td class="cstrdate">${row.cstrdate }</td>
						<td class="cenddate">${row.cenddate }</td>
						<td>${row.cagree }</td>
						<td>${row.cagreedate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			data-bs-backdrop="static">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<!-- 헤더 바디 푸터 묶어주는 div -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">연봉동의 메일 보내기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
					<!-- 내용 start -->
						<div class="datail-detail">
							<div class="mail-content">
								<form action="./mail" method="post">
									<input class="title" type="text" name="title"
										value="연봉계약서 확인 바랍니다."> <input class="email"
										type="text" name="to" placeholder="받는 사람 email 주소를 적어주세요">
									<textarea class="content" name="content"></textarea>
									<button class="mail-button" type="submit">메일보내기</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
