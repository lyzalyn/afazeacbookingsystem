<%-- 
    Document   : MDashData
    Created on : 23 Jan 2024, 10:45:46 am
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Dashboard Data</title>
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
           

            .profile-section {
                padding-right: 160px;

            }

            .profile-picture {
                width: 55px;
                height: 55px;
                border-radius: 50%;
                margin-top: 10px;
                margin-bottom: 10px;
                margin-left: 300px;
            }



            .search-box {

                width: 50%;
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 10px;
                margin-left: 100px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
       
            <div id="dashboard">

                <div class="w3-panel w3-card-4" style="display: flex; align-items: center; border-radius: 20px;">
                    <p>Manager</p>
                    <h4 style="color: #ff9999;  margin-right: 10px;" ><b>Dashboard</b></h4>
                    <input type="text" placeholder="Search..." class="search-box"><img src="img/hasliza.jpeg" alt="Profile Picture" class="profile-picture">
                </div>
                <div class="w3-panel w3-card-4" style="border-radius: 20px;">
                    <h4>Today's Data</h4>
                    <div class="w3-row-padding">
                        <div class="w3-col s4">
                            <div class="w3-card-2" style="background-color: #ffffcc; margin: 15px 0px 15px 0px; width: 18rem; height: 10rem; text-align: center">Total Bookings Today</div>
                        </div>
                        <div class="w3-col s4">
                            <div class="w3-card-2"  style="background-color: #ffffcc; margin: 15px 0px 15px 0px; width: 18rem; height: 10rem; text-align: center">Number of New Bookings</div>

                        </div>
                        <div class="w3-col s4">
                            <div class="w3-card-2"  style="background-color: #ffffcc; margin: 15px 0px 15px 0px; width: 18rem; height: 10rem; text-align: center">Number of Available's Slot Today</div>
                        </div>
                    </div>
                </div>
                <div class="w3-panel w3-card-4" style="border-radius: 20px; ">
                    <h4>Finance Data</h4>
                    <table id="financeTable" >
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Description</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Data will be dynamically added here using JavaScript -->
                        </tbody>
                    </table>

                </div>
            </div>
      
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

