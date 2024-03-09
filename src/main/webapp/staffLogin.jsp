<%-- 
    Document   : staffLogin
    Created on : 22 Jan 2024, 3:45:01 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Staff Login</title>
        <style>
            body {
                background: linear-gradient(to right, #3498db, #2c3e50);
                background-size: cover;
                background-position: center;
                margin: 0 auto;
                padding: 0px;
                font-family: Arial, sans-serif;

            }

            form {
                max-width: 400px;
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

            input {
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
        </style>
    </head>
    <body>
        
           <header>

            <h1 style="color: white ; text-align: center"><img src="img/logoaf.png" alt="Logo Afazea" width="70">Welcome Back!</h1>
        </header>
        
        <div class="card mb-3" style="max-width: 800px;  margin: 0 auto; padding-bottom: 0px; position: relative;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/bg4.jpg" class="img-fluid rounded-start" alt="registerimg" style="height: 100%; object-fit: cover;">
                    </div>


                    <div class="col-md-8">    
                        <div class="card-body"  style="background-color: rgba(255, 255, 255, 0.8); border-radius: 0 20px 20px 0; padding: 20px;">
        <form id="staffLoginForm" onsubmit="validateLogin(); return false;">

            <label for="email">Email:</label>
            <input type="email" id="sEmail" name="sEmail" required>

            <label for="password">Password:</label>
            <input type="password" id="sPassword" name="sPassword" required>

            <label for="role">Staff Role:</label>
            <select id="sRole" name="sRole" required>
                <option value="" disabled selected>Select Staff Role</option>
                <option value="confinementLady">Confinement Lady</option>
                <option value="therapist">Therapist</option>
                <option value="clerk">Clerk</option>
                <option value="manager">Manager</option>
            </select>
            <br>
            <button type="submit" class="btn btn-primary" style="text-align: center; margin-top: 20px;"> Login</button>
        </form>
                        </div>
                        </div>
                    </div>
                </div>
       
        <script>
            function validateLogin() {

                var email = document.getElementById("sEmail").value;
                var password = document.getElementById("sPassword").value;
                var role = document.getElementById("sRole").value;
                // Implement your login validation logic here
                // For simplicity, I'm checking if the role is "manager"
                if (role.toLowerCase() === "clerk") {
                    // Redirect to the manager dashboard page
                    window.location.href = "CDashboard.jsp";
                } else if (role.toLowerCase() === "manager") {
                    window.location.href = "MDashboard.jsp";
                } else {
                    // You can add additional logic for other roles or show an error message
                    alert("Invalid role or credentials. Please try again.");
                }
            }
        </script>

    </body>
</html>

