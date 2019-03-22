<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

        <title>Customer</title>
    </head>
    <body>
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Customer</h1>
                    <p>Customer details</p>
                </div>
            </div>
        </section>
        <section class="container">
            <form:form modelAttribute="order.customer" class="formhorizontal">
                <fieldset>
                    <legend>Customer Details</legend>

                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="customerId" >Customer Id</label>
                        <div class="col-lg-10">
                            <form:input id="customerId" path="customerId" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="name">Name</label>
                        <div class="col-lg-10">
                            <form:input id="name" path="name" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2" for="doorNo">Door No</label>
                        <div class="col-lg-10">
                            <form:input id="doorNo" path="billingAddress.doorNo" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2" for="streetName">Street Name</label>
                        <div class="col-lg-10">
                            <form:input id="streetName" path="billingAddress.streetName." type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2" for="areaName">Area Name</label>
                        <div class="col-lg-10">
                            <form:input id="areaName" path="billingAddress.areaName" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2" for="state">State</label>
                        <div class="col-lg-10">
                            <form:input id="state" path="billingAddress.state" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2" for="country">country</label>
                        <div class="col-lg-10">
                            <form:input id="country" path="billingAddress.country" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2" for="zipCode">Zip Code</label>
                        <div class="col-lg-10">
                            <form:input id="zipCode" path="billingAddress.zipCode" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="name">Phone Number</label>
                        <div class="col-lg-10">
                            <form:input id="phoneNumber" path="phoneNumber" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-2 col-lg-2" for="name">No Of Orders Made</label>
                        <div class="col-lg-10">
                            <form:input id="noOfOrdersMade" path="noOfOrdersMade" type="text" class="form:input-large" />
                        </div>
                    </div>

                    <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />

                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <input type="submit" id="btnAdd" class="btn btn-primary" value="Add" name="_eventId_customerInfoCollected" />
                            <button id="btnCancel" class="btn btn-default" name="_eventId_cancel">Cancel</button>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </section>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
