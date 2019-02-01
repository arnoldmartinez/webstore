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
                <h1>Products</h1>
                <p>All the available products in our store</p>
            </div>
        </section>

        <section class="container">
            <div class="row">
                <div class="card col-sm-6 col-md-3" style="width: 18rem;">
                    <div class="card-body">
                        <h3 class="card-title"> ${product.name} </h3>
                        <p class="card-text"> ${product.description} </p>
                        <p class="card-text"> ${product.unitPrice} USD</p>
                        <p class="card-text"> Available ${product.unitsInStock} units in stock </p>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
