<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kotak Mahindra Bank</title>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>
        function toggleMenu() {
            var menu = document.getElementById("nav-menu");
            menu.classList.toggle("active");
        }
      </script>
        <style>
        body {
            font-family: Arial, sans-serif;
            background: url('/MobileVerification/resource/image/background-image.jpg') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .navbar {
            width: 100%;
            background: red;
            padding: 15px;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .navbar .logo {
            color: white;
            font-size: 22px;
            font-weight: bold;
            text-decoration: none;
            padding-left: 20px;
        }
        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }
        .navbar ul li {
            margin-right: 20px;
        }
        .navbar ul li a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 8px 15px;
            transition: background 0.3s;
            border-radius: 5px;
        }
        .navbar ul li a:hover {
            background: #0056b3;
        }
        .form-container {
            
            background: #fff;
            padding: 80px;
            width: 520px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }
        .input-field:focus {
            border-color: #007bff;
        }
        .validate-btn {
            width: 160px;
            padding: 10px;
            background: red;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .validate-btn:hover {
            background: #3333ff;
        }
        .checkbox-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 10px;
        }
        .checkbox-container input {
            width: 18px;
            height: 18px;
            margin-right: 10px;
        }
        .buttonsuccess {
            background: #33ff33;
        }
        .buttonfaiure {
            background: red;
        }
        .checkboxsuccess {
            background-color: #33ff33;
            border-color: #33ff33;
        }
        .checkboxfailure {
            background-color: red;
            border-color: red;
        }
        .message-container {
            margin-top: 15px;
            font-size: 16px;
            padding: 10px;
            text-align: center;
            display: none;
        }
        .message-container.success {
            color: #33ff33;
            background-color: #e6ffed;
        }
        .message-container.error {
            color: red;
            background-color: #ffe6e6;
        }
        @media (max-width: 768px) {
            .navbar {
                flex-direction: row; /* Keep the logo and toggle in a row */
                align-items: center;
                padding: 10px;
            }
            .navbar ul {
                display: none;
                flex-direction: column;
                width: 100%;
                background: red;
                position: absolute;
                top: 60px; /* Adjust based on navbar height */
                left: 0;
            }
            .navbar ul.active {
                display: flex;
            }
            .navbar ul li {
                width: 100%;
                text-align: center;
                margin: 5px 0;
            }
            .menu-toggle {
                display: block;
                cursor: pointer;
                font-size: 22px;
                color: white;
                padding: 10px;
                order: 2; /* Move toggle to the right */
            }
            .navbar .logo {
                order: 1; /* Keep logo on the left */
            }
        }
        @media (min-width: 769px) {
            .menu-toggle {
                display: none;
            }
        }
    </style>
    
     <script>
         
      function callservlet() {
    debugger;
    var mobileNumber = $("#mobileno").val().trim();

    var mobileRegex = /^[6-9]\d{9}$/;

    if (!mobileRegex.test(mobileNumber)) {
        alert("Please enter a valid 10-digit mobile number.");
        return;
    }

    var formattedMobile = "+91" + mobileNumber;

    $.ajax({
        url: "/WebApplication2/MobileVerifyServlet",
        type: "POST",
        data: { mobileNo: formattedMobile }, // Send with +91
        success: function(response) {
            $("#buttonclass").removeClass("buttonsuccess buttonfailure");
            $("#verifiedCheckbox").removeClass("checkboxsuccess checkboxfailure");
            $("#messageContainer").removeClass("success error").hide();
            
            var data = JSON.parse(response);

            if (data.phone_valid === true) {
                $("#messageContainer").addClass("success").text("Verification Successful!").show();
                $("#verifiedCheckbox").addClass("checkboxsuccess");
                $("#buttonclass").addClass("buttonsuccess");
                $("#verifiedCheckbox").prop("checked", true);
            } else {
                $("#messageContainer").addClass("error").text("Verification Failed!").show();
                $("#verifiedCheckbox").addClass("checkboxfailure");
                $("#buttonclass").addClass("buttonfailure");
                $("#verifiedCheckbox").prop("checked", false);
            }
        },
        error: function() {
            alert("Failure");
        }
    });
}


    </script>
    </head>
    <body>
       <div class="navbar">
        <img class="lazyloaded" src="/MobileVerification/resource/image/kotak-logo.png" alt="kmbl-logo-mob" title="kmbl-logo-mob" width="94" height="29">
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
        <ul id="nav-menu">
            <li><a href="/MobileVerification/MobileVerficationPage.jsp">Home</a></li>
            <li><a href="/MobileVerification/about.jsp">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    <form>
        <div class="form-container">
            <p1>Hi</p1>
            <h1>Enter Mobile Number</h1>
            <h1 id="messageContainer" class="message-container"></h1>
            <label>Mobile Number:</label>
            <input type="text" id="mobileno" class="input-field" name="mobileno" maxlength="13" required>
            <button type="button" id="buttonclass" onclick="callservlet()"class="validate-btn">Validate Mobile</button>
            <div class="checkbox-container">
                <input type="checkbox" id="verifiedCheckbox" disabled>
                <label for="verifiedCheckbox">Phone Verified</label>
            </div>
        </div>
    </form>
    </body>
</html>
