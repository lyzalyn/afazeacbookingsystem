<%-- 
    Document   : ClerkDashboard
    Created on : 6 Jan 2024, 10:13:55 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Afazea Confinement Centre - Clerk Dashboard</title>
    <link rel="stylesheet" href="css/managerstyle.css" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">

    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* Sidebar styles */
        #sidebar {
            transition: all 0.3s;
            height: 100%;
            position: fixed;
            overflow: hidden;
            background-color: #ff9999;
        }

        #sidebar:hover {
            background-color: #ffcccc;
            border-radius: 50%;
        }

        .nav-link {
            color: black;
            transition: background-color 0.3s;
            padding: 15px 8px 15px 32px;
        }

        .nav-link:hover {
            background-color: white;
            color: pink;
        }

        .navbar-brand {
            font-family: "Sofia", sans-serif;
            font-size: 30px;
            text-shadow: 3px 3px 3px #ababab;
            color: #e85b56;
        }

        .container-fluid {
            background-color: white;
        }
    </style>
</head>

<body>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar">
                <div class="position-sticky">
                    <!--<a class="navbar-brand" href="#">
                        <img src="img/logoaf.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                        ACC 
                    </a>
                    <hr> -->
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active"><i class="bi bi-speedometer2"></i>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath()%>/listUser">
                                <i class="bi bi-people-fill"></i> User List
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">
                                <i class="bi bi-people-fill"></i> Service
                            </a>
                            <!-- Submenu under "Service List" -->
                            <ul class="submenu">
                                <li class="nav-item">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/listService"><i class="bi bi-list-task"></i>
                                        Service List
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/newService">
                                        Add New Service
                                    </a>
                                </li>
                                <!-- Add more submenu items as needed -->
                            </ul>
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
            <main id="main-content" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <!-- Main content area -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
                </div>
                <br>
                <!-- Content dynamically loaded here -->
            </main>
        </div>
    </div>

    <script>
        // jQuery document ready function
        $(document).ready(function() {
            // Handle sidebar link clicks
            $('.nav-link').on('click', function(event) {
                event.preventDefault(); // Prevent the default behavior of the link

                // Get the href attribute of the clicked link
                var targetPage = $(this).attr('href');

                // Load the content of the target page into the main content area
                $('#main-content').load(targetPage);
                
                 // Additional handling for the "Edit" button in Service List
              if (targetPage === '<%=request.getContextPath()%>/listService') {
                // Identify the "Edit" link based on its text content
                var editLink = $('a:contains("Edit")');
                editLink.on('click', function(event) {
                    event.preventDefault();

                    // Load the edit form content dynamically
                    $('#main-content').load(targetPage);
                });
            }
            });
        });
    </script>

</body>
</html>
