<%-- 
    Document   : home
    Created on : 11 Jan 2024, 12:19:02 pm
    Author     : Name : Nur Hasliza Binti Haslin 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
    <head> 
        <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> 

        <title>Afazea Confinement Centre</title> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lemon&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spectral|Rubik">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=neon|outline|emboss|shadow-multiple">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-image: url('img/depanafc.jpg');
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-size: cover;
                background-position: center;
                background-attachment: fixed;

            }


            nav {
                background-color: #ffffff;
                color: #967638;
                text-align: center;
                padding: 10px 0;
                position: fixed; /* Change position to fixed */
                top: 0; /* Set top to 0 to position it at the top of the page */
                width: 100%; /* Make it full-width */
                z-index: 1000; /* Set a high z-index value to ensure it appears above other elements */
            }


            nav a {
                color: #967638;
                text-decoration: none;
                padding: 14px 16px;
                display: inline-block;
            }
            .dropdown {
                display: inline-block;
                position: relative;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown-item {
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                color: #333;
            }

            .dropdown-item:hover {
                background-color: #ddd;
            }

            .brand {
                font-size: 20px;
                font-weight: bold;
                display: inline-block;
                margin-right: auto;
                margin-left: auto;
            }

            section{
                padding: 140px 20px;
            }


            section#home .container{
                position: relative;
            }

            section#home .center{
                position: relative;/* Make sure the section is positioned relatively */
                color: white;
                text-align: center;
            }

            /*.background-overlay{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('img/potraitstonebackground.jpg');
                background-size: cover;
                background-position: center;
                /*background-color: gainsboro;
                /*background-image: linear-gradient(gainsboro, #ccffcc );
                /*background-image: url('img/depanafc.jpg');
                opacity: 0.70;/* Set the path to your background image / background-size: cover; background-position: center;
                                                          opacity: 0.65; / Adjust the opacity value (0 to 1) for transparency */


            section h2, section h3, section h5 {
                margin-bottom: 20px;
            }

            section button {
                padding: 10px 20px;
                font-size: 16px;
            }
            h2{
                font-family: "Sofia", sans-serif;
                font-size: 35px;
            }
            h5{
                font-family: "Sofia", sans-serif;
                text-shadow: 3px 3px 3px #ababab;

            }

            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 10px 0;
                position: fixed;
                bottom: 0;
                width: 100%;
            } </style>

    </head> 
    <body> 
        <nav>
            <a href="#home">Home</a> 

            <a href="#about">About</a>
            <a href="#services">Services</a> 
            <a href="#packages">Packages</a>
            <span class="brand">Afazea Confinement Centre</span> 
            <a href="#testimonial">Testimonial</a>
            <a href="#contact">Contact</a> 
            <!-- Updated login link with dropdown -->
            <div class="dropdown">
                <span>Login</span>
                <div class="dropdown-content">
                    <a href="staffLogin.jsp?type=staff">Staff Login</a>
                    <a href="LoginUser.jsp?type=customer">Customer Login</a>
                </div>
            </div>
        </nav>


        <section id="home" class="vh-100"> 
            <div class="container-fluid"> 

                <div class="row">
                    <div class="col-12"> 
                        <div class="background-overlay"></div> 
                        <div class="center text-center d-flex align-items-center justify-content-center" style="height: 100%;">
                            <div> <h2 class="font-effect-emboss"><i>First Postnatal Center in Terengganu</i></h2>
                                <h3 class="font-effect-emboss" style="color: #89d289; font-family: Spectral, serif;
                                    font-size: 46px;">BECAUSE YOU ARE PRECIOUS</h3>
                                <h5 class="font-effect-emboss">"Aura Tradisional Citarasa Moden"</h5> 
                                <br>
                                <br>
                                <button type="button" class="btn btn-light">BOOK NOW</button> 
                                <br><br><!-- <br> -->
                                <a class="btn btn-warning" href="#about" role="button" style="border-radius: 30px">Scroll Down For More Info  <i class="fa-solid fa-angles-down"></i></a>

                            </div>
                        </div>
                    </div> 
                </div> 
            </div>

        </section>

        <section class="about-section" id="about" style="text-align: center;/*background-color: wheat; background-image: linear-gradient(gainsboro, #ccffcc ); /* For browsers that do not support gradients */
                 "> 
            <div class="container-fluid"> 
                <h2 class="font-effect-emboss" style="font-family: Spectral, serif;
                    font-size: 40px;">About Us</h2>
                <div style="display: flex; align-items: center; justify-content: center;">
                    <img src="img/teamafc.jpg" alt="team acc" style="max-width: 25%;
                         height: auto;
                         margin-right: 10%; border-radius: 50%; border: 3px solid #bef4f7;">
                    <p style=" margin-bottom: 150px"  >Welcome to Afazea Confinement Centre, where we prioritize the well-being of new mothers and their precious little ones.
                        Our dedicated team of experienced caregivers is here to provide you with a nurturing and supportive environment during your postnatal journey.
                        From nutritious meals to traditional postnatal treatments, we ensure that you receive the utmost care and attention. 
                        Our goal is to create a peaceful and rejuvenating experience for you, allowing you to rest, recover, and bond with your baby. 
                        Join us at Afazea Confinement Centre and let us be a part of your beautiful motherhood journey!</p>
                    <!-- Add about content here --> 
                </div>
            </div>            
        </section> 
        <section id="services">
            <div class="container-fluid">
                <h2 class="font-effect-emboss" style="font-family: Spectral, serif;
                    font-size: 40px; text-align: center">Why Choose Afazea ?</h2>
                <div class="row">
                    <div class="col-sm-3">

                        <div class="card" style="width: 18rem;">
                            <div class="card-body">

                                <p class="card-text"><b>MIDWIFE</b> registered with <b>LEMBAGA BIDAN MALAYSIA</b>
                                    <br><b>STAFF NURSE</b> registered with <b>LEMBAGA JURURAWAT MALAYSIA</b></p>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">

                                <p class="card-text"><b>STAFF NURSE</b> registered with <b>LEMBAGA JURURAWAT MALAYSIA</b></p>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">

                                <p class="card-text">Satisfied and Experienced <b>CONFINEMENT LADY & THERAPIST</b></p>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">

                                <p class="card-text">Right<b> SOP</b> and Productive</p>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">

                                <p class="card-text"><b>Lactation Specialist</b></p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
        <section id="packages" class="bg-light" style="/*background-image: linear-gradient(#ccffcc, #ffcccc);*/"> 
            <div class="container-fluid"> 
                <div class="row">
                    <div class="col-12">

                        <div class="card-group">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="..." class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="..." class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </div>
                        </div>
                    </div><!-- comment -->
                </div>
            </div> 
        </section> 
        <section id="testimonial" class="bg-light" style="/*background-image: linear-gradient(#ffcccc, #ccffcc);*/">
            <div class="container"> 
                <h2>Testimonial Section</h2> <!-- Add testimonial content here --> 
            </div>
        </section> 
        <section id="contact" class="bg-light" style="/*background-image: linear-gradient(#ccffcc,gainsboro )*/">
            <div class="container"> 
                <h2>Contact Section</h2> <!-- Add contact content here -->
            </div>
        </section>

        <footer> &copy; 2024 Afazea Confinement Centre - developed by Nur Hasliza  </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-iGBYB9P4ZRQjLdLMpHJcQcdy0HAjtt3plkOVzdfmfxIgy8l5R/B6CLF7U8gUy3mF"
        crossorigin="anonymous"></script>
    </body> 
</html>





