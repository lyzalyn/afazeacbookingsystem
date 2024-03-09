<%-- 
    Document   : treatmentForm
    Created on : 23 Jan 2024, 8:54:09 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACC - Insert Treatment</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${treatment == null}">
                            <form action="insertTreatment" method="post">
                            </c:when>
                            <c:otherwise>
                                <form action="updateTreatment" method="post">
                                    <input type="hidden" name="treatmentId" value="<c:out value='${treatment.treatmentId}' />" />
                                </c:otherwise>
                            </c:choose>

                            <caption>
                                <h2>
                                    <c:choose>
                                        <c:when test="${treatment != null}">
                                            Edit Treatment
                                        </c:when>
                                        <c:otherwise>
                                            Add New Treatment
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                            </caption>

                            <div class="mb-3">
                                <label for="treatmentName" class="form-label">Treatment Name:</label>
                                <input type="text" class="form-control" id="treatmentName" name="treatmentName" value="<c:out value='${treatment.treatmentName}' />" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
