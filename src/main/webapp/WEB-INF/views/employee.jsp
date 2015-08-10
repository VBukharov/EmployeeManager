<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
</head>
<body>
<h3><spring:message code="label.title" /></h3>
<form:form method="post" action="add" commandName="employee">
	<table >
		<tr>
			<td><form:label path="firstName"><spring:message code="label.firstname" /></form:label></td>
			<td><form:input path="firstName" /></td>
		</tr>
		<tr>
			<td><form:label path="secondName"><spring:message code="label.secondname" />
			</form:label></td>
			<td><form:input path="secondName" /></td>
		</tr>
		<tr>
			<td><form:label path="lastName"><spring:message code="label.lastname" />			
			</form:label></td>
			<td><form:input path="lastName" /></td>
		</tr>
		<tr>
			<td><form:label path="age"><spring:message code="label.age" />
			</form:label></td>
			<td><form:input path="age"/></td>
		</tr>
		<tr>
			<td><form:label path="experience"><spring:message code="label.experience" />
			</form:label></td>
			<td><form:input path="experience" /></td>
		</tr>
		<tr>
			<td><form:label path="description"><spring:message code="label.description" />
			</form:label></td>
			<td><form:input path="description" /></td>
		</tr>		
		
		<tr>
			<td colspan="2"><input type="submit"
				value="<spring:message code="label.addemployee" />" /></td>
		</tr>
	</table>
</form:form>
<br>

<a href="<c:url value="/find" />">
	<spring:message code="label.findtitle" />
</a><br/>

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

</body>
</html>