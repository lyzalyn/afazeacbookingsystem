<%-- 
    Document   : LoginUser
    Created on : 26 Dec 2023, 11:59:10 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Afazea Confinement Centre - User Login</title>
        <style>
            /*
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/CascadeStyleSheet.css to edit this template
            */
            /* 
                Created on : 26 Dec 2023, 9:09:24 pm
                Author     : Name : Nur Hasliza Binti Haslin 
            */

            body {
                /* background-image: url('img/background1.jpg'); */
                background: linear-gradient(to right, #3498db, #2c3e50);
                background-size: cover;
                background-position: center;
                margin: 0 auto;
                padding: 0px;
                font-family: Arial, sans-serif; /* Add a generic font family for better cross-browser compatibility */
            }

            header {
                text-align: center;
                color: white;
                margin: 20px 0;
            }


            input {
                padding: 15px;
                border-radius: 20px;
                width: 100%;
                box-sizing: border-box; /* Include padding and border in the element's total width and height */
            }

            button {
                text-align: center;
                margin-top: 20px;
                padding: 10px;
                border-radius: 20px;
                width: 50%; /* Adjust the width of the button as needed */
                cursor: pointer;
            }

            button:hover {
                background-color: #3498db; /* Add a hover effect by changing the background color */
            }

            a {
                display: block; /* Make the link a block element to add spacing */
                margin-top: 10px; /* Add some spacing between the button and the link */
                text-decoration: none;
                color: black;
            }

            a:hover {
                text-decoration: underline; /* Add an underline effect on hover */
            }

        </style>
    </head>
    <body>
        <header>

            <h1 style="color: white ; text-align: center"><img src="img/logoaf.png" alt="Logo Afazea" width="70">Welcome Back!</h1>
        </header>
        <div class="container">


            <div class="card mb-3" style="max-width: 800px;  margin: 0 auto; padding-bottom: 0px; position: relative;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/bg4.jpg" class="img-fluid rounded-start" alt="registerimg" style="height: 100%; object-fit: cover;">
                    </div>


                    <div class="col-md-8">    
                        <div class="card-body"  style="background-color: rgba(255, 255, 255, 0.8); border-radius: 0 20px 20px 0; padding: 20px;">
                            <div class="mb-3">


                                <div class="mb-3">
                                    <input id="email" class="form-control" type="email" name="email" placeholder="Email Address"> 
                                </div>
                                <div class="mb-3">
                                    <input id="password" class="form-control" type="text" name="password" placeholder="Password">
                                </div>

                                <div style="text-align: center; margin-top: 20px;">

                                    <button type="submit" class="btn btn-primary"> Login</button>
                                    <br>
                                    <a class="small" href="RegisterUser.jsp">Create an account !</a>
                                    <a class="small" href="forgotpassword.jsp"> Forgot Password? </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </body>
</html>

