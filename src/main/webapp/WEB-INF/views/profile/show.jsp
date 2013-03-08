<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table>
		<thead>
			<tr>
				<td colspan="2"><c:out value="${profile.name}"/></td>
			</tr>					
		</thead>
		<tbody>
			<tr>
				<td class="label">User Name</td>
				<td><c:out value="${profile.name}"/></td>
			</tr>
			<tr>
				<td class="label">Email Address</td>
				<td><c:out value="${profile.emailAddress}"/></td>
			</tr>
			<tr>
				<td class="label">Name</td>
				<td><c:out value="${profile.firstName} ${profile.lastName}"/></td>
			</tr>
		</tbody>
	</table>