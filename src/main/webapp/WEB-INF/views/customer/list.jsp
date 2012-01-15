<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<h3>Your Intuit Customers</h3>
		
		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Given Name</th>
					<th>Family Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers}" var="customer">
				<tr>
					<td><c:out value="${customer.name}"/></td>
					<td><c:out value="${customer.givenName}"/></td>
					<td><c:out value="${customer.familyName}"/></td>
					<c:url value="/customer/${customer.id.value}" var="view_url"/>
					<c:url value="/customer/update/${customer.id.value}" var="update_url"/>
					<c:url value="/customer/${customer.id.value}/payment/" var="payment_url"/>
					<c:url value="/customer/${customer.id.value}/invoice/" var="invoice_url"/>
					<td>
						<a href="${view_url}">View</a> 
						|  <a href="${update_url}">Update</a>  
						| <a href="${payment_url}">Payments</a>
						| <a href="${invoice_url}">Invoices</a> 
						<c:url var="delete_url" value="/customer/${customer.id.value}"/>
						<form:form action="${delete_url}" method="delete">
    						<p class="submit"><input type="submit" value="Delete"/></p>
						</form:form>
						
					</td>
				</tr>					
				</c:forEach>
			</tbody>
		</table>