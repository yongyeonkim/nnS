<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
<head><title>�α���</title>
   
   </style>
   <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
   <script language="javascript">
   
    
      function begin(){
         document.myform.MEM_ID.focus();
       }
       function checkIt(){
         if(!document.myform.MEM_ID.value){
           alert("���̵� �Է����� �����̽��ϴ�.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.MEM_PW.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }
         
         
       }
       
       function fsubmit(){
    		var id = $("#MEM_ID")[0].value;
    		var pw = $("#MEM_PW")[0].value;
    		if(id==null || id==''){
    			alert("���̵� �Է��ϼ���.");
    			return false;
    		}
    		if(pw==null || pw==''){
    			alert("��й�ȣ�� �Է��ϼ���.");
    			return false;
    		}
    		if($(".Checkbox__CheckboxStd-ifp1yz-1").is(":checked")){
    			var id = $("#MEM_ID").val();
    			document.cookie = "storedId="+id;
    			document.cookie = "idStore=true";
    		}else{
    			document.cookie = "storedId=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    			document.cookie = "idStore=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    		}
    		var cookie = document.cookie.match('(^|;) ?'+'storedId'+'=([^;]*)(;|$)');
    		myform.submit();
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
<form name="myform" action="login" method="post">

  <div>
  
  </div>
 
  
    
   <div>
   ���̵� <INPUT type="text" name="MEM_ID" id="MEM_ID" size="15" maxlength="12">
   
   </div>
   
   <div>
     ��й�ȣ<INPUT type=password name="MEM_PW" id="MEM_PW" size="15" maxlength="12">
   </div>
   <div>
      <input type="button" value="�α���" onclick="fsubmit();">
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