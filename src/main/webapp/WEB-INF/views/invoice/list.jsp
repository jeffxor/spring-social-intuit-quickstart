<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<h3>Your Intuit Invoices</h3>
		
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