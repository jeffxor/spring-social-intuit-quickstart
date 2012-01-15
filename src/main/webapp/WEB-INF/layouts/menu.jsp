<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<h4><a href="<c:url value="/customer"/>">Intuit</a></h4>

<ul class="menu">
	<li><a href="<c:url value="/profile"/>">User Profile</a></li>
	<li><a href="<c:url value="/customer"/>">Customers</a></li>
	<li><a href="<c:url value="/customer/create"/>">Create Customer</a></li>
	<li><a href="<c:url value="/payment"/>">Payments</a></li>
	<li><a href="<c:url value="/invoice"/>">Invoices</a></li>
</ul>
