<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table>
		<thead>
			<tr>
				<td colspan="2"><c:out value="${customer.name}"/></td>
			</tr>					
		</thead>
		<tbody>
			<tr>
				<td>Given Name</td>
				<td><c:out value="${customer.givenName}"/></td>
			</tr>
			<tr>
				<td>Family Name</td>
				<td><c:out value="${customer.familyName}"/></td>
			</tr>
		</tbody>
	</table>
	
	<c:forEach items="${customer.addresses}" var="addressItem">
		<table>
			<thead>
				<tr>
					<td colspan="2">${addressItem.tags[0]} Address</td>
				</tr>					
			</thead>
			<tbody>
				<tr>
					<td>Address</td>
					<td>${addressItem.line1} ${addressItem.line2}</td>
				</tr>
				<tr>
					<td>City</td>
					<td>${addressItem.city}</td>
				</tr>
				<tr>
					<td>State</td>
					<td>${addressItem.countrySubDivisionCode}</td>
				</tr>
				<tr>
					<td>Postal Code</td>
					<td>${addressItem.postalCode}</td>
				</tr>
			</tbody>
		</table>
	</c:forEach>
	
	<c:if test="${not empty payments}">
		<h3>Payments</h3>		
		<table>
			<thead>
				<tr>
					<th>Payment Id</th>
					<th>Amount Due</th>
					<th>Amount Paid</th>
					<th>Payment Note</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${payments}" var="payment">
					<c:set var="paymentLine" value="${payment.lines[0]}"/>
				<tr>
					<td><c:out value="${payment.id.value}"/></td>					
					<td><c:out value="${payment.header.totalAmt}"/></td>
					<td><c:out value="${paymentLine.amount}"/></td>
					<td><c:out value="${payment.header.note}"/></td>
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
	</c:if>
		
	<c:if test="${not empty invoices}">
		<h3>Invoices</h3>	
		<table>
			<thead>
				<tr>
					<th>Invoice Id</th>
					<th>Document Number</th>
					<th>Due Date</th>
					<th>Description</th>
					<th>Amount Due</th>
					<th>Invoice Note</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${invoices}" var="invoice">
					<c:set var="invoiceHeader" value="${invoice.header}"/>
					<c:set var="invoiceLine" value="${invoice.lines[0]}"/>
				<tr>
					<td><c:out value="${invoice.id.value}"/></td>					
					<td><c:out value="${invoiceHeader.docNumber}"/></td>
					<td><fmt:formatDate value="${invoiceHeader.dueDate.time}" pattern="MM/dd/yyyy"/></td>
					<td><c:out value="${invoiceLine.desc}"/></td>
					<td><c:out value="${invoiceLine.amount}"/></td>
					<td><c:out value="${invoiceHeader.note}"/></td>
					<td></td>
					<c:url value="/invoice/${invoice.id.value}" var="view_url"/>
					<c:url value="/invoice/update/${invoice.id.value}" var="update_url"/>
				</tr>					
				</c:forEach>
			</tbody>
		</table>	
	</c:if>