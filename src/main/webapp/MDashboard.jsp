<%-- 
    Document   : MDashboard
    Created on : 22 Jan 2024, 12:09:27 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACC - Manager Dashboard</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">



        <style>
            body {
                font-family: "Lato", sans-serif;
            }
            .w3-container{

                margin-left: 170px;
                padding: 0px 15px;
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

        <div class="sidebar">
            <a href="MDashData.jsp" class="sidebar-link" onclick="changeColor(this)"><ion-icon name="speedometer-outline"></ion-icon> Dashboard</a>
            <a href="#profile" class="sidebar-link" onclick="changeColor(this)"><ion-icon name="person-circle-outline"></ion-icon> Profile</a>
            <div class="dropdown-button">
                <a href="#" class="sidebar-link" onclick="changeColor(this)"><ion-icon name="people-outline"></ion-icon> Staff</a>
                <div class="dropdown-content">
                    <a href="<%=request.getContextPath()%>/listStaff" onclick="changeColor(this)">Staff List</a>
                    <a href="<%=request.getContextPath()%>/newStaff" onclick="changeColor(this)">Add New Staff</a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/listPackage" class="sidebar-link" onclick="changeColor(this);">
                <ion-icon name="shapes-outline"></ion-icon> Packages List
            </a>



            <a href="home.jsp" style="padding-top: 300px"><ion-icon name="exit-outline"></ion-icon> Logout </a>
        </div>
        <div class="w3-container">

        </div>

        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 

        <script>

                function changeColor(link) {
                    // Remove 'active' class from all links
                    var links = document.getElementsByClassName('sidebar-link');
                    for (var i = 0; i < links.length; i++) {
                        links[i].classList.remove('active');
                    }

                    // Add 'active' class to the clicked link
                    link.classList.add('active');
                }
        </script>
        <script>
            var sidebarItems = document.querySelectorAll(".sidebar-link");
            sidebarItems.forEach(function (item) {
                item.addEventListener("click", function (event) {
                    event.preventDefault();
                    var page = event.target.getAttribute("href");
                    loadContent(page);
                    changeColor(event.target); // Add this line to change color when content is loaded
                });
            });


            function loadContent(page) {
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        document.querySelector(".w3-container").innerHTML = xhr.responseText;
                    }
                };
                xhr.open("GET", page, true);
                xhr.send();
            }

        </script>
        <script>
            // Sample financial data (replace this with your actual data)
            var financialData = [
                {date: '2024-01-01', description: 'Purchase', amount: 500.00},
                {date: '2024-01-05', description: 'Salary', amount: 2000.00},
                        // Add more data as needed
            ];
            // Function to populate the table with financial data
            function populateTable() {
                var tableBody = document.getElementById('financeTable').getElementsByTagName('tbody')[0];
                financialData.forEach(function (data) {
                    var row = tableBody.insertRow(tableBody.rows.length);
                    var cellDate = row.insertCell(0);
                    var cellDescription = row.insertCell(1);
                    var cellAmount = row.insertCell(2);
                    cellDate.innerHTML = data.date;
                    cellDescription.innerHTML = data.description;
                    cellAmount.innerHTML = '$' + data.amount.toFixed(2);
                });
            }

            // Call the function to populate the table
            populateTable();
        </script>



    </body>
</html> 

