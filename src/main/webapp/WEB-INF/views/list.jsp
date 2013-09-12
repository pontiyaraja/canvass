<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
	<head>
		<title>Orders</title>
		<link rel="stylesheet" href="<c:url value="/resources/blueprint/screen.css" />" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="<c:url value="/resources/blueprint/print.css" />" type="text/css" media="print">
		<!--[if lt IE 8]>
			<link rel="stylesheet" href="<c:url value="/resources/blueprint/ie.css" />" type="text/css" media="screen, projection">
		<![endif]-->
		<script type="text/javascript" src="<c:url value="/resources/jquery-1.4.min.js" /> "></script>
		<script type="text/javascript" src="<c:url value="/resources/json.min.js" /> "></script>
	</head>
	<body>
		<div class="container">
			<h2>
				User List
			</h2>			
			<table>
				<tr><th>No</th><th>User Name</th><th>Email</th><th>Phone</th></tr>
			    <c:forEach items="${users}" var="user">
			    	<tr><td><c:out value="${user.userId}"/></td><td><c:out value="${user.name}"/></td><td><c:out value="${user.email}"/></td><td><c:out value="${user.phone}"/></td></tr>
			    </c:forEach>			
			</table>
			<a href="/"><input id="back" type="button" value="back"/></a>
		</div>
	</body>	
</html>
