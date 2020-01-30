<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	
$(function(){
	/*
	�̸��� ���� ��ư Ŭ���� �߻��ϴ� �̺�Ʈ
	*/
	$(document).on("click", "#emailBtn", function(){
	
		/* �̸��� �ߺ� üũ �� ���� �߼� �񵿱� ó�� */
		$.ajax({
				beforeSend: function(){
				loadingBarStart();
				},
				type:"get",
				url : "<c:url value='/createEmailCheck'/>",
				data : "userEmail=" + $("#userEmail").val() + "&random=" + $("#random").val(),
				//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
				/* encodeURIComponent
				�������, http://a.com?name=egoing&job=programmer ���� &job=programmer
				�� '&'�� �ϳ��� �Ķ���Ͱ� ������ ���� �Ķ���Ͱ� �´ٴ� �ǹ��̴�.
				�׷��� ������ ���� job�� ���� &�� ���Եȴٸ� �ý����� job�� ���� ����� �ν��Ҽ� ���� �ȴ�. */
				success : function(data){
							alert("��밡���� �̸����Դϴ�. ������ȣ�� �Է����ּ���.");
				},
				
				error: function(data){
						alert("������ �߻��߽��ϴ�.");
						return false;
				}
		});
	});
	
	/*
	�̸��� ������ȣ �Է� �� ���� ��ư Ŭ�� �̺�Ʈ
	*/
	$(document).on("click", "#emailAuthBtn", function(){
		$.ajax({
				beforeSend: function(){
				loadingBarStart();
				},
				type:"get",
				url:"<c:url value='/emailAuth'/>",
				data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
				success:function(data){
						if(data=="complete"){
								alert("������ �Ϸ�Ǿ����ϴ�.");
						}else if(data == "false"){
								alert("������ȣ�� �߸� �Է��ϼ̽��ϴ�.")
						}
				},
				complete: function(){
					loadingBarEnd();
				},
				error:function(data){
					alert("������ �߻��߽��ϴ�.");
				}
			});
	});
	
});


   function back(){
      history.go(-1);
   }
   $(document).ready(function() {
      $("#idCheck").on("click", function(e) {
         e.preventDefault();
         fn_idCheck();
      });
   });

   $(function(){   
   $(document).ready(function(){
      $('select[name=email]').change(function() {
         if($(this).val()=="self"){
            $('#email2').val("");
            $("#email2").attr("readonly", false);
            $('#email2').focus();
         } else {
            $('#email2').val($(this).val());
            $("#email2").attr("readonly", true);
         }
      });
   });
   });

   function fn_idCheck(){
       var mem_id = {MEM_ID : $('#mem_id').val()};
       $.ajax({
           url:"<c:url value='/join/idCheck'/>",
           type:'get',
           data: mem_id,
           success:function(data){              
               if($.trim(data)=="0"){
                  $('#chkMsg').html("��밡���� ���̵� �Դϴ�.").css("color", "blue");         
               }else{
                  $('#chkMsg').html("���Ұ����� ���̵� �Դϴ�.").css("color", "red");
               }
           },
           error:function(){
                   alert("�����Դϴ�");
           }
       });
   };
   
   
   $(document).ready(function(){
         $("#email").change(function(){
            $("#email2").val($(this).val());
         });
      });
   
   
   $(document).ready(function() { //��й�ȣ ��ġ Ȯ��
        //[1] lblError ���̾� Ŭ����
        $('#mem_pw').keyup(function() {
            //$('#pwr').remove(); // ����
            $('#pw').text(''); // ���Ű� �ƴ϶� Ŭ����
               $('#password2').val('');
        });
        //[2] ��ȣ Ȯ�� ��� ����
        $('#password2').keyup(function() {
            if ($('#mem_pw').val() != $('#password2').val()) {
                $('#pw').text(''); // Ŭ����
                $('#pw').html("��ȣ�� ��ġ���� �ʽ��ϴ�.").css("color", "red");          //���̾ HTML ���
            }
            else {
                $('#pw').text(''); // Ŭ����
                $('#pw').html("��ȣ�� ��ġ�մϴ�.").css("color", "blue");
            }
        });
    });
   
   $(document).ready(function() { 
      $("#join").on("click", function(e) {
         e.preventDefault();
         fn_join();
      });
   });
   
   function fn_join(joinForm) {
      var chk = $("input[name=agree_required]");
      if(!$("#mem_id").val()){
         alert("���̵� �Է����ּ���.");
         $("#mem_id").focus();
         return false;
      }
      if($("#chkMsg").html()!="��밡���� ���̵� �Դϴ�."){
         alert("���̵� �ߺ�Ȯ���� ���ּ���.");
         return false;
      }
      if(!$("#mem_pw").val()){
         alert("��й�ȣ�� �Է����ּ���.");
         $("#mem_pw").focus();
         return false;
      }
      if(!$("#password2").val()){
         alert("��й�ȣ Ȯ���� �Է����ּ���.");
         $("#password2").focus();
         return false;
      }
      if($("#pw").html()!="��ȣ�� ��ġ�մϴ�."){
         alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
         return false;
      }
      if(!$("#mem_name").val()){
         alert("�̸��� �Է����ּ���.");
         $("#mem_name").focus();
         return false;
      }
      if(!$("#email1").val() || !$("#email2").val()){
         alert("�̸����� �Է����ּ���.");
         if(!$("#email1").val()){
            $("#email1").focus();
         }else{
            $("#email2").focus();
         }
         return false;
      }
      if(!$("#phone2").val() || !$("#phone3").val()){
         alert("�޴���ȭ�� �Է����ּ���.");
         if(!$("#phone2").val()){
            $("#phone2").focus();
         }else{
            $("#phone3").focus();
         }
         return false;
      }
      if(!$("#zipcode").val()){
          alert("�����ȣ�� �Է����ּ���.");
          $("#zipcode").focus();
          return false;
       }
      if(!$("#address1").val()){
          alert("���ּ� �Է����ּ���.");
          $("#address1").focus();
          return false;
       }
      if(!$("#address2").val()){
          alert("���ּҸ� �Է����ּ���.");
          $("#address2").focus();
          return false;
       }
      if(chk[0].checked==false){
         alert("���� �̿����� �������ּ���.");
         return false;
      }
      var comSubmit = new ComSubmit("joinForm");
      comSubmit.setUrl("<c:url value='/join/emailAuth'/>");
      var email = $("#email1").val()+"@"+$("#email2").val();
      var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
      $("#mem_email").val(email);
      $("#mem_phone").val(��);
      comSubmit.submit();
   }
   $("#joinForm").on("submit",function(e){
   });
   </script>
</head>


<body>
   <div>
   <div>
      <div>
      <h1>ȸ������</h1>
      </div>
      <form id="joinForm" method="post">
         <div>
            <div>
               ���̵�<input type="text" id="mem_id" name="mem_id" > 
               <button onclick="fn_idCheck();" type="button">���̵� �ߺ� Ȯ��
            </div>
            <span id = "chkMsg"></span>
            
            <div>
               ��й�ȣ<input type="password" id="mem_pw" name="mem_pw"> 
            </div>
            
            <div>
               ��й�ȣ Ȯ��<input type="password" id="password2"> 
            </div>
            <span id="pw"></span>
            
            
            <div>
               �̸�<input type="text" id="mem_name" name="mem_name"> 
            </div>
            
            <div>
               �������<input type="text" id="mem_birth" name="mem_birth"> 
            </div>
            
            <div>
               <form>
                  <input type="radio" name="mem_gen" value="����"/>����
                  <input type="radio" name="mem_gen" value="����"/>����
               </form>
            </div>
            
            <div>
               <input type="hidden" id="mem_email" name="mem_email">
               �̸���<input type="text" id="email1" name="email1"> 
               @
               <input type="text" id="email2" name="email2" value=""> 
            
               <select id="email" name="email">
                  <option value="self">�����Է�</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="nate.com">nate.com</option>
               </select> 
               
               <input type="text" id="email" name="email" placeholder="�̸����� �Է��ϼ���"/>
               <button type="button" id="emailBtn">�̸��� �߼�</button>
               <button type="button" id="emailAuthBtn">�̸��� ����</button>
               <input type="hidden" path="random" id="random" value="${random }"/>
            </div>
            
            <div>
               <input type="hidden" id="mem_phone" name="mem_phone">
               �޴���ȭ<select id="phone1" name="phone1">
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
               </select> 
               
               -<input type="number" id="phone2" name="phone2"> 
               
               -<input type="number" id="phone3" name="phone3">
            </div>
            
            <div>
               �����ȣ<input type="text" id="zipcode" name="zipcode">
            </div>
            
            <div>
               �� �ּ�<input type="text" id="address1" name="address1">
            </div>
            
            <div>
               �� �ּ�<input type="text" id="address2" name="address2">
            </div>
         
            <div>
               <label>
                  <h1>nns# ���� �̿��� ���� <span>(�ʼ�)</span></h1>
                  <input type="checkbox" name="agree_required">
                  <svg width="30" height="30" viewBox="0 0 31 31">
                     <g fill="none" fill-rule="evenodd">
                        <g>
                           <circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
                           <circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
                        </g>
                        <path stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
                     </g>
                  </svg>
               </label>
               <div class="lReCa">
                  <iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/station3_180816_dabang_serviceaccessterms.html"
                     scrolling="yes" width="100%" height="100%" frameborder="0" allowtransparency="true"></iframe>
               </div>
            </div>
         </div>
         <button id="join">ȸ������</button>
         <button onclick="back();" type="button">���</button>

      </form>

   </div>
   </div>
</body>
</html>