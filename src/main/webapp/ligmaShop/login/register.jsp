<%-- 
    Document   : register
    Created on : Feb 3, 2025, 3:09:17 PM
    Author     : ADMIN
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Clean Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css">
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">

    </head>
    <body>
        <div class="container demo-1">
            <div class="content">
                <div id="large-header" class="large-header">
                    <h1>Register</h1>
                    <div class="main-agileits">
                        <div class="form-w3-agile">
                            <h2>Register Now</h2>
                            
                            <!-- error handle with user hit the cancel button or login google failed 
                            <c:if test="${not empty message}">
                                <div class="alert alert-${messageType}">
                                    <c:out value="${message}"/>
                                </div>
                            </c:if>-->
                            <c:if test="${param.error == 'invalid_email'}">
                                <div class="alert alert-${messageType}">
                                    <c:out value="${message}"/>
                                </div>
                            </c:if>
                            <c:if test="${param.error == 'invalid_password'}">
                                <div class="alert alert-${messageType}">
                                    <c:out value="${message}"/>
                                </div>
                            </c:if>
                            
                            <form action="${pageContext.request.contextPath}/authservlet" method="POST" onsubmit="return validateRegister()">
                                <input type="hidden" name="action" value="register"/>
                                <div class="form-sub-w3">
                                    <input type="text" name="fullname" placeholder="Full Name" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="email" name="email" id="email" placeholder="Email" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                    </div>
                                    <span id="emailError" style="color: red;"></span>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="text" name="username" placeholder="Username" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="password" placeholder="Password" id="password" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </div>
                                    <span id="passwordError" style="color: red;"></span>
                                </div>
                                <p class="p-bottom-w3ls1">Already have an account? <a href="signIn.jsp">Login here</a></p>
                                <div class="clear"></div>
                                <div class="submit-w3l">
                                    <input type="submit" value="Register">
                                </div>
                            </form>
                            <script>
                                functinon validateRegister() {
                                    var email = document.getElementById("email");
                                    var email_regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                                    
                                    var password = document.getElementById("password");
                                    var password_regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
                                    
                                    var valid = true;
                                    
                                    if (!email_regex.test(email)) {
                                        email.defineProperty(email, "value", "");
                                        email.defineProperty(email, "placeholder", "Invalid email");
                                        valid = false;
                                    } else
                                        document.getElementById("emailError").textContent = "";
                                        
                                    if (!password_regex.test(password)) {
                                        document.getElementById("passwordError").textContent = "Invalid password format.";
                                        valid = false;
                                    } else
                                        document.getElementById("passwordError").textContent = "";
                                    
                                    return valid;
                                }
                            </script>
                            <div class="social w3layouts">
                                <div class="heading">
                                    <h5>Or Register with</h5>
                                    <div class="clear"></div>
                                </div>
                                <div class="icons">
                                    <a>
                                        <i class="fa-brands fa-facebook"></i>
                                    </a>

                                    <a  href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/LigmaBallsOfficial/logingg&response_type=code&client_id=104499240705-951rk6sn3o4g8cbj0kmf8toc06i934ln.apps.googleusercontent.com&approval_prompt=force">
                                        <i class="fa-brands fa-google"></i>
                                    </a>

                                    <div class="clear"></div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="copyright w3-agile">
                        <p> © Design by <a href="#" target="_blank">Những Vì Tinh Tú</a></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

