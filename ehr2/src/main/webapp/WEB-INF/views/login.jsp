<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.8/clipboard.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">




$(function(){

   
   
   $(".findPW").hide();
   $(".findID").hide();

   
   //쿠키 값 가져오기
   let userID = getCookie("userID");//아이디
   let setCookieY = getCookie("setCookie");//Y
   
   //쿠키 검사 -> 쿠키가 있다면 해당 쿠키에서 id값 가져와서 id칸에 붙여넣기
   if(setCookieY == 'Y'){
      $("#saveID").prop("checked", true);
      $(".signin_id").val(userID);
   }else{
      $("#saveID").prop("checked", false);
   }
   
   $(".loginBtn").click(function(){
      $(".pwInfo").css("color","black");
      $(".findPW").hide();
      $(".findID").hide();
      let id = $(".signin_id").val();
      let pw = $(".signin_pw").val();
      $(".pwInfo").text("");
      $(".idInfo").text("");
      
      
      
       let notNum = /[^0-9]/g;

       if (notNum.test(id)) {
           alert("사번에는 숫자 이외의 값이 들어올 수 없습니다.");
           let result = id.replace(notNum, "");
           $("#signin_id").val(result);
           $(".idInfo").css("color","red");
         $(".idInfo").text("올바른 사번을 입력해주세요");         
         $(".signin_id").focus();
           return false;
       }
      
      

      
      
      if($(".signin_id")==null||$(".signin_id").val().length != 5){
         alert("사번은 5자리여야 합니다.");
         $(".signin_id").val("");
         $(".idInfo").css("color","red");
         $(".idInfo").text("올바른 사번을 입력해주세요");         
         $(".signin_id").focus();
         return false;
      }
      if( $(".signin_pw").length == null ||$(".signin_pw").val().length < 5){
         alert("비밀번호은 5자리 이상입니다.");
         $(".signin_pw").val("");
         $(".pwInfo").css("color","red");
         $(".pwInfo").text("올바른 비밀번호를 입력해주세요");         
         $(".signin_pw").focus();
         return false;
      }
      if($("#saveID").is(":checked")){
         //setCookie("userID", 사용자가 입력한 아이디, 기간 ex : 7이면 7일 );
         setCookie("userID", id, 7);
         setCookie("setCookie", "Y", 7);
      }else{
         //deleteCookie();
         deleteCookie("userID");
         deleteCookie("setCookie");
         
      }
            
         //ajax
      $.ajax({
          url: "./loginCheck",
          type: "post",
          data: {"id": id, "pw": pw},
          dataType: "json",
          success: function(data){
             let ecount = data.ecount +1;
             
             if(data.result == 1 && data.ecount > 5){
                  $(".idInfo").css("color","red");
                  $(".idInfo").text("비밀번호를 5회 초과하여 잘못 입력했습니다. 관리팀(0000-0000)에 문의하세요.");
                  $(".id").focus();
                  $(".loginBtn").hide();
                  return false;
              }
             
             
             if(data.result == 1 && data.ecount < 5){
                let form = $('<form></form>')
               form.attr("action", "./main");
               form.attr("method", "get");
               
               
               form.appendTo("body");
               
               form.submit();
              }
             
             
              if(data.IDresult == 0){
                  alert("일치하는 아이디가 없습니다.");
                  $(".idInfo").css("color","red");
                  $(".idInfo").text("사번을 다시 확인해주세요.");            
                  $(".id").focus();
                  $(".pwInfo").text("사번을 잊으셨나요?");
                  $(".findID").show();
              }
              
              
              if(data.result == 0){
                  alert("비밀번호를 잘못 입력하셨습니다.");
                  $(".idInfo").css("color","red");
                  $(".idInfo").text("비밀번호를 "+ecount+"/5 회 잘못 입력했습니다. 5회를 초과하면 계정이 잠깁니다.");            
                  $(".id").focus();
                  $(".pwInfo").text("비밀번호를 잊으셨나요?");
                  $(".findPW").show();
                  if(ecount > 5){
                      $(".idInfo").css("color","red");
                      $(".idInfo").text("비밀번호를 5회 초과하여 잘못 입력했습니다. 관리팀(0000-0000)에 문의하세요.");    
                      $(".loginBtn").hide();
                  }
              }

          },
          error : function(error){
              alert("ㅠㅠ" + error);
              
          }
      });
            
         
   });//로그인 버튼 클릭
   
   
});

//setCookie()
function setCookie(cookieName, value, exdays){
   let exdate = new Date();
   exdate.setDate(exdate.getDate() + exdays);
   let cookieValue = value + ((exdays == null) ? "" : ";expires=" + exdate.toGMTString());
   //              userID = poseidon;expires=2023-08-30
   document.cookie = cookieName+"="+cookieValue;
}

//deleteCookie()
function deleteCookie(cookieName){
   let expireDate = new Date();
   expireDate.setDate(expireDate.getDate() - 1);
   document.cookie = cookieName+"= "+";expires="+expireDate.toGMTString();
   
}
//getCookie()
function getCookie(cookieName){
   let x, y;
   let val = document.cookie.split(";");
   for(let i =0; i < val.length; i++){
      x = val[i].substr(0, val[i].indexOf("="));
      y = val[i].substr(val[i].indexOf("=") +1); // 저 시작위치부터 끝까지
      //x = x.replace(/^\s+|\s+$/g, '');
      x = x.trim();
      if(x == cookieName){
         return y;
      }
      
      
   }
}
</script>
<script type="text/javascript">
$(function(){
   $(".login-result").hide();
   
   
   
   $(".findID").click(function(){

      
      $(".ename").val("");
      $(".errn").val("");
      $(".errn2").val("");
      $(".IDResult").hide();
      $("#myModal").modal("show");
   });
   
   $(".fbtn").click(function(){
      let ename = $(".ename").val();
      
      let errn1 = $(".errn").val();
      let errn2 = $(".errn2").val();
      let errn = errn1+'-'+errn2;
      
      
      if(errn1.length != 6){
         alert("주민등록번호 앞자리는 6자리입니다.");
         $(".errnInfo").css("color","red");
         $(".errnInfo").text("올바른 주민등록번호를 입력해주세요");   
         return false;
      }
      if(errn2.length != 7){
         alert("주민등록번호 뒷자리는 7자리입니다.");
         $(".errnInfo").css("color","red");
         $(".errnInfo").text("올바른 주민등록번호를 입력해주세요");      
         return false;
      }
      
      $.ajax({
         
         url : "/findID",
         type : "post",
         data : {ename : ename, errn : errn},
         dataType : "json",
         success : function(data){
            if(data.result.ename != null){

            
            
            $(function() {
               
                 
                 
               $(".eidresult").val(data.result.eid);

                   
               $(".IDResult").text(data.result.ename+" 님의 사번은 "+data.result.eid +" 입니다.").css({
                   "text-align": "center", // 가운데 정렬
                   "font-size": "23px", // 글꼴 크기
                   "font-weight": "bold" // 글꼴 굵기
               });   
               $(".IDResult").show();
                $(".login-result").show();
                $(".findPW").show();
                $(".findID").hide();
               $(".pwInfo").hide();
                $(".saveCookie").click(function(){
                   setCookie("userID", data.result.eid, 7);
                   setCookie("setCookie", "Y", 7);
                   alert("사번이 저장되었습니다. 로그인하기 버튼을 눌러주세요.");
                   $(".saveCookie").hide();
                });
            });
            }else{
               alert("입력하신 정보와 일치하는 사번이 없습니다. 다시 확인해주세요.");
            }
         },
         error : function(){
            alert("ㅠㅠ");
         }
      });
      
      
   });
   
   $(".findPW").click(function(){
      $("#myModal").modal("hide");
      $("#modal").modal("show");
         $(".fbtnPW").click(function(){
            $(".fbtnPW").prop("disabled", true);
            
            
            let idPW = $(".eidPW").val();
            let name = $(".enamePW").val();
            let pnum = $(".pnum1").val()+$(".pnum2").val()+$(".pnum3").val();
            
            
            $.ajax({
               url : "findPW",
               type : "post",
               data : {idPW : idPW , name: name, pnum : pnum},
               dataType : "json",
               success:function(data){
               if(data.result.ename != null && data.result.eid != null && data.result.eemail2 != null){
                  if(data.error == null){
                     $(".PWResult").text("임시 비밀번호를 " + data.result.ename+" 님께서 등록한 개인 이메일인 "+data.result.email2 +"로 보냈습니다. 메일을 확인해주세요.").css({
                         "text-align": "center", // 가운데 정렬
                         "font-size": "23px", // 글꼴 크기
                         "font-weight": "bold" // 글꼴 굵기
                     });   
                     $(".login-result").show();
                     
                     }else{
                        $(".PWResult").text(data.error);
                     
                     }//data.error == null 끝부분
               }else{
                  
                  $(".PWResult").text("입력하신 정보가 일치하지 않습니다. 확인 후 다시 시도해주세요.").css({
                      "text-align": "center", // 가운데 정렬
                      "font-size": "23px", // 글꼴 크기
                      "font-weight": "bold" // 글꼴 굵기
   
                  });   
                  $(".fbtnPW").prop("disabled", false);
                  return false;
               }
                  
               
                  
      
               },
               error : function(error){
                  alert("ㅠㅠ");
               }
               
               
            });//ajax 끝
         });
   });
   
});

</script>


<link rel="stylesheet" href="../css/login.css">
</head>
<body>
<body>

   <div class="nav_container">
      <div class="content_signin">
         <div class="signin_selection_group">
            <div class="login_form">
               <div class="signin_swiper" id="otp">
                  <div class="signin-section">
                     <div>
                     <img alt="" src="./img/login.png"><br>
                        <h2 class="signin_title">로그인</h2>
                        <div class="signin-section">
                           <input type="text" id="signin_id" class="signin_id" name="eid" placeholder="사번"><br><br>
                           <span class="idInfo"></span><br><br><br>
                           <input type="password" class="signin_pw" name="epw" placeholder="비밀번호"><br><br>
                          <span class="pwInfo"></span><a class="findID">&nbsp;&nbsp;사번 찾기</a><a class="findPW">
                          &nbsp;&nbsp;비밀번호 찾기</a><br>
                          <br><br>
                          사번 기억하기   <input id="saveID" type="checkbox"/> <br><br><br>
                          <input type="hidden" class="eidresult">
                           <p hidden="hidden"></p>         
                          <button class="loginBtn" type="button">로그인</button>
                              <span id="msg"></span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


<!-- 아이디 찾기 모달입니다. -->
<div class="modal" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">

    <!-- 모달 내용 -->
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="header">
                <h1 class="title" id="exampleModalLabel">아이디 찾기</h1>
            </div>
            <div class="checkID">
         <div class="">
      <form action="./findID" method="post"></form>
      <h4 style="text-align: center;">이름과 생년월일을 입력해주세요.</h4>
      
      <div class="zzz">
      <h5 class="nameh5">이름</h5><br>
      <input type="text" class="ename" name="ename" placeholder="이름을 입력해주세요."><br><br><br><br>
      <h5 class="errnh5">주민등록번호</h5><br>
      <div class="errndiv">
      <input type="text" class="errn" name="errn" maxlength="6">-<input type="password" class="errn2" name="errn2" maxlength="7"><br>
      <span class="errnInfo"></span>
      </div>
      <br><br><br><br>
      <div class="findIDBtn">
      <button type="submit" class="fbtn">아이디 찾기</button>
      <br><br>
      <h4 class="IDResult"></h4>
      </div>
         <br>
         <span id="msg"></span>
            <span id="msg2"></span>
         <br>
         <div class="login-result">
            <button class="saveCookie">쿠키 저장하기</button><br>
            <button onclick="location.href='/'" type="submit" class="logbtn">로그인 하기</button><br>
            <button type="submit" class="findPW">비밀번호 찾기</button>
         </div>
      </div>
      </div>
            </div>

        </div>
    </div>

</div>

 <!-- 비밀번호 찾기 모달입니다. -->
<!-- 모달 start -->
<div class="modal" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
         <div class="header">
                <h1 class="title" id="exampleModalLabel">비밀번호 찾기</h1>
               <div class="checkPW">
         <div class="">
      <form action="./findPW" method="post"></form>
      <h4 style="text-align: center;">사번과 이름, 휴대폰 번호를 입력해주세요.</h4>
      
      <div class="zzzPW">
      <h6 class="idPW">사번</h6><br>
      <input type="text" class="eidPW" name="eid" placeholder="사번을 입력해주세요." maxlength="5"><br><br>
      <h6 class="namePW">이름</h6>
      <input type="text" class="enamePW" name="ename" placeholder="이름을 입력해주세요."><br><br>
      <h6 class="errnPW">휴대폰 번호</h6>
      <div class="errndivPW">
      <input type="text" class="pnum1" name="pnum1" maxlength="3"> - <input type="text" class="pnum2" name="pnum2" maxlength="4"> - <input type="text" class="pnum3" name="pnum3" maxlength="4"><br>
      <span class="errorInfo"></span>
      </div>
      <br><br><br><br>
      <div class="findIDBtn">
      <button type="submit" class="fbtnPW">비밀번호 찾기</button>
      <br><br>
      <h4 class="PWResult"></h4>
      </div>
         <br>
         <span id="msg"></span>
            <span id="msg2"></span>
         <br>
         <div class="login-result">
         <form action="./" method="get">
            <button type="submit" class="logbtn">로그인 하기</button>
         </form>
         </div>
      </div>
      </div>
            </div>

        </div>
    </div>

</div>
</div>
<!-- 모달 end -->

</body>
</html>