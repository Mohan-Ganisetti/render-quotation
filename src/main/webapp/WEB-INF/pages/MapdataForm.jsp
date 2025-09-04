<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Material Entry</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body {
        background-image: url('${pageContext.request.contextPath}/images/name.jpeg');
        background-size: 1500px 800px;      /* Make image cover entire screen */
        background-repeat: no-repeat;/* Prevent repeating */
        background-position: center; /* Center image */
        background-attachment: scroll;/* Keep image fixed when scrolling */
        font-family: Arial, sans-serif;
        
    }

    .custom-form-border {
        border: 2px solid #007bff;
        border-radius: 15px;
        padding: 40px;
        box-shadow: 0 0 10px #007bff88;
        max-width: 600px;
        margin: 250px auto 20px auto;
                
        background-color: rgba(128, 128, 0, 0.85); /* Olive with transparency */
    }

        /* On focus highlight for input fields */
        .form-control:focus {
            border-color: #28a745;       /* Green border on focus */
            box-shadow: 0 0 5px #28a745cc; /* Green glow */
            outline: none;
        }

        input[type="submit"] {
            border-color: red;
            width: 100px;
            height: 35px;
            background: yellow;
            border-width: 3px;
            border-radius: 10px;
            font-weight: bold;
        }

        h5, h6 {
            text-align: center;
        }
     
    </style>
</head>

<body>
 
<div class="custom-form-border">
<h3 id="text" class="text-center mt-3">Enter Material Data</h3>

    <form action="${pageContext.request.contextPath}/save" method="post" class="form">
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Enter Material Type</label>
            <input type="text" name="keyData" class="form-control" id="exampleFormControlInput1"
                   placeholder="Enter Material Type" required style="border-color: blue">
        </div>

        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Materials List (comma separated)</label>
            <input type="text" name="valueList" class="form-control" placeholder="Enter Materials" required
                   id="exampleFormControlTextarea1">
        </div>

        <input type="submit" value="Save Data">
    </form>
</div>

<br><br>

<a href="${pageContext.request.contextPath}/MaterialSelectionForm"
   style="
       display: inline-block;
       padding: 8px 15px;
       margin-left: 500px;
       margin-bottom: 20px;
       background-color: cyan;
       color: black;
       font-size: 16px;
       font-weight: bold;
       border: 2px solid #00cccc;
       border-radius: 8px;
       text-decoration: none;
       transition: background-color 0.3s ease;
   "
   onmouseover="this.style.backgroundColor='#00cccc';"
   onmouseout="this.style.backgroundColor='cyan';">
    Go To Select Items
</a>

<h5 style="color: green; margin-top: 40px;">Enter Materials Using These Types</h5>
<h6 style="color: pink;">Copper, Outlet, Airdrier, Compressors, Controlpanel, Bedheadpanel, Flowmeters,
    Vaccumjars, Vaccumtrale, Cutoffvalves, Gasalaram, Manifold, Regulator, Emergencyservicepoint, Boilsconvertionkit
</h6>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
