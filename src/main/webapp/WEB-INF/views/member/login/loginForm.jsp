<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
<head><title>�α���</title>
<link href="style.css" rel="stylesheet" type="text/css">
   
   </style>
   <script language="javascript">
    
      function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
         if(!document.myform.id.value){
           alert("���̵� �Է����� �����̽��ϴ�.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.passwd.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }
         
         
       } 
       </script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
       <script type="text/javascript">
       $(document).ready(function(){
    	   
    	    // ����� ��Ű���� �����ͼ� ID ĭ�� �־��ش�. ������ �������� ��.
    	    var key = getCookie("key");
    	    $("#userId").val(key); 
    	     
    	    if($("#userId").val() != ""){ // �� ���� ID�� �����ؼ� ó�� ������ �ε� ��, �Է� ĭ�� ����� ID�� ǥ�õ� ���¶��,
    	        $("#idSaveCheck").attr("checked", true); // ID �����ϱ⸦ üũ ���·� �α�.
    	    }
    	     
    	    $("#idSaveCheck").change(function(){ // üũ�ڽ��� ��ȭ�� �ִٸ�,
    	        if($("#idSaveCheck").is(":checked")){ // ID �����ϱ� üũ���� ��,
    	            setCookie("key", $("#userId").val(), 7); // 7�� ���� ��Ű ����
    	        }else{ // ID �����ϱ� üũ ���� ��,
    	            deleteCookie("key");
    	        }
    	    });
    	     
    	    // ID �����ϱ⸦ üũ�� ���¿��� ID�� �Է��ϴ� ���, �̷� ���� ��Ű ����.
    	    $("#userId").keyup(function(){ // ID �Է� ĭ�� ID�� �Է��� ��,
    	        if($("#idSaveCheck").is(":checked")){ // ID �����ϱ⸦ üũ�� ���¶��,
    	            setCookie("key", $("#userId").val(), 7); // 7�� ���� ��Ű ����
    	        }
    	    });
    	});
    	 
    	function setCookie(cookieName, value, exdays){
    	    var exdate = new Date();
    	    exdate.setDate(exdate.getDate() + exdays);
    	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    	    document.cookie = cookieName + "=" + cookieValue;
    	}
    	 
    	function deleteCookie(cookieName){
    	    var expireDate = new Date();
    	    expireDate.setDate(expireDate.getDate() - 1);
    	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    	}
    	 
    	function getCookie(cookieName) {
    	    cookieName = cookieName + '=';
    	    var cookieData = document.cookie;
    	    var start = cookieData.indexOf(cookieName);
    	    var cookieValue = '';
    	    if(start != -1){
    	        start += cookieName.length;
    	        var end = cookieData.indexOf(';', start);
    	        if(end == -1)end = cookieData.length;
    	        cookieValue = cookieData.substring(start, end);
    	    }
    	    return unescape(cookieValue);
    	}
    	</script>

  
</head>
<BODY onload="begin()">
<form name="myform" action="login" method="post" onSubmit="return checkIt()">

  <div>
  
  </div>
 
  
    
   <div>
   ���̵� <INPUT type="text" name="id" id="userId" size="15" maxlength="12">
   
   </div>
   
   <div>
     ��й�ȣ<INPUT type=password name="passwd"  size="15" maxlength="12">
   </div>
   <div>
      <INPUT type=submit value="�α���">
   </div>
    <div>
      <input type="checkbox" value="idSaveCheck">���̵�����
    </div> 
    <div>
      <a href="joinForm">ȸ������</a>|<a href="findId">ID/PW ã��</a>
    </div>
</form>

</BODY>
</HTML>