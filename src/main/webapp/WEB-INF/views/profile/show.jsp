<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table>
		<thead>
			<tr>
				<td colspan="2"><c:out value="${profile.firstName} ${profile.lastName}"/></td>
			</tr>					
		</thead>
		<tbody>
			<tr>
				<td class="label">Screen Name</td>
				<td><c:out value="${profile.emailAddress}"/></td>
			</tr>
		</tbody>
	</table>