<%-- 
    Document   : staffRegistration
    Created on : 22 Jan 2024, 11:59:35 am
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff Registration Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

            label {
                display: block;
                margin-bottom: 8px;
            }

            input, select {
                width: 100%;
                padding: 8px;
                margin-bottom: 16px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #4caf50;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button:hover {
                background-color: #45a049;
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
            <p><ion-icon name="add-circle-outline"></ion-icon>Add Staff</p>
        <a href="MDashboard.jsp"><h4 style="color: #ff9999;  margin-right: 10px;" ><b>Form</b></h4></a>


    </div>

    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:choose>
                    <c:when test="${staff == null}">
                        <form id="staffRegistrationForm" onsubmit="generateRandomPassword()" action="insertStaff" method="post">
                        </c:when>
                        <c:otherwise>
                            <form action="updateStaff" method="post">
                                <input type="hidden" name="staffId" value="<c:out value='${staff.staffId}' />" />
                            </c:otherwise>
                        </c:choose>

                        <caption>
                            <h2>
                                <c:choose>
                                    <c:when test="${staff != null}">
                                        Edit Staff
                                    </c:when>
                                    <c:otherwise>
                                        Add New Staff
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </caption>



                        <div class="mb-3">
                            <label for="firstName">First Name:</label>
                            <input type="text" id="sfName" name="sfName" value="<c:out value='${staff.sfName}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastName">Last Name:</label>
                            <input type="text" id="slName" name="slName" value="<c:out value='${staff.slName}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber">Phone Number:</label>
                            <input type="tel" id="spNo" name="spNo" value="<c:out value='${staff.spNo}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="email">Email:</label>
                            <input type="email" id="sEmail" name="sEmail" value="<c:out value='${staff.sEmail}'/>"required>
                        </div>
                        <div class="mb-3">
                            <label for="password">Password:</label>
                            <input type="password" id="sPassword" name="sPassword" value="<c:out value='${staff.sPassword}'/>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="address">Address:</label>
                            <input type="text" id="sAddress" name="sAddress" value="<c:out value='${staff.sAddress}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="city">City:</label>
                            <input type="text" id="sCity" name="sCity" value="<c:out value='${staff.sCity}'/>" required>
                        </div><!-- comment -->
                        <div class="mb-3">
                            <label for="postcode">Postcode:</label>
                            <input type="text" id="sPostcode" name="sPostcode" value="<c:out value='${staff.sPostcode}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="state">State:</label>
                            <input type="text" id="sState" name="sState" value="<c:out value='${staff.sState}'/>" required>
                        </div>
                        <div class="mb-3">
                            <label for="role">Staff Role:</label>
                            <select id="sRole" name="sRole" value="<c:out value='${staff.sRole}'/>" required>
                                <option value="" disabled selected>Select Staff Role</option>
                                <option value="confinementLady">Confinement Lady</option>
                                <option value="therapist">Therapist</option>
                                <option value="clerk">Clerk</option>
                                <option value="manager">Manager</option>
                            </select>
                        </div>
                        <button type="submit">Register</button>
                    </form>
            </div>
        </div>
    </div>
    <script>
        function generateRandomPassword() {
            // Generate a random password (you can customize the logic as needed)
            var randomPassword = Math.random().toString(36).slice(-8);

            // Set the generated password to the password field
            document.getElementById("sPassword").value = randomPassword;
        }
    </script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script> 
</body>
</html>
