<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afazea Confinement Centre - User List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">     
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
     
    </head>
    <body>

      

                <!-- Main content -->
    
                        <h1 class="h2">User List</h1>
                 
                        <hr>
                    <!-- Content goes here -->

                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Phone Number</th><!-- comment -->
                                <th>Email</th><!-- comment -->
                                <th>Address</th><!-- comment -->
                                <th>City</th><!-- comment -->
                                <th>Postcode</th>
                                <th>State</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${listofUser}">
                                <tr>
                                    <td><c:out value="${user.userId}" /></td>
                                    <td><c:out value="${user.fName}" /></td>
                                    <td><c:out value="${user.lName}" /></td>
                                    <td><c:out value="${user.pNo}"/></td><!-- comment -->
                                    <td><c:out value="${user.email}"/></td>
                                    <td><c:out value="${user.address}"/></td>
                                    <td><c:out value="${user.city}"/></td>
                                    <td><c:out value="${user.postcode}"/></td>
                                    <td><c:out value="${user.state}"/></td>
                                    <td><a href="editUser?userId=<c:out value='${user.userId}' />">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="deleteUser?userId=<c:out value='${user.userId}' />">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

          
    </body>
</html>
