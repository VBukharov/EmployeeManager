<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="label.findtitle" /></title>
</head>
<body>
 
<h3><spring:message code="label.findtitle" /></h3>

<c:url var="saveUrl" value="/find" />
 <form action="find" method="POST" enctype="application/x-www-form-urlencoded">
 <table>
	 <tr>
		 <td>Enter First Name</td>
		 <td><input name="firstName" type="text" id = "firstName"></td>
	 </tr>
	 <tr>
		 <td>Enter Second Name</td>
		 <td> <input name="secondName" type="text" id="secondName"></td>
	 </tr>
	 <tr>
		 <td>Enter Last Name</td>
		 <td> <input name="lastName" type="text" id = "lastName"></td>
	 </tr>
 </table>
 
	 <input type="submit" value="Find" />
 </form>
 

<c:if test="${!empty employeeList}">
<h3><spring:message code="label.employers" /></h3>
	<table class="data" style="width: 600px; text-align:center">
		<tr align="center" style="background:#FFDEAD">
			<td><spring:message code="label.firstname" /></td>
			<td><spring:message code="label.secondname" /></td>
			<td><spring:message code="label.lastname" /></td>
			<td><spring:message code="label.age" /></td>
			<td><spring:message code="label.experience" /></td>
			<td><spring:message code="label.description" /></td>
			<td>&nbsp;</td>
		</tr>
		<c:forEach items="${employeeList}" var="employee">
			<tr align="center">
				<td>${employee.lastName}</td>
				<td> ${employee.secondName}</td>
				<td> ${employee.firstName}</td>
				<td>${employee.age}</td>
				<td>${employee.experience}</td>
				<td>${employee.description}</td>
				<td><a href="delete/${employee.id}">Delete</a> <a href="edit?id=${employee.id}">Edit</a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
<a href = "index"> Main menu</a>
</body>
</html>