<!DOCTYPE html>

<html>
    <head>
        <title>LOGIN PAGE FAULT</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            body {font-family: Arial, Helvetica, sans-serif;}

            /* Full-width input fields */
            input[type=text], input[type=number] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Set a style for all buttons */
            button {
                background-color: #04AA6D;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }

            img.avatar {
                width: 15%;
                border-radius: 10%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: block; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: rgb(255,0,0);
                font-size: 25px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @-webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)} 
                to {-webkit-transform: scale(1)}
            }

            @keyframes animatezoom {
                from {transform: scale(0)} 
                to {transform: scale(1)}
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }

            /*1.1 Style for Google-SignIn-button*/
            .google-signin-button {
                display: inline-flex;
                align-items: center;
                background-color: wheat;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 380px;
                font-size: 16px;
                text-decoration: none;
                cursor: pointer;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s ease;
            }

            .google-signin-button:hover {
                background-color: #ccc;
            }

            .google-signin-button:active {
                background-color: #2a65c7;
            }

            .google-signin-button img {
                height: 20px;
                width: 20px;
                margin-right: 10px;
            }

            .google-signin-button a {
                color: white;
                text-decoration: none;
                display: flex;
                align-items: center;
                width: 100%;
                height: 100%;
            }
        
            /*2. Shopping button*/
        .shopping-button {
            display: inline-flex;
            align-items: center;
            /*background-color: #ffcc00;*/
            background-color: khaki;
            color: brown;
            border: 2px solid brown;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .shopping-button:hover {
            background-color: #ffb700;
        }
        .shopping-button img {
            height: 20px;
            width: 20px;
            margin-right: 10px;
        }
        
            /*3. Payment button*/
        .payment-button {
            display: inline-flex;
            align-items: center;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        .payment-button:hover {
            background-color: #0056b3;
        }

        .payment-button img {
            height: 20px;
            width: 20px;
            margin-right: 10px;
        }
        /* Error */
        .error-message {
    color: #ff0000; /* Màu ch? ?? */
    background-color: #ffe6e6; /* Màu n?n ?? nh?t */
    border: 1px solid #ff0000; /* ???ng vi?n ?? */
    padding: 10px; /* Kho?ng cách bên trong h?p */
    border-radius: 5px; /* Bo tròn các góc */
    margin: 10px 0; /* Kho?ng cách bên ngoài */
    font-weight: bold; /* Ch? ??m */
    text-align: center; /* Canh gi?a ch? */
}

        </style> 
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <body>
        <button onclick="document.getElementById('login-form-modal').style.display = 'block'" style="width:auto;">LOGIN FORM HERE</button>
        <div id="login-form-modal" class="modal">
            <form id="login-form" class="modal-content animate" action="MainController" method="POST">           
                <div class="imgcontainer">
                    <span onclick="document.getElementById('login-form-modal').style.display = 'none'" class="close" title="Close Modal">x</span>
                    <img src="Image/login_image.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">    
                    <label for="userID"><b>User ID</b></label>
                    <input type="text" placeholder="Enter User ID" name="userID" required>
                    <label for="password"><b>Password</b></label>
                    <input type="number" placeholder="Enter Password" name="password" required>
                    <input type="reset" value="Reset"/>                      
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                    <c:if test="${not empty requestScope.LOGIN_ERROR}">
                        <h5 class="error-message">${requestScope.LOGIN_ERROR}</h5>
                    </c:if>
                    <!--reCAPTCHA-->
                    <div class="g-recaptcha" data-sitekey="6LfcfgoqAAAAANqudMEuhqug8QvWT5LZAOp37o1S"></div>
                    <div id="error-recaptcha" style="color: red; font-size: 14px;"></div>

                    <!--Google Login-->
                    <button class="google-signin-button">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/www.prj302-milkTea.com/LoginGoogleController&response_type=code&client_id=625652318961-pm3cifq5650ap6vphed97vmom6239j0a.apps.googleusercontent.com&approval_prompt=force">
                            <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google logo">
                            Sign in with Google
                        </a>
                    </button>

                    <button type="submit" name="action" value="Login">Login</button>                   
                    

                    <div class="a-divider">
                        <h5 aria-level="5">---- New to us? ----</h5>
                        <span class="a-button-inner">
                            <a class="a-button-text" id="createUserSubmit" href="MainController?action=CreateAccount_Page">Create your new account</a>
                        </span>
                    </div>                   
                </div>

                <div class="container" style="background-color:#f1f1f1">
                    <button type="button" onclick="document.getElementById('login-form-modal').style.display = 'none'" class="cancelbtn">Cancel</button>
                    <span class="psw">Forgot <a href="#">password?</a></span>
                </div>
            </form>  
        </div>


        <div >
            <br><a href="MainController?action=Shopping_Page" class="shopping-button">
                <img src="https://img.icons8.com/material-outlined/24/000000/shopping-cart.png" alt="Shopping Cart">Go to Shopping</a>
        </div>


        <div>
            <a href="http://sandbox.vnpayment.vn/tryitnow/Home/CreateOrder" class="payment-button">
                <img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAsJCQcJCQcJCQkJCwkJCQkJCQsJCwsMCwsLDA0QDBEODQ4MEhkSJRodJR0ZHxwpKRYlNzU2GioyPi0pMBk7IRP/2wBDAQcICAsJCxULCxUsHRkdLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCz/wAARCAEOAPQDASIAAhEBAxEB/8QAHAABAAEFAQEAAAAAAAAAAAAAAAcBAwQFBgII/8QATRAAAgEDAgQCBgQJCAgGAwAAAQIDAAQRBSEGEjFBE1EUIkJhcYEjMpGhBxUkMzVSdbHBQ1NidIKys/AWY3JzosPR4TRGVJKU0pPE0//EABwBAQACAwEBAQAAAAAAAAAAAAAEBQIDBgEHCP/EADURAAIBAwEGAgoABgMAAAAAAAABAgMEETEFEhMhQVFhsQYUIjJxgZGhwfAjNFLR4fEVJOL/2gAMAwEAAhEDEQA/AJbpSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSqZ+ygK0pSgFKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgFKUzQFKs3NzbWlvPc3UqQ28CGSWSQ4VVHw3z2A70ubm2tIJrm5lSK3gUvLI5wqqPv9wHeoi4l4luddnCJzxabC5NtAThnbp402NuY9h2+JJMy0tJ3MsLkurIl1cxt45evRHriPii91qZ44Wlg01CRFAGKtL/rLjlO5PYdB8dzq9M1bUtIuI7mxnZCCPEiJYwTL3SRM4IPn1HasCldXC3pQhw1HkcxOvUlPiN8yb9E1yx1y0FxbHlkTlS6t2IMkEh7HzU+ye/xBA21QPpupX2k3cV5ZSckqeqytkxzRk5Mci91P3dRuKmPRNbsdctFubY8sicq3VuxzJBIR0Pmp9k9/iCBzV9ZO3e9H3fI6KzvFXW7L3ja0pSq0sBSlKAUqla+71zQrGXwLrULaKbbMZbmdc/rhckfPFeNpamynTnUe7BNvw5mxpVqG4t7mNJreWOaJxlJImV0Ye4qcVdr0waaeGKUpQ8FKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBVm5uba0gmurmVIreFC8sjn1VUffk9AO/wA6XNzbWkE9zcypFbwIZJZHOFVR/HsB3+dRDxLxLc67OI4+eLTYHJt4CcM7Dbxpsbcx7Dt8dzMtLSVzLC5LqyJdXUbeOXqOJeJbnXZxHGHi02F828BOGdht402NubyHb4kk8/vSr9vbPcEnm5I1+u56DHYZ2rrqVKNKKhBYSOUr13JupUZjgEkAAknoAMk/IVfW0u23ELgf0uVf7xrIN1b2+UtIxno0j5OT7u5/ztVrx9Ql3V5mG/5tSB/wjFbCLv1HzSwvE8NaXagkwsR7sN/dNX9N1K/0i8jvLR+SZPVdHzySxnBMcq9wfu6jcVa8e/iOWaYD/WKSP+IYq8t1DPhLqMeSyKMEHzPesZRU04yXIyjVq03v6/AmHRNbsdctBc255JE5VurdyDJBIex8wfZPf4ggbWoPtbrUNCvIL6ylHdRneOeM4LRSqOoP/cbipa0PW7HXLMXNseWROVLq3cgyW8hGeVsdQfZPf4ggcre2Mrd70fd8jrLG+jcxx1NtVD0oa5ziTiSHR4jbW5WTUpUyinBW3U9JZR/dHf4VVykoLekXNvbVLqoqNJZbLPFPEg0uM2Vm6nUZVHMwwRaRsPrt/TPsj5nsGjMlmZmYszMxZmYkszE5JYnck969SSSzSSyyu0ksrs8jucs7sclmPma2WlaUL1Zry8lNrpFofyu6OxYj+Qtx3c9OhxnuTg0lSpK4nyPqdjZUNkW+Za9X1b6JfhGx4SuOIYLmT8XWc13YM4F7HzJHCrd3SSUhPEHcZ36HsRKAOy+8VD2qavJeiO1tUNppVsOS0s4yQoUe3Ng7uepznGfiWu6FxBeaLON3msXIE9uWJwP5yHm2DD7D0PmsmjcRpexqu5S7U2LXv07qKUZf09X8XnGfl8yXaVYtLu1vbeG6tZVlgmXmR17+YIO4I6EVfqzTzzRwEouL3ZailKV6eClKUApSlAKUpQClKUApSlAKs3Fxb2sE9xcSLFBBG0ssj9FRRknzq9XNcbpO3Dt/4WeVJLWScDvCkqls+4bE/CtlKCqTUG8ZZrqzcIOS6HAcS8S3Ouz8ic8WmwOTbwHZpGG3jTY9ryHb45J5+hzVK7alSjRioQXJHHVasqsnOWp7ijaWRI16ucZ8h1J+VZd5KsYFpDtHGAJP6TeR/j76aeArXExH5qIkfE5P8Kt2aeLcoW35eaVs9znbPzrYQpyW+29I+ZjujoeV1KnAOGBBwe9X1vblUSNWQBQFGEGSB8aSF7u5IB+u/Kn9FB/nNZEk8NoTDBGpddpHfrny23oezaklFxy+xaS/uV2k5XHcMoH7q9tDBdRmW2HJIu7xefwqq3ENz9HcoiltkddiD8TVh0ns5QQd8nlbHqsvkf40ya1HniK3ZfZlgs5AVi2EJAU5wvngGs/Tr7U9HuLfUbQlD9Uht4p4yd45VB+qf+43FUkjjvEM0IxMv5xO5+FeLeWRY5opEDxkFVD59VvdUe5q0qNJzre6Wmzre5vq8aNpHM86du7z0S7kiXfHFi2lwz2Cn8Y3CsngSjItHXZmkPQj9Tz92DiP5ZZp5JJppGkllcvI7nLOzdSTXgDYDsNhW10rSku0mv76Q22jWp/KJxs87j+Qth3Y9Ce2fPp8vr1XcVGocl0X9z9D7OsKOx7beqPMuWX3fZLyQ0rSkvEmvr2U22kWjflVx7cr/wAxbju56Hy+NedV1V9QMEEEQtdMtF5LGzj+rGvTnfHVz3Pv95LU1XVX1FoYoolttOtAY7Gzj2SJOnM2Ni57n/rltbWmUkluw+b7/wCCfQoTqzVxcLmvdj/T/wCn1fTReKlKVpLI3Og69daJcEgNLZTMPSYAdz28SLOwYff0PYrK9pd2t7bw3VrKssEy8yOv3gg7gjoRUH1udA1660S4yOaSymYekwA/LxIs7Bx9/T3rOtrnc9mWhym3Nhq7Tr0Fia+/+SXqVj2l3a31vDdWsqywTLzI69/MEdQR0I7VkVcZyfNJRcW4yWGhSlKHgpSlAKUpQClKUApSlAK8uiOro6qyOrI6sAysrDBBB2wa9UoCJ+K+FH0h3v7FGbS3bMiDJayZjsD38M+ye3Q9ieTr6CdEkV0dVZHUo6uAysrDBDA7YPeop4q4UfSWa/sEZtLdvXTdmsmY9GJ38M+ye3Q+Z6Ow2hv4pVXz6MoL6x3f4lPTsaCz3gvlHXwyf+FqppxHjSDu0JA+0V5sZBHPyt9WUchz59q8etaXJ2/Nscf0kNXZzco5c49+Z6sj4d1GG2OWT+1jFeZQYbli6cwEhfDdGBORV27hz+UxHmjkPMxHsse9e45I7yMQzbTL+bfuf896Dey+ItNH4HmeCORPSLbdfbQeye+B++kE8cyej3PQ7Rv3B7DP7qtI89nMwIwduZc7MO2D+6r00Vs/JLE20mS0eMFT3rRXrwt6bqVHhImWVhXv60bWgt5y0fb4vol3PKwz2s+QwyoBB6hlPYj99eiSxJJJJJJJ7k1T/O9bXStKiuopdS1GRrfRbZuWWVdpbuQHHo9t3JPQkfwyvzm/v6u0avaK0X5Z+gti7GtfR613pc6jxvSxzb6JLtnRfNjStKjukl1DUJGttGtWxNMNpLqQH/w9sOpJ6Ej9/wBXxquqyai8MaRLb6faL4djZxfm4UG2Tjqx7n/JpquqzalJEqxrb2NqvhWNnFjw4IwMdtix7n/J11V0pKK3IfXuXVChOpNXFxr0XSP95Pq/kuQpSlaSyFKUoBSlNv8ArmgOk4O1O5s9Vt7IMxtdQZ45IycqswQssqjz2wfPPuqUxXAcG8PT+LDrV4hjVUY6fEwIdvEXlM7A9BgkIPfnyz39XdpGSp+0fKvSOrQqXrdHosPHcUpSpZzopSlAKUpQClKUApSlAKUpQCvLokisjqro6sjq4DKysMFWB2we9eqUBFHFXCsmkO9/YK7aY75dRktZMTsCevh/qnt0PmdD6t9EBkLcxjqejCpydEkR0dVZHVkdWAKsrDBVgdsHvUX8TcLtpEpv7EP+L2fPqHLWbk/VbPsH2T8j2Ju7faypRxXWnUqqmwZX1TFtJKfRPkn4J/hnLwTvbO8cikoTiRG7e8VW5txGFnhOYWwQR7H/AGq7OUnVSycsq4BdSMMPIqR9m9eYi8SOiuSr/WBAI9+Pj3rfU29ZQjlSb+Cf5JFv6D7YqzTlBQ75ksfbL+HIsjxZ2DysWAAGT3A7CrwA2A2HQUrb6ZpVvLA+q6q7Q6NA3KOX89qEw/kLcbHGx5j8d9iycbfX9XaNTnyitF28WfWtk7HtPR625c5PV45t9El+Pmyml6VDcxSanqcj2+i27cruu019KOlvbDqc+0R/AlLWq6pNqcsQEa29lbL4VjZxbRW8Q2AAGxY9z/CqarqtxqksZZEhtbdfCsrSHaG2iGwVQMDPTJx27AYGvqvnNJbkNPMuaFCc5+sXHvdF0ivy+7+S5ClKVpLEUpSgFKU26npQDbv0G5rseFeF/TDDqepRH0QEPZ20i49II3EsoPsfqjv1O2zeOFuFzfmLUtSj/IQQ9rbuMG6I3EkoP8n5Dv8AD60kAYGNhjYfCrK1ts+3M4fb23dzNrbPn1f4X5YAxVaUq0OAFKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBXiSOORJI5EV0kVkdHAZWVhghgdsV7oaAi7iXhmXSpGurJHk02RvqgM72jH2WxklPI9uh8zy4dGICsrMTgKp5mJ8gBvU7kDeuN4mm4m0l3vLGSAWMp5WljtIPHtWbblkcg5U9mx7j5msr2sVma0O72R6QVqu7bVEnLo28Z+PJ8/P4nMWeiJBEmo8Qc9pp4OYrVvVvdQYDIjSPZgp7k4+QORhapqlzqk6SSKsVvAvhWdrFtDbQjYKg2GemTjfHYAAY1xc3V3K091PLPM2xkmYs2B2Geg9wqzUGU1jdhp5nW0baXE41w8y6Y0j8Py/IUpStRPFKUoBSlKAbDrj511nC3C7ai0WpalGRp6kPawOCDeEHIkkB/k/Ie18PrU4X4XOpGPUdRjI05SGt4XBBvGB+s4/mx/wAXw+tJYAAAAAAAAAGAAPKrG1ts+3M4nb23eHm1tXz6vt4Lx7voAAAAAABtttVaUq1PnwpSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUAq3JHHKjxyKrxyKUdHAZWVhghgdsVcpQEW8S8NSaS7XdoGfTHfHdmtGY7I5/UPsn5HzbmqnOSOOVJIpFV45FKOjgFWVhgqwO2DUY8S8NSaQ7XdoGfTHbfqWtGY7I568h9k/I+bVVzbbvtw0Pomwtu8fFtcv2uj7+D8fP4681SlKrjsxSlKAV1PC/DDam0eoX6Eaarc0ETZBvGU9T/qx9/wAOtOGOGG1Rkvr5Cumo2Y4zkG8YH/DHc9+nSpMRVRVVQqqoCqqgAKAMAADarG1tt7256HFbe27ws2ts/a6vt4Lx8iqqqgKoAUAAADAAGwAAr1SlWp89FKUoBSlKAUpSgFKUoBSlKAUpSgFKVSgK0qmarQClKpmgK0qmaUBWlUqtAK8SJHIkkciK6SKyOjgMrKdirA7Yr1SgTOB1jgeUNJPozoUJLehztylPdDK22PIH7e1cpPpGt2zFZ9MvkIOMiB5FPweIMv31NOKYqFUs4SeVyOotPSa7oRUKiU146/UhaDSNcuWCwaZfOT3aB4k+bzBV++us0fgZ+ZJ9adCgwwsoGJVj5TyjGR7h9vau9oBSnZwi8vmeXfpNd3EXCmlBPtr9SioiKiIqqiAKiqAFVQMAADbFeqVSppzBWlUpQFaVSlAVpSlAKVSlAVpSlAKUpQClKUAqNtR4o4q06+vbKSW1LW8zIG9FUc6fWR8c3cEGpJqPuPbDknsdSRfVmQ2k5H85Hl4yfiMj+zUW63lDei8YOg2AqE7rhXEVJSXLPfUaFxdq11qtla3725trovAPDhEZWZlzGcg9yMfOpBqCleSNkljPLJEySxN+q6EMp+0VNWn3kd/Y2N7H9W5gjmwOxYbr8jkfKtdnVc04yfMnekuzqdrOFWjHEXy5d/8AP4Mo1G2o8V8Vadd31pLJZs1rK8ZYWwHOo3VgObuMfbUizTR28U08pxFBFJNI3kiKWJ+6on0uKXXeI7dplyLi8k1C6BGQIoj4vIfd9VayupSW7GDw2aNgUKM1WrXEFKEVnn3/ANZOw1m+4q03StLv4pLdn8GJdUQ24PJLIAQ677AH1T8q5k8a8T4P0tpnt+TL/wDau84j/QWt/wBTl/hUP1Hu5zpyW7IuPR62tr2hJ1qUW0+3fn9iXtA1qHWrJZgFS6i5Y7yEH83Jj6y9+Vuq/Z1FbioY0nVLrSL2K8t/Wx6k8WcLNCTuh9/dT2P3y/ZXlrf2tvd2r88E6BkPQjsVYdiDsR7qlW1fixw9UUG3Nkuwrb0Pclp4eBzfFOqcQ6PJbXFpJbGxuPosSQBninUZwWyNmG4+Bqzwxq3E2tXMsk8lsun2vqzFIFV5pmXKxKeY4wDlj8B32u8e/oiz/aUX+DLVr8H/AOjtV/aP/IjrW3L1jdzyJcadH/hnX4a384zjnr5lriniDiTQbyFYXsJLS7SSS38S3bxYyhCtG5EgBxkYOB192/P/AOn/ABP+rp//AMd//wClbL8JH53Qf91ff3oa43SUSTVdEjkVXjk1KxR0cBldWmUFWB2we9dpaUKMrdVJxTfM+Y3VerG4cISaR0H+n/E2x5dOI/q74/xK6DQuO4b2eG01SGO2mmYJDPCzeju7bKjhyWUnoDkj4d7XGnDemxae2qWFtDbS2rxi5S3VY45YZGEeSi7cykjfHTPyjcgHI7HIpSt7a8pb0I4fkKle4tKuJyyfQZyQQNiQQD1wfPBqMLzjbiqyu7yzf8XM9rcTW7MLZwGMTlOYDxO+K7LStWI4WstXuzzNDpnjTFjgyPCpT7WI++ojjhvtRnu3RTLP4V3qFyc+zGDLK337fGoez7eDlPipNImX9eaUOE8NnUW3H+u+k2npa2XovjxC58OBlfwSwDlSXO4G/TtUo7EAg7EbEb9RsRXz5sQR1B6++pj4P1I6joVkXbmns82M+euYQAjH4rymstp2kKcVOmsdGYbOup1G4VHk5vWuJ+MNEv5rKYWDoB4lvN6K4E0BOFfaTGezDzHv3wbf8IGurcW7XUdm9qJFNwsMDLIYujchLncdRt299dtxNoSa5p7Rpyre2/NLYucDD43jY/qv0Pvwe1Q26SRO8ciMkkbskiOMMjqSrKw8wa32ULe5p4cVvLX+5pvJ17eplSeHoT9DNDcRRTwurxTIkkTocq6MOYMDXi79I9GufRnSO48JzC8q88ayAEjnXI28964TgHXNn0O5fdQ82nMx6r9aSAZ8t2X3Z/VrYcb696Bafiy2fF5fRnxSp3gtTlSc+b7qPdk+WamVpONfgr9RaRuoSocY5j/T/ibGSNOAxk/k74A6/wA5XfcOXGvXunpe6uIUkuiJLaGGExGKDHqmTmYnmbrjsMd6jzhDh/8AHN76TcpnTbB1MgYercXAwyQ/7I2Z/kO9S7UraTowfCpRWerI9gqs1xKknjoVpSlVBaClKUApSlAK1Wv6f+M9Kv7UDMvhma38/Gi9dQPj0+dbWqV40pLDNlKrKjUjUhqnn6EE+X271InAd94tjeae7evZTeLECd/Any23wbm+2uU4l0/8XazfRKvLDMwu7fbA8OYliB8DzD5V74Vv/QNbsSxxFdk2M3l9KRyE/Bgv21S0W6NbD+B9S2nTjtLZjnDspL5frR2XG196LpHoytiXUJVgx38FPpJCPuX+1Wt4AsfV1PU3X67pYwHGDyR4kkI+JIH9mtPxrfm61eSGM80enxLbIBuGnb15Me/JC/2akHRLD8WaVp1kQOeKFTNjvM/0kh+0mpkP4ldvpE5e4/6Ox4UtJVXl/D9x9S1xJ+gdb/qcv8KjbQdJXWZ9TtObkmjsDcWrkkKsyzIoD47EEg/HPapJ4k/QOt/1OT+FcXwF+mNQ/Zrf48dK8VKtBM2bHqzobLuKlN4aa/By0sU0Es0EyNHNC7Ryo2zI67EGt/wvr50i6MFw5/Ft048YnpbynYTD3dA/2+zv0vF/D5vYm1OzTN5bpi4jUetcQL3AHtL28xt2FRxscEYIO9Qpxlb1Mo6e2r0Nt2bjPrya7PuvNEkceENpFkQQQdRhIIOQQYJTkGrf4P8A9Har+0f+RFXIS6vPcaLBpM5Z/RLuOa1kJyRAI5EMTd/VJHL7tu1df+D/APR+q/tH/wDXiqTTqKpXUl2KC8s52WyJ0anSX1WdTWfhI/O6D/ur7+9DXH6N+mdB/aun/wCOldh+Ej87oP8Aur7+9DXH6L+mdB/amn/46V31l/Jr4PzPj13/ADb+K/BKfGlzDBw9qKuRz3RhtYR+s7SBzj4AMflUQRxTzyw29vG0txO4igiQZaSRugH8T2+VS9rHCsOuXCzXup6gI4si3t4BbpDED1wGRiSe5J+7asrSeGtC0UmSzty1yy8jXNwxlnKnqoY7AeYAFVlre07Wi0ucn9CxubSdzWTfKKOX4qI0XhnQ9ASQNLKsSTlTs0dviRzjrguVxT8HemqYtW1OVAyzEadCGGxjT15tj2JKj+zWg4z1D03XbwK30NgFsY/LMeWkP/uLD5V503jTVtKsrawtY9M8C3VgpkjkZ2LMXZnYSgZJJJ2qZ6vVlaKMNZc38+ZF49NXLlLSPJGs1iwbS9S1GwIOLedhET7ULevG32EV0f4P9R9G1S409ziLUYeaMH/1Fvlhj4qW/wDaK53VtZuNbuku7lLRZ1hWE+iqyB0UswLhnY5GcVjWtzNZXNpeQ/nbWeK4T3mNg3L89wfjU6dKVa34dTXH3IMKqpXG/DTP2J9qPOO+H8E65aIMHlTUkUf2UuMD5K/yPma762uIbu3trqFg0VxFHPEw7pIoYVWdEkimR1VkeKRHVgCrKykEEGuVt60reopo6avSjXpuLIEt55rWeC4hcpNbypNEw6q6HIP/AFrPjj1biXVwgbnvb+UvLKR6kMSgBpCOyoMAD4DvWrHQfCpA/BskZfX5Cq+Iq2CK2BzBG8ZioPkcD7K6q7qcGk6yXNLBzNrDi1FSb5anc6bp9ppdla2NqhWG3TlBbdnYnLO5/WY5J+NZlKVxzbbyzrUklhClKV4eilKUApSlAKUpQHHcdacZ7G31GNcvYsUmIG/o8pAyfcpx9pqOlLKyspIZGV1I6hlIYGpzdEkR0dQyOrK6uAVZSMEMDtg964LVuBZg7zaPIhjOW9EuGKlPdFLvt5A/bVddW8pPfgdv6P7ao0aXqty8JaPpz6M0PD9rJq3EFn4xMgE8mpXjH2vDbxMt/tMVHzqXRXIcG6Je6aNTub+3aG4lkjtokcoxEMY5ywKEjDE+fs119brWm4Qy9WVPpDeRubvdpvMYJJY07vH70NTxJ+gdb/qcn8K4vgL9MX/7NP8Ajx11vE0Gt3tgbHTII39JOLqSSZI+WFSDyKG6lu/uHv25jRtC4x0e/ivEs7d0I8G5j9Ki+kgYgkA46jAI+HvrCspcaMknhEvZ06Udl1qUpxUpaJtdMEi+dRpxdw/6BM2pWiAWVzJ9OiDAt527gD2W7eR27jEk9q8Tww3EUsE8ayQyqUkRxlXU9QRUitSVWO6yl2btCps+uqsOa6ruv3Qg2pE/B/8Ao/Vf2j/yIq1eq8D38LvJpLpcwEkiCZwlxGD7IdvVYeWSD8etbzguw1CwstSivbaW3ke+50WXl9ZPBjXmBUkYznvUC3ozp1faR2O29pW15s5ujNN5XLr9DSfhI/O6D/ur7+9DXH6N+mdB/aun/wCOld5xZoPEuu30LW0VoLO0hMcBlueWSR5CGkdlCHHQADJ6Z74Ghh4I4wt5re4hWwWaCWOeJjdE8skbB1OPD8xXdWtelC2VOUknhnxu5oVZXDnGLxlEsVh6neppun6hfPjFrbySqD0aTGEX5nA+dXbVrp7eB7uJIrlo1M0cT+JGkncI+BkeW1c7xZp/EerQRafpsdsLRmWa6knuCjyOhJWJUCn1RsxOeuPLfn6MYyqKMnhF5Vk4wbissj/hiyfVeINOSYeIkcz6hdlhkMIfpPW+LFQfjUw+h2Pe1tv/AMMf/SuK4U4c4i0TVDcXUVm1tPbSW0zRXBaSP1lkVlUoM7jB37+6u9qdtGup1VuPkl0IdhRcKftrnk0uuaNa6hpOo2kNvCk7wl7cxxorCaP6RNwO5GD8ahQH/PlU/XT3SW872kSzXIRvAjkcRo0mMDnc9B57VFR4F4tO5issnc/lY6nf9SpWy7mNOMlUkkvEjbRt5VHF045Or4A1H0nSZbFzmXTZuRc9fR5syIfkeZflXXt9R/8AZb9xqN9F4d430O+jvIILJ1K+Hcwm8CrPCTnlzybEdVOOvuO/e376ktlcNYQxyXzR8sEc8gSNXbbmkbB2Xrt1xjvkQLyMOM3TaaZNtJT4KVRNNEDjpUh/g2/8w/HT/wB09aT/AEE4s/mbL/5Y/wDpXR8J6JxRoV5OLi2tGsr1UW4aO5DSxPEGKOg5RkbkEZ757YN1fXFKpQlCMk2VNnb1adZSlF4O6pSlcudGKUpQClKUApSlAKUpQFBStXI17d395bRXb2sNnBbEmCOF5JZZ+dssZlYcoAGAB3O/lZ9M1G3u9URYZLxLa3spHJljhC/ROW5FIxzNjONh762qk39Mkd14rVcs48/n0N1iq1qjq0knObKze5SK3guZmMqQ8qzR+KqIGBy2Nz0G438smS/gjsfxgA7wmGOZFQeu4lC8igHbJyB1rFwkuhkq0Hl50MyqHFYCX1yJbSG6s/BkupZkjCzLKAscXilmIUfDFWLrUXl8azto5vSmu5LSMxyRxnlhjjnkk53BAGGA+qTv8x6qcm8B1oJZNttVa1EWqSiOC39Hkl1Dx5bSSKSSJPXgRZHleVRy8uCp2X2ug7Zkt08FlLdzQMHigaaSGJhIwKjJUMMA/GvHTktRGtCSyjKqmVzy5GcZx3x51q21Kc2hlMCrJcSR21ibW4huFmkmBCsshAQcu5OR279DYgu/Q/SxNbTPqXPZ2+Gkjd7hZi4gHjAKuB6+cqOhOCT62XCkYO4gmje0rVHVpE8WKSzYXqT29ukCyoySNcKzowmIAxgNnK9uhzvfs7ye5lv4ZoEgktJIYyqy+LzCSMSBuYKBjfb4Vi6cksmarQbST5v9/Bm7Urn9Rv8AUpYJpLJXgt47tbT0gGJndxcpAz+GdwoOR138sGsl9WmijmmNlJLaW8z2rzpJGJJJUfwCyQfqlth63vxis+DLCZr9ap7zT6df3z0NxStSNWl3laydbNbpbKSYzRl1m8UW7HwgMlQ3q5z2zjFZd3dtbC2SOEzT3U3gQRhhGpYI0jF3YHAABPQ/CsHCS5M2qtBrKZlUrURX8s91bxTRSQSJqFzaeHFMroxS0E+ZjyjIIOVA6bfCrceopbXOoNcoV54J7wrDdR3KotooDryDBVjnPv6dqy4MtDX6xDXPI3lUrAt764eeK3ubM27zwPcQkTJMGWMoHVioGGHMvn8dqszXV+mqTxW8DXAGnWsvhmZIo42M04JywPrNgDp26ivFTbeDJ1opJ+OP1G1qtapNVkuBbixs3naS0hvZBJKkAjSYsETJByxKt7tuu9eIdYnuuUWenyyEw+kkTSxwkQs7RoRnm3Yq2B7uu9OFLGceR56zTzjP2ZuKVYtbiO7t7a5jBEc8SSoGGGAYZwffV+tbWHhm9NSWUKUpQ9FKUoBSlKAUpSgNfNY3XpMt1Z3aQSTxRxTrNb+PG/hc3I6jnQhhkjrj3bV6jsGVr93nLveW8ELnw1XDRRNGXABxvnOKzqVnvyxg1cGGc/v7zNQulXUClLS/EQktLa2nMlsspJgi8ESxeuAGI8ww26eeVJp8D2A09WdIlhihjYYLp4XLyN62xIwD0rNpR1JPU8jQhHOFqax7DUZfAkkvoTdW0xkt5EtOWMK0ZjdJIzKSc5zkMMfvsyabcQRm7S5eS/imurxmW3V1mMsaxtCkBcbYVQv0nUdd63NKy4sv1IxdvB/7f7nxNQmlTgRXC3eL/wBImunlkgUxsZ41jaMwhxhQFUDD59Xqc77AR3Xo/IZ09J5MeMIcJz/reEWO3u5vnV+lYublqZwpRhp5s0y6K4Fw/pMaTyXFtdRm2tligjmg5hzmEu2S2SHPNvt0xmrg0qV5DcXF34lwbmynLRwiOMR2vPyRqhdj7TEksevyG1pWTrTfUwVtTXT7v96mh1ayk+mlQyMl1c6cLgLC0vgxWwc8/hxnnYEkZwQR17YN/RldFvkEKrCsyNFP6NLbNcsyDnZ452L5GwyTv8t9tSveK3DcZireKq8RGrOlTnmg9MAsGvPTGh8AeNnxvSTH43Pjl5t/qZxtmjaVO3PB6YPQJLw3jw+APGyZvSTGJuf6pbf6mcbZ8trSvOLIy9Xp9vu/p8PDQ1zaaGtJrUzN9JfNfc/IMgteemcmM/2c/OrGtxvLHYLyv4QvBLO6QyXHIFjflLRRESEZI3B2+BrcVTFeRqSTyezoRlBwXLP4NDY2XpCLlTBFa3V34LxW72z3S3Fv4TSlJmLhgWbcnflr2uhN4Rie5hCjT7iwhNvaJCwWdVQyS4c8zYA8h189t3iq1lx55ymYK1p4xJZ/f9GM1rzXVnc+IR6NBcQBOXZvGMRyTnty/fRbbF5Nec+TJawW3Jy7DwpJJObOe/Nj5Vk0rXvM38OOuPE1EWlXVqtv6HfLHIllFZStNbLKrrEzsjqodcMOY9yPdtWRZ6bHZMpSV2VbG1sgHA5voHlfxCw7nnOdv+2fSsnUk1hmuNCnF5SMaytfQ7S0tRIZBbwpFzlQpbl2zgVk0pWDeXlm6KUVhClKV4eilKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQH/2Q==" alt="Payment Icon">
                Payment with VNPAY
            </a>
        </div>

        <!--Js Plugins--> 

        <script>
            // Get the modal
            var modal = document.getElementById('login-form-modal');


            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";

                }
            }
        </script>   

        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("login-form");
                const error = document.getElementById("error-recaptcha");

                form.addEventListener("submit", function (event) {
                    
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        event.preventDefault();
                        error.innerHTML = "CAPTCHA verification failed.(missing-input) Please try again.";
                    }
                });
            }
        </script>
    </body>
</html>

