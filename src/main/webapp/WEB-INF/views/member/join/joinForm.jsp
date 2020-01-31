<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">

$(function(){
	$(document).on("click", "#emailBtn", function(){ //�̸��� �߼�
	$.ajax({
		type:"get",
		url : "<c:url value='/createEmailAuth'/>",
		data : "userEmail=" + $("#email1").val()+"@"+$("#email2").val() + "&random=" + $("#random").val(),
		success : function(data){
			alert("��밡���� �̸����Դϴ�. ������ȣ�� �Է����ּ���.");
		},
		error: function(data){
			alert("������ �߻��߽��ϴ�.");
			return false;
		}
	});
	});	
	
	$(document).on("click", "#emailAuthBtn", function(){ //������ȣ Ȯ��
		$.ajax({
			type:"get",
			url:"<c:url value='/emailConfirm'/>",
			data:"authCode="+$('#emailAuth').val()+"&random="+$("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("���� �Ϸ�Ǿ����ϴ�.");
					$('#chkEm').html("�̸��� ���� �Ϸ�").css("color", "blue");  
				}else if(data=="false"){
					alert("������ȣ�� �߸� �Է��ϼ̽��ϴ�.");
				}
			},
			error:function(data){
				alert("������ �߻��߽��ϴ�.")
			}
		});
	});
});


function zipcode() {//�����ȣ �˻�â
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var addr = ''; // �ּ� ����

            //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
            if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                addr = data.roadAddress;
                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("MEM_ADD2").focus();
            } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                alert("���θ� �ּҸ� �Է����ּ���.");
            	return false;
            }
           
        }
    }).open();
}

   function back(){
      history.go(-1);
   }
   $(document).ready(function() { //id check
      $("#idCheck").on("click", function(e) {
         e.preventDefault();
         fn_idCheck();
      });
   });
 
   $(function(){ //email select  
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

   function fn_idCheck(){ //id check
       var MEM_ID = {MEM_ID : $('#MEM_ID').val()};
       $.ajax({
           url:"<c:url value='/join/idCheck'/>",
           type:'get',
           data: MEM_ID,
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
  
   $(document).ready(function(){ //email select value
         $("#email").change(function(){
            $("#email2").val($(this).val());
         });
      });

   $(document).ready(function() { //��й�ȣ ��ġ Ȯ��
        //[1] lblError ���̾� Ŭ����
        $('#MEM_PW').keyup(function() {
            //$('#pwr').remove(); // ����
            $('#pw').text(''); // ���Ű� �ƴ϶� Ŭ����
               $('#password2').val('');
        });
        //[2] ��ȣ Ȯ�� ��� ����
        $('#password2').keyup(function() {
            if ($('#MEM_PW').val() != $('#password2').val()) {
                $('#pw').text(''); // Ŭ����
                $('#pw').html("��ȣ�� ��ġ���� �ʽ��ϴ�.").css("color", "red");          //���̾ HTML ���
            }
            else {
                $('#pw').text(''); // Ŭ����
                $('#pw').html("��ȣ�� ��ġ�մϴ�.").css("color", "blue");
            }
        });
    });
   
   $(document).ready(function() { //ȸ������ ��ư Ŭ����
      $("#join").on("click", function(e) {
         e.preventDefault();
         fn_join();
      });
   });
   
   function fn_join(joinForm) { //ȸ������ ��ư Ŭ����(��ȿ������, �������Է�)
      var chk = $("input[name=agree_required]");
      if(!$("#MEM_ID").val()){
         alert("���̵� �Է����ּ���.");
         $("#MEM_ID").focus();
         return false;
      }
      if($("#chkMsg").html()!="��밡���� ���̵� �Դϴ�."){
         alert("���̵� �ߺ�Ȯ���� ���ּ���.");
         return false;
      }
      if(!$("#MEM_PW").val()){
         alert("��й�ȣ�� �Է����ּ���.");
         $("#MEM_PW").focus();
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
      if(!$("#MEM_NAME").val()){
         alert("�̸��� �Է����ּ���.");
         $("#MEM_NAME").focus();
         return false;
      }
      if(!$("#MEM_BIRTH").val()){
          alert("��������� �Է����ּ���.");
          $("#MEM_BIRTH").focus();
          return false;
       }
      
      var MEM_GEN = $('#MEM_GEN_M');
       
      if($(':radio[name="MEM_GEN"]:checked').length < 1){
          alert('������ �������ּ���');                        
          MEM_GEN.focus();
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
      if($("#chkEm").html()!="�̸��� ���� �Ϸ�"){
          alert("�̸��� ������ ���ּ���.");
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

      if(!$("#MEM_ZIP").val()){
          alert("�����ȣ�� �Է����ּ���.");
          $("#MEM_ZIP").focus();
          return false;
       }
      if(!$("#MEM_ADD1").val()){
          alert("���ּ� �Է����ּ���.");
          $("#MEM_ADD1").focus();
          return false;
       }
      if(!$("#MEM_ADD2").val()){
          alert("���ּҸ� �Է����ּ���.");
          $("#MEM_ADD2").focus();
          return false;
       }
      if(chk[0].checked==false){
         alert("���� �̿����� �������ּ���.");
         return false;
      }
      var comSubmit = new ComSubmit("joinForm");
      comSubmit.setUrl("<c:url value='/memberVerify'/>");
      var email = $("#email1").val()+"@"+$("#email2").val();
      var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
      $("#MEM_EMAIL").val(email);
      $("#MEM_PHONE").val(phone);
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
               ���̵�<input type="text" id="MEM_ID" name="MEM_ID" > 
               <button onclick="fn_idCheck();" type="button">���̵� �ߺ� Ȯ��
            </div>
            <span id = "chkMsg"></span>
            
            <div>
               ��й�ȣ<input type="password" id="MEM_PW" name="MEM_PW"> 
            </div>
            
            <div>
               ��й�ȣ Ȯ��<input type="password" id="password2"> 
            </div>
            <span id="pw"></span>
            
            
            <div>
               �̸�<input type="text" id="MEM_NAME" name="MEM_NAME"> 
            </div>
            
            <div>

               �������<input type="text" id="MEM_BIRTH" name="MEM_BIRTH" placeholder="ex)19950703"> 

            </div>
            
            <div>
               <form>

                  <input type="radio" id="MEM_GEN_M" name="MEM_GEN" value="����"/>����
                  <input type="radio" id="MEM_GEN_F" name="MEM_GEN" value="����"/>����

               </form>
            </div>
            
            <div>
               <input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
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

               <button type="button" id="emailBtn">�̸��� �߼�</button>
               <input type="text" id="emailAuth" name="emailAuth" placeholder="������ȣ"/>
               <button type="button" id="emailAuthBtn">�̸��� ����</button>
               <input type="hidden" path="random" id="random" value="${random }"/>
               
               <span id = "chkEm"></span>
               
            </div>
            <div>
               <input type="hidden" id="MEM_PHONE" name="MEM_PHONE">
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
               �����ȣ<input type="text" id="MEM_ZIP" name="MEM_ZIP">
               <input type="button" onclick="zipcode()" value="�����ȣ ã��"><br>
            </div>
            
            <div>
               �� �ּ�<input type="text" id="MEM_ADD1" name="MEM_ADD1">
            </div>
            
            <div>
               �� �ּ�<input type="text" id="MEM_ADD2" name="MEM_ADD2">
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