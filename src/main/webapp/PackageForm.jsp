<%-- 
    Document   : PackageForm
    Created on : 22 Jan 2024, 2:47:44 am
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACC - Insert Package</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>

      

        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${packages == null}">
                            <form action="insertPackage" method="post">
                            </c:when>
                            <c:otherwise>
                                <form action="updatePackage" method="post">
                                    <input type="hidden" name="packagesId" value="<c:out value='${packages.packagesId}' />" />
                                </c:otherwise>
                            </c:choose>

                            <caption>
                                <h2>
                                    <c:choose>
                                        <c:when test="${packages != null}">
                                            Edit Package
                                        </c:when>
                                        <c:otherwise>
                                            Add New Package
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                            </caption>

                            <div class="mb-3">
                                <label for="packageName" class="form-label">Package Name:</label>
                                <input type="text" class="form-control" id="packageName" name="packageName" value="<c:out value='${packages.packageName}' />" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
