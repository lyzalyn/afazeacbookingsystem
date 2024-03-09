<%-- 
    Document   : ServiceForm
    Created on : 7 Jan 2024, 12:06:04 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>ACC-Service Form</title>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blueviolet">
            <div>
                <a href="http://www.umt.edu.my" class="navbar-brand">ACC - Service Form</a>  
            </div>

            <ul class="navbar-nav">
                <!-- Add any relevant links or navigation items -->
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${service == null}">
                        <form action="insertService" method="post">
                    </c:when>
                    <c:otherwise>
                        <form action="updateService" method="post">
                        <input type="hidden" name="serviceId" value="<c:out value='${service.serviceId}' />" />
                    </c:otherwise>
                </c:choose>

                <caption>
                    <h2>
                        <c:choose>
                            <c:when test="${service != null}">
                                Edit Service
                            </c:when>
                            <c:otherwise>
                                Add New Service
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </caption>

                <div class="mb-3">
                    <label for="serviceName" class="form-label">Service Name:</label>
                    <input type="text" class="form-control" id="serviceName" name="serviceName" value="<c:out value='${service.serviceName}' />" required>
                </div>

                <div class="mb-3">
                    <label for="serviceType" class="form-label">Service Type:</label>
                    <input type="text" class="form-control" id="serviceType" name="serviceType" value="<c:out value='${service.serviceType}' />" required>
                </div>

                <div class="mb-3">
                    <label for="serviceDesc" class="form-label">Service Description:</label>
                    <textarea class="form-control" id="serviceDesc" name="serviceDesc" rows="4" required><c:out value='${service.serviceDesc}' /></textarea>
                </div>

                <div class="mb-3">
                    <label for="serviceTime" class="form-label">Service Time:</label>
                    <input type="text" class="form-control" id="serviceTime" name="serviceTime" value="<c:out value='${service.serviceTime}' />" required>
                </div>

                <div class="mb-3">
                    <label for="serviceDays" class="form-label">Service Days:</label>
                    <input type="text" class="form-control" id="serviceDays" name="serviceDays" value="<c:out value='${service.serviceDays}' />" required>
                </div>

                <div class="mb-3">
                    <label for="servicePrice" class="form-label">Service Price:</label>
                    <input type="number" class="form-control" id="servicePrice" name="servicePrice" step="0.01" value="<c:out value='${service.servicePrice}' />" required>
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
