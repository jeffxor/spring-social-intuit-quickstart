<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<h3>Your Intuit Payments</h3>
		
		<table>
			<thead>
				<tr>
					<th>Payment Id</th>
					<th>Customer Id</th>
					<th>Customer Name</th>
					<th>Payment Note</th>
					<th>Payment Method Name</th>
					<th>Amount Due</th>
					<th>Amount Paid</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${payments}" var="payment">
				<tr>
					<td><c:out value="${payment.id.value}"/></td>
					<td><c:out value="${payment.header.customerId.value}"/></td>
					<td><c:out value="${payment.header.customerName}"/></td>
					<td><c:out value="${payment.header.note}"/></td>
					<td><c:out value="${payment.header.paymentMethodName}"/></td>
					<td><c:out value="${payment.header.totalAmt}"/></td>
					<td></td>
					<c:url value="/payment/${payment.id.value}" var="view_url"/>
					<c:url value="/payment/update/${payment.id.value}" var="update_url"/>
					<td>
						<a href="${view_url}">View</a> |  <a href="${update_url}">Update</a>
						<c:url var="delete_url" value="/payment/${payment.id.value}"/>
						<form:form action="${delete_url}" method="delete">
    						<p class="submit"><input type="submit" value="Delete"/></p>
						</form:form>
						
					</td>
				</tr>					
				</c:forEach>
			</tbody>
		</table>
