<%-- 
    Document   : editServiceForm
    Created on : 8 Jan 2024, 11:55:05 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACC - Edit Service</title>
    </head>
    <body>
        <div class="edit-form">
    <h2>Edit Service Form</h2>
    <form action="<%=request.getContextPath()%>/updateService" method="post">
        <!-- Add your edit form fields here -->
       <!-- Add your form fields here -->
            <c:if test="${service != null}">
                <input type="hidden" name="serviceId" value="<c:out value='${service.serviceId}' />" />
            </c:if>
            <div class="mb-3">
                <label for="serviceName" class="form-label">Service Name:</label>
                <input type="text" class="form-control" id="serviceName" name="serviceName" required>
            </div>

            <div class="mb-3">
                <label for="serviceType" class="form-label">Service Type:</label>
                <input type="text" class="form-control" id="serviceType" name="serviceType" required>
            </div>

            <div class="mb-3">
                <label for="serviceDesc" class="form-label">Service Description:</label>
                <textarea class="form-control" id="serviceDesc" name="serviceDesc" rows="4" required></textarea>
            </div>

            <div class="mb-3">
                <label for="serviceTime" class="form-label">Service Time:</label>
                <input type="text" class="form-control" id="serviceTime" name="serviceTime" required>
            </div>

            <div class="mb-3">
                <label for="serviceDays" class="form-label">Service Days:</label>
                <input type="text" class="form-control" id="serviceDays" name="serviceDays" required>
            </div>

            <div class="mb-3">
                <label for="servicePrice" class="form-label">Service Price:</label>
                <input type="number" class="form-control" id="servicePrice" name="servicePrice" step="0.01" required>
            </div>

        <button type="submit" class="btn btn-primary">Update Service</button>
    </form>
</div>
    </body>
</html>
