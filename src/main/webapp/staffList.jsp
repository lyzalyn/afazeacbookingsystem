<%-- 
    Document   : staffList
    Created on : 22 Jan 2024, 12:17:11 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff List</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            body {
                
                font-family: "Lato", sans-serif;
            }
            

            form {
                max-width: 600px;
                margin: 20px auto;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #4caf50;
                color: black;
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

        <div class="w3-panel w3-card-4" style="display: flex; align-items: center; border-radius: 20px;">
            <p>Staff</p>
            <a href="MDashboard.jsp"><h4 style="color: #ff9999;  margin-right: 10px;" ><b>List</b></h4></a>
            <a style="margin-left: 200px; padding-left: 150px; padding-right: 150px;" class="btn" href="<%=request.getContextPath()%>/newStaff">
                <ion-icon name="add-circle-outline"></ion-icon> Add New Staff</a>

        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Staff ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>Postcode</th>
                    <th>State</th>
                    <th>Staff Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="staff" items="${listofStaff}">
                <tr>
                    <td><c:out value="${staff.staffId}"/></td>
                <td><c:out value="${staff.sfName}"/></td>
                <td><c:out value="${staff.slName}"/></td>
                <td><c:out value="${staff.spNo}"/></td>
                <td><c:out value="${staff.sEmail}"/></td>
                <td><c:out value="${staff.sAddress}"/></td>
                <td><c:out value="${staff.sCity}"/></td>
                <td><c:out value="${staff.sPostcode}"/></td>
                <td><c:out value="${staff.sState}"/></td>
                <td><c:out value="${staff.sRole}"/></td>
                <td><a href="editStaff?staffId=<c:out value='${staff.staffId}' />">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="deleteStaff?staffId=<c:out value='${staff.staffId}' />">Delete</a>
                </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>



</body>
</html>

