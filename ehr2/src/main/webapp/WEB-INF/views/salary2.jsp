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

$(document).ready(function() {
    // 저장 버튼 클릭 시 이벤트 핸들러
    $(".save").on("click", function() {
        let isEmpty = false; // 빈 필드 여부를 나타내는 변수
        let isValid = true; // 입력 값 유효성 여부를 나타내는 변수

        // 각 input 필드를 검사
        $(".ename, .edept, .egrade, .estate, .sdate, .sbasesal, .seat, .ssalary, .snation, .shealth, .scare, .shire, .stake, .sreal, .sannualsal, .scstrdate, .scenddate").each(function() {
            if ($(this).val() === "") {
                isEmpty = true; // 빈 필드가 있으면 isEmpty를 true로 설정
                return false; // 빈 필드를 찾았으므로 반복문을 종료
            } else if(!(isNaN($(".ename").val())) || !(isNaN($(".edept").val()))) {
            	alert("성명과 부서는 문자만 입력 가능합니다.");
        		$("select[name='eid']").val("");
        		$(".ename").val("");
        		$(".edept").val("");
                isValid = false;
                return false;
            } else if(isNaN($(".egrade").val()) || isNaN($(".estate").val()) || isNaN($(".sbasesal").val()) || isNaN($(".seat").val()) || isNaN($(".ssalary").val()) || isNaN($(".snation").val()) || isNaN($(".shealth").val()) || isNaN($(".scare").val()) || isNaN($(".shire").val()) || isNaN($(".stake").val()) || isNaN($(".sreal").val()) || isNaN($(".sannualsal").val())){
                alert("성명/부서/직급/재직상태/급여일자 등에는 숫자가 아닌 값이 포함될 수 없습니다.");
        		$(".sbasesal").val("");
        		$(".seat").val("");
        		$(".ssalary").val("");
        		$(".snation").val("");
        		$(".shealth").val("");
        		$(".scare").val("");
        		$(".shire").val("");
        		$(".stake").val("");
        		$(".sreal").val("");
        		$(".sannualsal").val("");
                isValid = false;
                return false;
            }
        });

        if (isEmpty || !isValid) {
            // 빈 필드가 있는 경우 알람 띄우고 저장 버튼 비활성화
            if (isEmpty) {
                alert("모든 필드를 입력해주세요.");
            }
            return false; // 폼 전송을 중지
        }  else {
            // 입력값이 유효하고 빈 필드가 없는 경우 폼을 다시 전송
            $(this).closest("form").submit();
        }
        
    });
	
	
$(".employeeSelect").on("change", function() {
    let eid = $(this).val();
    if (eid !== "") {
        $.ajax({
            url: "./searchEmp", // 서버의 URL을 입력하세요.
            type: "post",
            data: { "eid": eid },
            dataType: "json",
            success: function (data) {
                // 서버에서 받아온 데이터를 처리하는 코드
                //alert(data.elist.ename)
            	$(".ename").val(data.elist.ename);                
            	$(".edept").val(data.elist.edept);                
            	$(".egrade").val(data.elist.egrade);                
            	$(".estate").val(data.elist.estate);                
            },
            error: function (error) {
	            $(".retry").text("올바른 사번이 아닙니다. 5자리로 존재하는 사번을 다시 입력해주세요.").css({"color": "red", "font-weight": "bold"});
	            $(".save").prop("disabled", true);
            }
        });
    }
});
});

/* $(document).ready(function() {
    $(".eid").on("input", function() {
	        let eid = $(".eid").val();
    	
	    $.ajax({
	        url: "./searchEmp",
	        type: "post",
	        data: { "eid": eid},
	        dataType: "json",
	        success: function (data) {
	        	
	        	 $(".retry").text(""); // 올바른 값 입력 시 .retry 텍스트 초기화
	             $(".save").prop("disabled", false); // 버튼 활성화
	        },
	
	        error: function (error) {
	            $(".retry").text("올바른 사번이 아닙니다. 5자리로 존재하는 사번을 다시 입력해주세요.").css({"color": "red", "font-weight": "bold"});
	            $(".save").prop("disabled", true);
	            
	        }//에러 끝
	    });//ajax 끝
    }); //.eid input function 끝
}); //document 끝 */

$(document).ready(function() {
    // sbasesal input과 seat input에 입력 값이 변경될 때마다 합을 계산하고 ssalary input에 할당
    $(".sbasesal, .seat").on("input", function() {
        // sbasesal과 seat 입력 값 가져오기
        let sbasesal = parseInt($(".sbasesal").val().replace(/,/g, '')) || 0;
        let seat = parseInt($(".seat").val().replace(/,/g, '')) || 0;

        // 합계 계산
        let ssalary = sbasesal + seat;

        // 합계를 ssalary input에 설정
        $(".ssalary").val(ssalary);
        
       let ssalary2 = $(".ssalary").val();
        
 	   let snation = parseInt(ssalary2 * 0.045)|| 0;
	   let shealth = parseInt(ssalary2 * 0.03545)|| 0;
	   let scare = parseInt(ssalary2 * 0.00454)|| 0;;
	   let shire = parseInt(ssalary2 * 0.009)|| 0;;
	   let stake = snation + shealth + scare + shire;
	   let sreal = ssalary - stake;
	   let sannualsal = ssalary * 12;

	   $(".snation").val(snation);
	   $(".shealth").val(shealth);
	   $(".scare").val(scare);
	   $(".shire").val(shire);
	   $(".stake").val(stake);
	   $(".sreal").val(sreal);
	   $(".sannualsal").val(sannualsal);
	   
    });
});


function getsno() {
    let row = [];
    
    $("input[name=check]:checked").each(function() {
        let sno = $(this).closest('tr').find('.csno').text();
        row.push(sno);
    });

    if (row.length > 0) {
        $.ajax({
            url: "./deleteRows", // 서버의 URL을 입력하세요.
            type: "post",
            data: { "row" : row },
            dataType: "json",
            success: function (data) {
                alert("선택한 행이 삭제되었습니다.");
                $("input[name=check]:checked").prop("checked", false);
                location.href="./salary2?eno="+${sessionScope.eno};
            },
            error: function (error) {
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    } else {
        alert("삭제할 행을 선택해주세요.");
    }
}

$(function(){
	$("#allCheck").click(function() {
	    if($("#allCheck").is(":checked")) $("input[name=check]").prop("checked", true);
	    else $("input[name=check]").prop("checked", false);
	 });
});

function getcontent() {
	let count = $("input[name=check]:checked");
	
    if(count.length > 1){
    	alert("급여 복사는 하나만 가능합니다.");
        $("input[name=check]:checked").prop("checked", false);
		$("select[name='eid']").val("");
		$(".ename").val("");
		$(".edept").val("");
		$(".egrade").val("");
		$(".estate").val("");
		$(".sdate").val("");
		$(".sbasesal").val("");
		$(".seat").val("");
		$(".ssalary").val("");
		$(".snation").val("");
		$(".shealth").val("");
		$(".scare").val("");
		$(".shire").val("");
		$(".stake").val("");
		$(".sreal").val("");
		$(".sannualsal").val("");
		$(".scstrdate").val("");
		$(".scenddate").val("");
    	return false;
    } 
    
    $("input[name=check]:checked").each(function() {
    	
		let csdel = $(this).closest('tr').find('.csdel').text();
		let ceid = $(this).closest('tr').find('.ceid').text();
		let cename = $(this).closest('tr').find('.cename').text();
		let cedept = $(this).closest('tr').find('.cedept').text();
		let cegrade = $(this).closest('tr').find('.cegrade').text();
		let cestate = $(this).closest('tr').find('.cestate').text();
		let csdate = $(this).closest('tr').find('.csdate').text();
		let csbasesal = parseInt(($(this).closest('tr').find('.csbasesal').text()).replace(/,/g, '')) || 0;
		let cseat = parseInt(($(this).closest('tr').find('.cseat').text()).replace(/,/g, '')) || 0;
		let cssalary = parseInt(($(this).closest('tr').find('.cssalary').text()).replace(/,/g, '')) || 0;
		let csnation = parseInt(($(this).closest('tr').find('.csnation').text()).replace(/,/g, '')) || 0;
		let cshealth = parseInt(($(this).closest('tr').find('.cshealth').text()).replace(/,/g, '')) || 0;
		let cscare = parseInt(($(this).closest('tr').find('.cscare').text()).replace(/,/g, '')) || 0;
		let cshire = parseInt(($(this).closest('tr').find('.cshire').text()).replace(/,/g, '')) || 0;
		let cstake = parseInt(($(this).closest('tr').find('.cstake').text()).replace(/,/g, '')) || 0;
		let csreal = parseInt(($(this).closest('tr').find('.csreal').text()).replace(/,/g, '')) || 0;
		let csannualsal = parseInt(($(this).closest('tr').find('.csannualsal').text()).replace(/,/g, '')) || 0;
		let cscstrdate = $(this).closest('tr').find('.cscstrdate').text();
		let cscenddate = $(this).closest('tr').find('.cscenddate').text();
		
		alert("복사되었습니다.");
		
		$("select[name='eid']").val(ceid);
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

}

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
					<li>성명<input name="ename"></li>
					<li>재직상태 <select name="estate">
							<option value="0">재직</option>
							<option value="1">퇴사</option>
					</select>
					</li>
				</ul>
				<button class="search">조회</button>
				<button type="button" class="delBtn" onclick="getsno()">삭제</button>
				<button type="button" class="copyBtn" onclick="getcontent()">복사</button>
				<input type="hidden" name="eno" value="${sessionScope.eno}">
			</form>
			<div class="middle-area">
					<div class="table-area">
						<table border="1">
							<tr>
								<td><input type="checkbox" id="allCheck"></td>
								<td>No</td>
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
								<tr>
								<td class="csdel"><input type="checkBox" name="check" id="check" value=${row.sno }></td>
								<td class="csno">${row.sno }</td>
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
						<button class="save">저장</button>
						<input name="eno" value="${sessionScope.eno}">
						<span class="retry"></span>
					<table border="1">
							<tr>
								<td>No</td>
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
								<td>
									<select name="eid" class="employeeSelect">
										 <option value="">-- 선택 --</option>
	   								<c:forEach items="${eidList}" var="row">
	        							<option value="${row.eid}">${row.eid}</option>
	   								</c:forEach>
									</select>
								</td>
								<td><input class="ename" name="ename" ></td>
								<td><input class="edept" name="edept" ></td>
								<td><input class="egrade" name="egrade" ></td>
								<td><input class="estate" name="estate" ></td>
								<td><input class="sdate" name="sdate" type="date" ></td>
								<td><input  class="sbasesal" name="sbasesal" ></td>
								<td><input  class="seat" name="seat" ></td>
								<td><input class="ssalary" name="ssalary"></td>
								<td><input  class="snation" name="snation" ></td>
								<td><input class="shealth" name="shealth"></td>
								<td><input class="scare" name="scare" ></td>
								<td><input class="shire" name="shire" ></td>
								<td><input class="stake" name="stake" ></td>
								<td><input class="sreal" name="sreal" ></td>
								<td><input  class="sannualsal" name="sannualsal" ></td>
								<td><input class="scstrdate" name="scstrdate" type="date"></td>
								<td><input class="scenddate" name="scenddate" type="date"></td>
								</tr>
						</table>
					</form>
			</div>
		</div>




	</div>

</body>
</html>
