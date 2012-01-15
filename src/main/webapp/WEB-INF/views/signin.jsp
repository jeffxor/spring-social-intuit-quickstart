<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<form action="<c:url value="/signin/intuit" />" method="POST">
		    <button type="submit" class="intuitPlatformConnectButton">Sign in with Intuit</button>
		    <input type="hidden" name="scope" value="email,publish_stream,offline_access" />		    
		</form>
