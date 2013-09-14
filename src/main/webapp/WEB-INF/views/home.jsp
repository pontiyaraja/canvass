<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Canvass</title>
<link rel="stylesheet"
	href="<c:url value="/resources/blueprint/screen.css" />"
	type="text/css" media="screen, projection">
<link rel="stylesheet"
	href="<c:url value="/resources/blueprint/print.css" />" type="text/css"
	media="print">
<!--[if lt IE 8]>
			<link rel="stylesheet" href="<c:url value="/resources/blueprint/ie.css" />" type="text/css" media="screen, projection">
		<![endif]-->
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/jquery-1.8.3.min.js" /> "></script>
<script type="text/javascript"
	src="<c:url value="/resources/json.min.js" /> "></script>
<script type="text/javascript"
	src="<c:url value="/resources/jquery.validate.js" /> "></script>
<script type="text/javascript"
	src="<c:url value="/resources/jquery.validate.min.js" /> "></script>
</head>
<body>
	<div class="container">
		<h2>Create User</h2>
		<div class="span-12 last">

			<form:form modelAttribute="user" action="user"
				method="post">
				<fieldset>
					<legend>User Fields</legend>
					<p>
						<form:label id="nameLabel" for="name" path="name"
							cssErrorClass="error">Name</form:label>
						<br />
						<form:input path="name" />
						<form:errors path="name" />
					</p>
					<p>
						<form:label id="emailLabel" for="email" path="email"
							cssErrorClass="error">Email</form:label>
						<br />
						<form:input path="email" />
						<form:errors path="email" />
					</p>
					<p>
						<form:label id="phoneLabel" for="phone" path="phone"
							cssErrorClass="error">Mobile</form:label>
						<br />
						<form:input path="phone" />
						<form:errors path="phone" />
					</p>
					<p>
						<input id="create" type="submit" value="Create"
							onclick="submitForm();"/>
					</p>
				</fieldset>
			</form:form>
			<p>
						<a href="userui"><input id="history" type="button" value="History"/></a>
			</p>
</body>

<script type="text/javascript">

        function submitForm(){ 
          var validator = $("#user").validate({ 
          rules: { 
               nameLabel: "required", 
               emailLabel: "required", 
               phoneLabel: "required"
              }, 
         errorElement: "span" , 
         messages: { 
                nameLabel: " EnterName", 
                emailLabel: " Enter Email", 
                phoneLabel: " Enter Contact	No"} }); 
        /*if(validator.form()){ 
// validation
							perform 
$('form#myForm').attr({action: 'mycontroller'});	
$('form#myForm').submit(); } */
} 
    
	$(document).ready(function() {
		
		
		$("#user").submit(function() {
			var
							user=$(this).serializeObject();
							$.post("user", [ user ], function(data) {
								$.get("user/" + data[0].email, function(order) {
									alert("User order "+data[0].email+
									"\nID = "+order.id);
									window.location.reload(true);
									});
			}, function(data) {
				var
							response=data.response; alert("Error: ");
			});
			return
							false;
		});	
		
		$("#emailLabel").blur(function() {
			var
							sEmail=$( '#emailLabel').val();
			if ($.trim(sEmail).length==
							0) {
			   alert('Please enter valid email
							address');
			   e.preventDefault();
			}
			if (validateEmail(sEmail)) {
			   alert('Email
							is valid');
			}
			else {
			         alert('Invalid Email
							Address');
			         e.preventDefault();
			     }
			});			
$("#phoneLabel").blur(function() {
	var
							sPhone=$( '#phoneLabel').val();
	if ($.trim(sPhone).length==
							0) {
	   alert('Please enter valid phone
							number');
	   e.preventDefault();
	}
	if (validatePhone(sPhone)) {
	   alert('Phone
							no is valid');
	}
	else {
	         alert('Invalid Phone
							no');
	         e.preventDefault();
	     }
	});
	
var email=$(
							'#emailLabel').val();
$('#emailLabel').change(function() {
   $.ajax({
      url: "order",
      type: 'GET',
      data: 'email=' + email,
      success: function(result){
                 if(result > 0){
                	 alert("Email already exist");
     				window.location.reload(true);
                 }
               }
      });
});
	
	});
	
function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
    	
        return true;
    }
    else {
        return false;
    }
}

function validatePhone(txtPhone) {
    var a = document.getElementById(txtPhone).value;
    var filter = /^[0-9-+]+$/;
    if (filter.test(a)) {
        return true;
    }
    else {
        return false;
    }
}
</script>

</html>

