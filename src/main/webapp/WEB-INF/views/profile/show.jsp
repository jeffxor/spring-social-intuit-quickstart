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
				<td class="label">Company Id</td>
				<td><c:out value="${profile.companyId}"/></td>
			</tr>
			<tr>
				<td class="label">Base url</td>
				<td><c:out value="${profile.baseUrl}"/></td>
			</tr>
		</tbody>
	</table>