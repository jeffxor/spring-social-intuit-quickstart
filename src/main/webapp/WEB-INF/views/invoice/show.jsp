<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Payment - ${payment.header.customerName}</title>
	</head>
	<body>
	<ul>
		<li><a href="<c:url value="/signout" />">Sign Out</a></li>
	</ul>
	
	<table>
		<thead>
			<tr>
				<td colspan="2"><c:out value="${payment.header.customerName}"/></td>
			</tr>					
		</thead>
		<tbody>
			<tr>
				<td>Customer Name</td>
				<td><c:out value="${payment.header.customerName}"/></td>
			</tr>
			<tr>
				<td>Note</td>
				<td><c:out value="${payment.header.note}"/></td>
			</tr>
			<tr>
				<td>Payment Method</td>
				<td><c:out value="${payment.header.paymentMethodName}"/></td>
			</tr>
			<tr>
				<td>Payment Amount</td>
				<td><c:out value="${payment.header.totalAmt}"/></td>
			</tr>
		</tbody>
	</table>
			
	</body>
</html>