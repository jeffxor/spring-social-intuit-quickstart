<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<h3>Your Intuit Payment Methods</h3>
		
		<table>
			<thead>
				<tr>
					<th>Payment Method Id</th>
					<th>Name</th>
					<th>Type</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${paymentMethods}" var="paymentMethod">
				<tr>
					<td><c:out value="${paymentMethod.id.value}"/></td>
					<td><c:out value="${paymentMethod.name}"/></td>
					<td><c:out value="${paymentMethod.type}"/></td>
				</tr>					
				</c:forEach>
			</tbody>
		</table>