<%-- 
    Document   : priceListForm
    Created on : 23 Jan 2024, 11:41:01 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Pricelist Entry</title>
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

        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${price == null}">
                            <form action="insertPrice" method="post">
                            </c:when>
                            <c:otherwise>
                                <form action="updatePrice" method="post">
                                    <input type="hidden" name="pricelistId" value="<c:out value='${price.pricelistId}' />" />
                                </c:otherwise>
                            </c:choose>

                            <caption>
                                <h2>
                                    <c:choose>
                                        <c:when test="${price != null}">
                                            Edit Price List
                                        </c:when>
                                        <c:otherwise>
                                            Add New Price List
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                            </caption>


                            <div class="mb-3"

                                 <c:choose>
                                     <c:when test="${not empty listofPackage}">
                                         <!-- If there are packages, use a dropdown to select the package by name -->
                                         <label for="packageName">Package Name:</label>
                                         <select name="packageName">
                                             <c:forEach var="packages" items="${listofPackage}">
                                                 <option value="${packages.packagesId}">${packages.packageName}</option>
                                             </c:forEach>
                                         </select>
                                     </c:when>
                                     <c:otherwise>
                                         <!-- If there are no packages, provide a message or alternative input method -->
                                         <label>No packages available</label>
                                         <!-- You may add an alternative way to input package information here -->
                                     </c:otherwise>
                                 </c:choose>


                            </div>
                            <!-- Or allow manual entry of package ID -->
                            <div class="mb-3">
                                <label for="packagesId">Package ID:</label>
                                <input type="text" name="packagesId" required>
                            </div>
                            <div class="mb-3">
                                <label for="packageDays">Package Days:</label>
                                <input type="text" name="packageDays" required>
                            </div>
                            <div class="mb-3">
                                <label for="price">Price:</label>
                                <input type="text" name="price" required>
                            </div>
                            <button type="submit">Create Pricelist Entry</button>
                        </form>
                </div>
            </div>
        </div>


    </body>
</html>

