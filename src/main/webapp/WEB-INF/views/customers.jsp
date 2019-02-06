<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<section>
    <div class="jumbotron">
        <h1>Customers</h1>
        <p>All the available customers in our store</p>
    </div>
</section>

<section class="container">
    <div class="row">
        <c:forEach items="${customers}" var="customer">
            <div class="card-deck col-sm-6 col-md-4">
                <div class="card" style="padding-bottom: 15px; width: 18rem;">
                    <div class="card-body">
                        <h3 class="card-title"> ${customer.customerId} </h3>
                        <p class="card-text"> name: ${customer.name} </p>
                        <p class="card-text"> address: ${customer.address }</p>
                        <p class="card-text"> Number of orders made: ${customer.noOfOrdersMade} </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
</body>
</html>
