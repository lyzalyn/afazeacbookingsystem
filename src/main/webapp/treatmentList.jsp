<%-- 
    Document   : treatmentList
    Created on : 23 Jan 2024, 9:12:50 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACC - Treatment List</title>
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
            <p>Treatment</p>
            <h4 style="color: #ff9999;  margin-right: 10px;" ><b>List</b></h4>
            <a style="margin-left: 200px; padding-left: 150px; padding-right: 150px;" class="btn" href="<%=request.getContextPath()%>/newTreatment">
                <ion-icon name="add-circle-outline"></ion-icon> Add New Treatment</a>

        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Treatment ID</th>
                    <th>Treatment Name</th>

                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="treatment" items="${listofTreatment}">
                    <tr>
                        <td><c:out value="${treatment.treatmentId}"/></td>
                        <td><c:out value="${treatment.treatmentName}"/></td>

                        <td><a href="editTreatment?treatmentId=<c:out value='${treatment.treatmentId}' />">Edit</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="deleteTreatment?treatmentId=<c:out value='${treatment.treatmentId}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 

    </body>
</html>
