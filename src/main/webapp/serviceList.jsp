<%-- 
    Document   : serviceList
    Created on : 8 Jan 2024, 8:50:09 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afazea Confinement Centre - Service List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">     
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <style>
            body {
                font-family: "Lato", sans-serif;
            }
            
            .sidebar {
                height: 100%;
                width: 180px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #ff9999;
                overflow-x: hidden;
                padding-top: 40px;
            }

            .sidebar-link {
                display: block;
                padding: 10px;
                color: white;
                text-decoration: none;
                transition: background-color 0.3s, border-radius 0.3s;
            }

            .sidebar-link:hover {
                background-color: #555;
            }

            .sidebar-link.active {
                background-color: #ffcccc;
                border-radius: 30px;
                opacity: 5;
            }

            .sidebar a {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 20px;
                color: white;
                display: block;
            }

            .sidebar a:hover {
                color: #f1f1f1;

            }



            @media screen and (max-height: 450px) {
                .sidebar {
                    padding-top: 15px;
                }
                .sidebar a {
                    font-size: 18px;
                }
            }
        </style>
    </head>
    <body>


        <!-- Main content -->

        <div class="w3-panel w3-card-4" style="display: flex; align-items: center; border-radius: 20px;">
            <p>Service</p>
            <h4 style="color: #ff9999;  margin-right: 10px;" ><b>List</b></h4>
            <a style="margin-left: 200px; padding-left: 150px; padding-right: 150px;" class="btn" href="<%=request.getContextPath()%>/newService">
                <ion-icon name="add-circle-outline"></ion-icon> Add New Service</a>

        </div>
        <!-- Content goes here -->


        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Service ID</th>
                    <th>Service Name</th>
                    <th>Service Type</th>
                    <th>Service Description</th><!-- comment -->
                    <th>Service Time</th><!-- comment -->
                    <th>Service Days</th><!-- comment -->
                    <th>Price</th><!-- comment -->
                    <th>Actions</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="service" items="${listofService}">
                    <tr>
                        <td><c:out value="${service.serviceId}" /></td>
                        <td><c:out value="${service.serviceName}" /></td>
                        <td><c:out value="${service.serviceType}" /></td>
                        <td><c:out value="${service.serviceDesc}"/></td>
                        <td><c:out value="${service.serviceTime}"/></td><!-- comment -->
                        <td><c:out value="${service.serviceDays}"/></td>
                        <td><c:out value="${service.servicePrice}"/></td>
                        <td><a href="editService?serviceId=<c:out value='${service.serviceId}' />">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="deleteService?serviceId=<c:out value='${service.serviceId}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 

    </body>
</html>
