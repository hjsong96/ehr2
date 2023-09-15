<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary</title>
<link href="./css/salary.css" rel="stylesheet" />
<link href="./css/style.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	$(function(){
		$(".copy").click(function(){
			
			let csdel = $(this).find(".csdel").text(); 
			let ceid = $(this).find(".ceid").text(); 
			let cename = $(this).find(".cename").text(); 
			let cedept = $(this).find(".cedept").text(); 
			let cegrade = $(this).find(".cegrade").text(); 
			let cestate = $(this).find(".cestate").text(); 
			let csdate = $(this).find(".csdate").text(); 
			let csbasesal = ($(this).find(".csbasesal").text()).replace(/[^\d]/,''); 
			let cseat = ($(this).find(".cseat").text()).replace(/[^\d]/,''); 
			let cssalary = ($(this).find(".cssalary").text()).replace(/[^\d]/,''); 
			let csnation = ($(this).find(".csnation").text()).replace(/[^\d]/,''); 
			let cshealth = ($(this).find(".cshealth").text()).replace(/[^\d]/,''); 
			let cscare = ($(this).find(".cscare").text()).replace(/[^\d]/,''); 
			let cshire = ($(this).find(".cshire").text()).replace(/[^\d]/,''); 
			let cstake = ($(this).find(".cstake").text()).replace(/[^\d]/,''); 
			let csreal = ($(this).find(".csreal").text()).replace(/[^\d]/,''); 
			let csannualsal = ($(this).find(".csannualsal").text()).replace(/[^\d]/,''); 
			let cscstrdate = $(this).find(".cscstrdate").text(); 
			let cscenddate = $(this).find(".cscenddate").text(); 
			
			alert("복사되었습니다.");
			
			$(".sdel").val(csdel);
			$(".eid").val(ceid);
			$(".ename").val(cename);
			$(".edept").val(cedept);
			$(".egrade").val(cegrade);
			$(".estate").val(cestate);
			$(".sdate").val(csdate);
			$(".sbasesal").val(csbasesal);
			$(".seat").val(cseat);
			$(".ssalary").val(cssalary);
			$(".snation").val(csnation);
			$(".shealth").val(cshealth);
			$(".scare").val(cscare);
			$(".shire").val(cshire);
			$(".stake").val(cstake);
			$(".sreal").val(csreal);
			$(".sannualsal").val(csannualsal);
			$(".scstrdate").val(cscstrdate);
			$(".scenddate").val(cscenddate);
			
		});
		
	});

	
	


</script>
</head>
<body>
<%@ include file="nav.jsp" %>
<%@ include file="sidebar.jsp" %>
	<div class="total-content">
		<h1>관리자-급여목록</h1>
		<div class="top-area">
			<form action="./salary2" method="get">
				<ul>
					<li>조회기간<input type="month" name="scstrdate" > ~ <input type="month" name="scenddate"></li>
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
				</ul>
				<button class="search">조회</button>
				<input type="hidden" name="eno" value="${sessionScope.eno}">
			</form>
			<div class="middle-area">
					<div class="table-area">
						<table border="1">
							<tr>
								<td>No</td>
								<td>삭제</td>
								<td>사번</td>
								<td>성명</td>
								<td>부서</td>
								<td>직급</td>
								<td>재직상태</td>
								<td>급여일자</td>
								<td>기본급</td>
								<td>변동급</td>
								<td>월단위총액</td>
								<td>국민연금</td>
								<td>건강보험</td>
								<td>장기요양보험</td>
								<td>고용보험</td>
								<td>과세총액(공제액)</td>
								<td>실지급액</td>
								<td>연봉총액</td>
								<td>시작일</td>
								<td>종료일</td>
							</tr>
							<c:forEach items="${list }" var="row">
								<tr class="copy">
								<td class="csno">${row.sno }</td>
								<td class="csdel">${row.sdel }</td>
								<td class="ceid">${row.eid }</td>
								<td class="cename">${row.ename }</td>
								<td class="cedept">${row.edept }</td>
								<td class="cegrade">${row.egrade }</td>
								<td class="cestate">${row.estate }</td>
								<td class="csdate">${row.sdate }</td>
								<td class="csbasesal"><fmt:formatNumber value="${row.sbasesal }" pattern="#,###" />원</td>
								<td class="cseat"><fmt:formatNumber value="${row.seat }" pattern="#,###" />원</td>
								<td class="cssalary"><fmt:formatNumber value="${row.ssalary }" pattern="#,###" />원</td>
								<td class="csnation"><fmt:formatNumber value="${row.snation }" pattern="#,###" />원</td>
								<td class="cshealth"><fmt:formatNumber value="${row.shealth }" pattern="#,###" />원</td>
								<td class="cscare"><fmt:formatNumber value="${row.scare }" pattern="#,###" />원</td>
								<td class="cshire"><fmt:formatNumber value="${row.shire }" pattern="#,###" />원</td>
								<td class="cstake"><fmt:formatNumber value="${row.stake }" pattern="#,###" />원</td>
								<td class="csreal"><fmt:formatNumber value="${row.sreal }" pattern="#,###" />원</td>
								<td class="csannualsal"><fmt:formatNumber value="${row.sannualsal }" pattern="#,###" />원</td>
								<td class="cscstrdate">${row.scstrdate }</td>
								<td class="cscenddate">${row.scenddate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="page_wrap">
						<div class="page_nation">
					 <div class="page_left_wrap">
				      <c:if test="${ph.showPrev}">
				            <button class="page_left" onclick="location.href='./salary2?eno=${sessionScope.eno}&page=${ph.startPage-1}'">이전</button>
				        </c:if>
				     </div>
				      <c:forEach var="i" begin="${ph.startPage}" end="${ph.endPage}">
						<a class="num" href="<c:url value='./salary2?eno=${sessionScope.eno}&page=${i}&pageSize=${ph.pageSize}'/>" data-page="${i}">${i}</a>
				      </c:forEach>
				      <c:if test="${ph.showNext}">
				            <button class="page_right" onclick="location.href='./salary2?eno=${sessionScope.eno}&page=${ph.endPage+1}'">다음</button>
				        </c:if>
						</div>
				   </div>
					
					<h1>급여등록</h1>
					<form action="./salary2" method="post">
						<button>저장</button>
						<input  name="eno" value="${sessionScope.eno}">
					<table border="1">
							<tr>
								<td>No</td>
								<td>삭제</td>
								<td>사번</td>
								<td>성명</td>
								<td>부서</td>
								<td>직급</td>
								<td>재직상태</td>
								<td>급여일자</td>
								<td>기본급</td>
								<td>변동급</td>
								<td>월단위총액</td>
								<td>국민연금</td>
								<td>건강보험</td>
								<td>장기요양보험</td>
								<td>고용보험</td>
								<td>과세총액(공제액)</td>
								<td>실지급액</td>
								<td>연봉총액</td>
								<td>시작일</td>
								<td>종료일</td>
							</tr>
								<tr>
								<td></td>
								<td><input class="sdel" name="sdel" value=""></td>
								<td><input class="eid" name="eid" value=""></td>
								<td><input class="ename" name="ename" value=""></td>
								<td><input class="edept" name="edept" value=""></td>
								<td><input class="egrade" name="egrade" value=""></td>
								<td><input class="estate" name="estate" value=""></td>
								<td><input class="sdate" name="sdate" value="" type="date" ></td>
								<td><input class="sbasesal" name="sbasesal" value=""></td>
								<td><input class="seat" name="seat" value=""></td>
								<td><input class="ssalary" name="ssalary" value=""></td>
								<td><input class="snation" name="snation" value=""></td>
								<td><input class="shealth" name="shealth" value=""></td>
								<td><input class="scare" name="scare" value=""></td>
								<td><input class="shire" name="shire" value=""></td>
								<td><input class="stake" name="stake" value=""></td>
								<td><input class="sreal" name="sreal" value=""></td>
								<td><input class="sannualsal" name="sannualsal" onchange = ></td>
								<td><input class="scstrdate" name="scstrdate" value=""></td>
								<td><input class="scenddate" name="scenddate" value=""></td>
								</tr>
						</table>
					</form>
			</div>
		</div>




	</div>

</body>
</html>
