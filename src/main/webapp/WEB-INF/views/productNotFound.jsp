<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css" integrity="sha384-PDle/QlgIONtM1aqA2Qemk5gPOE7wFq8+Em+G/hmo5Iq0CCmYZLv3fVRDJ4MMwEA" crossorigin="anonymous">

        <title>Welcome</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <h1 class="alert alert-danger">There is no product found with the Product id ${invalidProductId}</h1>
            </div>
        </section>

        <section>
            <div class="container">
                <p>${url}</p>
                <p>${exception}</p>
            </div>
        </section>

        <section class="container">
            <div class="row">
                <p><a href="<spring:url value="/products" />" class="btn btn-primary"><span class="glyphicon-hand-left glyphicon"></span>products</a></p>
            </div>
        </section>
    </body>
</html>
