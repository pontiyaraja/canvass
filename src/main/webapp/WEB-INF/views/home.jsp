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
				Create User
			</h2>
			<div class="span-12 last">
				
				<form:form modelAttribute="data" action="data" method="post">
				  	<fieldset>		
						<legend>Order Fields</legend>
						<p>
							<form:label	id="nameLabel" for="name" path="name" cssErrorClass="error">Name</form:label><br/>
							<form:input path="name" /><form:errors path="name" />
						</p>
						<p>
							<form:label	id="emailLabel" for="email" path="email" cssErrorClass="error">Email</form:label><br/>
							<form:input path="email" /><form:errors path="email" />
						</p>
						<p>
							<form:label	id="mobileLabel" for="mobile" path="mobile" cssErrorClass="error">Mobile</form:label><br/>
							<form:input path="mobile" /><form:errors path="mobile" />
						</p>
						<p>	
							<input id="create" type="submit" value="Create" />
						</p>
					</fieldset>
				</form:form>			
	</body>

	<script type="text/javascript">	
		$(document).ready(function() {
			$("#data").submit(function() {
				var order = $(this).serializeObject();
				$.postJSON("data", [data], function(data) {
								
				}, function(data) {
					var response = JSON.parse(data.response);
					alert("Error: "+response[0].email);
				});
				return false;				
			});
		});
	</script>
	
</html>
