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
			<table>
				<tr><th>No</th><th>Email</th><th>Phone</th></tr>
			    <c:forEach items="${orders}" var="data">
			    	<tr><td><c:out value="${data.userName}"/></td><td><c:out value="${data.email}"/></td><td><c:out value="${data.phone}"/></td></tr>
			    </c:forEach>			
			</table>
		</div>
	</body>

	<script type="text/javascript">	
		$(document).ready(function() {
			$("#order").submit(function() {
				var order = $(this).serializeObject();
				$.postJSON("order", [order], function(data) {
					$.getJSON("order/" + data[0].order_number, function(order) {
						alert("Created order "+data[0].order_number+
								"\nID = "+order.id);
						window.location.reload(true);
					});			
				}, function(data) {
					var response = JSON.parse(data.response);
					alert("Error: "+response[0].id);
				});
				return false;				
			});
		});
	</script>
	
</html>
