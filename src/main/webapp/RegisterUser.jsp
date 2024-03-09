<%-- 
    Document   : RegisterUser
    Created on : 26 Dec 2023, 1:49:51 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/registerusercss.css" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Afazea Confinement Centre - User Registration</title>


  
    </head>

    <body>
        <header>

            <h1 style="color: white ; text-align: center"><img src="img/logoaf.png" alt="Logo Afazea" width="70">Create An Account</h1>
        </header>
        <div class="container">


            <div class="card mb-3" style="max-width: 800px; margin: 0 auto; padding-bottom: 0px; position: relative;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="img/bg3.jpg" class="img-fluid rounded-start" alt="registerimg" style="height: 100%; object-fit: cover;">
                    </div>


                    <div class="col-md-8">    
                        <div class="card-body"  style="background-color: rgba(255, 255, 255, 0.8); border-radius: 0 20px 20px 0; padding: 20px;">
                            <form action="UserServlet" method="post"> <!-- Specify the servlet URL here -->
                                <div class="mb-3">

                                    <input id="fName" class="form-control" type="text" name="fName" placeholder="First Name" required>
                                </div>

                                <div class="mb-3">
                                    <input id="lName" class="form-control" type="text" name="lName" placeholder="Last Name" required >
                                </div>
                                <div class="mb-3">
                                    <input id="pNo" class="form-control" type="text" name="pNo" placeholder="Phone Number" required>
                                </div>
                                <div class="mb-3">
                                    <input id="email" class="form-control" type="email" name="email" placeholder="Email Address" required> 
                                </div>
                                <div class="mb-3">
                                    <input id="password" class="form-control" type="text" name="password" placeholder="Password" required>
                                </div>

                                <div style="text-align: center; margin-top: 20px;">

                                    <button  type="submit" class="btn btn-primary">Register</button>
                                    <br>
                                    <a href="LoginUser.jsp">Already have an account? Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
