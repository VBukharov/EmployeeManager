<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="label.edittitle" /></title>
</head>
<body>
 
<h3><spring:message code="label.edittitle" /></h3>
<c:url var="saveUrl" value="/edit?id=${employee.id}" />
<form:form modelAttribute="employee" method="POST" action="${saveUrl}">
 <table>
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
			<td><form:input path="age" /></td>
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
		
    </table>

    <input type="submit" value="Save" />
</form:form>

 
</body>
</html>