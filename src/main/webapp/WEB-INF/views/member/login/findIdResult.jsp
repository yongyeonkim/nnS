<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div>
<c:if test="${id.MEM_ID==null || id.MEM_ID==''}">
��ȸ�� ���̵� �����ϴ�.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
�Է��Ͻ� ������ ��ϵ� ���̵�� '${id.MEM_ID}'�Դϴ�.
</c:if>
<br>
<a href="#" onclick="javascript:history.go(-1);">�ڷΰ���</a>
<a href="#" onclick="javascript:window.close();">�ݱ�</a>
</div>

</body>
</html>