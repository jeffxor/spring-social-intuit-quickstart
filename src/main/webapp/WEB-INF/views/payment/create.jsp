<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<title>Update - <c:out value="${customer.name}"/></title>
	</head>
	<body>
	<ul>
		<li><a href="<c:url value="/signout" />">Sign Out</a></li>
	</ul>
	
	<h1>Create Consumer Details</h1>

		<c:url var="form_url" value="/customer/create"/>
	<form:form commandName="customer" action="${form_url}" method="POST">

		<table>
			<tbody>
				<tr>
					<td>Given Name</td>
					<td><form:input path="givenName"/></td>
				</tr>
				<tr>
					<td>Family Name</td>
					<td><form:input path="familyName"/></td>
				</tr>
				<tr>
					<td>Full Name</td>
					<td><form:input path="name"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Create Customer"/></td>
				</tr>
			</tbody>
		</table>
	</form:form>	

	</body>
</html>