<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <title>Salary</title>
                <link href="./css/salary.css" rel="stylesheet" />
                <link href="./css/style.css" rel="stylesheet" />
                <script src="./js/jquery-3.7.0.min.js"></script>
                <script type="text/javascript">

                    window.onload = function () {
                        today = new Date();
                        today = today.toISOString().slice(0, 7);
                        bir = document.getElementById("sdate");
                        bir.value = today;
                    }

                    $(function () {
                        $(".search").click(function () {
                            let eno = $(".eno").val();
                            let sdate = $("input[name='sdate']").val();

                            $.ajax({
                                url: "./searchSal",
                                type: "post",
                                data: { "eno": eno, "sdate": sdate },
                                dataType: "json",
                                success: function (data) {
                                    if (data.slist.sdate == null) {
                                        alert("급여가 지급되지 않았습니다. 다시 조회해주세요.");
                                        $(".sbasesal").text('');
                                        $(".seat").text('');
                                        $(".ssalary").text('');
                                        $(".snation").text('');
                                        $(".shealth").text('');
                                        $(".scare").text('');
                                        $(".shire").text('');
                                        $(".stake").text('');
                                        $(".ssalary").text('');
                                        $(".stake").text('');
                                        $(".sreal").text('');
                                        return false;
                                    }
                                    function formatNumber(number) {
                                        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    }

                                    $(".sbasesal").text(formatNumber(data.slist.sbasesal) + '원');
                                    $(".seat").text(formatNumber(data.slist.seat) + '원');
                                    $(".ssalary").text(formatNumber(data.slist.ssalary) + '원');
                                    $(".snation").text(formatNumber(data.slist.snation) + '원');
                                    $(".shealth").text(formatNumber(data.slist.shealth) + '원');
                                    $(".scare").text(formatNumber(data.slist.scare) + '원');
                                    $(".shire").text(formatNumber(data.slist.shire) + '원');
                                    $(".stake").text(formatNumber(data.slist.stake) + '원');
                                    $(".ssalary").text(formatNumber(data.slist.ssalary) + '원');
                                    $(".stake").text(formatNumber(data.slist.stake) + '원');
                                    $(".sreal").text(formatNumber(data.slist.sreal) + '원')
                                },


                                error: function (error) {
                                    alert("에러가 발생했습니다.");
                                }
                            });
                        });
                    });

                    function printPage() {
                        window.print();
                    }
                </script>
            </head>

            <body>
                <%@ include file="nav.jsp" %>
                    <%@ include file="sidebar.jsp" %>
                        <div class="total-content">
                            <h1>salary</h1>
                            <form action="./salary" method="get">
                                <input type="hidden" name="eno" class="eno" value="${sessionScope.eno}">
                                <input name="sdate" id="sdate" type="month">
                            </form>
                            <button class="search">조회</button>
                            <button class="print" onclick="printPage()">출력</button>
                            <br>

                            <div class="middle">
                                <table class="give" border="1">
                                    <tr>
                                        <th colspan="4">지급</th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">항목</th>
                                        <th colspan="2">금액</th>
                                    </tr>
                                    <tr>
                                        <td colspan="2">기본급</td>
                                        <td colspan="2" class="sbasesal">
                                            <fmt:formatNumber value="${slist.sbasesal}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">식대</td>
                                        <td colspan="2" class="seat">
                                            <fmt:formatNumber value="${slist.seat}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">합계</td>
                                        <td class="ssalary">
                                            <fmt:formatNumber value="${slist.ssalary}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                </table>

                                <table class="take" border="1">
                                    <tr>
                                        <th colspan="4">공제</th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">항목</th>
                                        <th colspan="2">금액</th>
                                    </tr>
                                    <tr>
                                        <td colspan="2">국민연금</td>
                                        <td colspan="2" class="snation">
                                            <fmt:formatNumber value="${slist.snation}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">건강보험</td>
                                        <td colspan="2" class="shealth">
                                            <fmt:formatNumber value="${slist.shealth}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">장기요양보험</td>
                                        <td colspan="2" class="scare">
                                            <fmt:formatNumber value="${slist.scare}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">고용보험</td>
                                        <td colspan="2" class="shire">
                                            <fmt:formatNumber value="${slist.shire}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">합계</td>
                                        <td class="stake">
                                            <fmt:formatNumber value="${slist.stake}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                </table>

                                <table class="total" border="1">
                                    <tr>
                                        <th colspan="4">세금내역</th>
                                    </tr>
                                    <tr>
                                        <td colspan="2">지급총액</td>
                                        <td colspan="2" class="ssalary">
                                            <fmt:formatNumber value="${slist.ssalary}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">공제총액</td>
                                        <td colspan="2" class="stake">
                                            <fmt:formatNumber value="${slist.stake}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">실지급액</td>
                                        <td colspan="2" class="sreal">
                                            <fmt:formatNumber value="${slist.sreal}" pattern="#,###" />원
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>
            </body>
            </html>