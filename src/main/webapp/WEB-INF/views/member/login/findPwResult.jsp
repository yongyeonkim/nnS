<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
/* 
�ݱ�
 */
</script>
</head>
<body>

<%-- ${eCheck } --%>

<c:if test="${id.MEM_ID==null || id.MEM_ID==''}">
��ȸ�� ���̵� �����ϴ�.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
�Է��Ͻ� ������ ��ϵ� ���̵�� '${id.MEM_ID}'�Դϴ�.
</c:if>
<div class="result" style="display: none">
�ӽ� ��й�ȣ�� �Է��Ͻ� �̸��Ϸ� ���۵Ǿ����ϴ�.<br>
<a href="#" class="btn" onclick="close();">�ݱ�</a>
</div>

</body>
</html>