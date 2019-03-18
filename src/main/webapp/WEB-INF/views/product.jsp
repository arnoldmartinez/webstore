<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Fonts -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- Bootstrap CSS -->

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <title>Products</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Products</h1>
                </div>
                <!--<p>All the available products in our store</p>-->
            </div>
        </section>

        <section class="container">
            <div class="row">
                <div class="col-md-5">
                    <img src="<c:url value="/resources/images/${product.productId}.png"></c:url>" alt="image" style="width:100%" />
                </div>
                <div class="col-md-5">
                    <h3>${product.name}</h3>
                    <p>${product.description}</p>
                    <p>
                        <strong>Item Code : </strong><span class="label label-warning">${product.productId}</span>
                    </p>
                    <p>
                        <strong>manufacturer</strong> : ${product.manufacturer}
                    </p>
                    <p>
                        <strong>category</strong> : ${product.category}
                    </p>
                    <p>
                        <strong>Availble units in stock </strong> :
                        ${product.unitsInStock}
                    </p>
                    <h4>${product.unitPrice} USD</h4>
                    <p>
                        <a href="<spring:url value="/products" />" class="btn btn-default">
                            <span class="glyphicon-hand-left glyphicon"></span> back
                        </a>
                        <a href="#" class="btn btn-warning btn-large"> <span
                                class="glyphicon-shopping-cart glyphicon"></span> Order Now
                        </a>
                    </p>
                </div>
            </div>
        </section>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
