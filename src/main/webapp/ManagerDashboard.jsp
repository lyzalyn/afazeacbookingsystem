<%-- 
    Document   : ManagerDashboard
    Created on : 1 Jan 2024, 2:45:57 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afazea Confinement Centre - Manager Dashboard</title>
        <link rel="stylesheet" href="css/managerstyle.css" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">

        <!-- Include Bootstrap JS -->
        <style>

            /* Sidebar styles */
            #sidebar {
                transition: all 0.3s;
                height: 100%;
                position: fixed;
                overflow: hidden;
            }

            #sidebar:hover {
                background-color: pink; /* Set the background color on hover */
            }

            .nav-link {
                color: black; /* Set the default text color */
                transition: background-color 0.3s;
                padding: 15px 8px 15px 32px;

            }

            .nav-link:hover {
                background-color: white; /* Set the background color on hover */
                color: pink; /* Set the text color on hover */
            }
            .navbar-brand{
                font-family: "Sofia", sans-serif;
                font-size: 30px;
                text-shadow: 3px 3px 3px #ababab;
                color: #e85b56;
            }
            .container-fluid{
                background-color: white;
            }

        </style>
    </head>


    <body>

        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-light sidebar">
                    <div class="position-sticky">
                        <a class="navbar-brand" href="#">
                            <img src="img/logoaf.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                            ACC 
                        </a><hr>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#"><i class="bi bi-speedometer2"></i>
                                    M-Dashboard
                                </a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/listUser"
                                     ><i class="bi bi-people-fill"></i>
                                    User List
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%=request.getContextPath()%>/listService"><i class="bi bi-list-task"></i>
                                    Service List
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><i class="bi bi-person-fill-add"></i>
                                    Staff Registration
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><i class="bi bi-clipboard2-data"></i>
                                    Reporting
                                </a>
                            </li>
                            <!-- Add more items as needed -->
                        </ul>
                    </div>
                </nav>

                <!-- Main content -->
                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Manager Dashboard</h1>
                    </div>
                    
                    
                </main>
            </div>
        </div>





    </body>
</html>