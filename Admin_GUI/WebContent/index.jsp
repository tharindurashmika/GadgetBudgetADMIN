<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.gadget_badget.fundingbodies.model.FundingBodyServlet"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
			<title>Admin Management - GadgetBadget</title>
	
		<link href="myStyle.css" rel="stylesheet" />
		<link rel="stylesheet" href="Views/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="Components/jquery-3.5.0.min.js"></script>
		<script src="Components/Orders.js"></script>

	</head>
	
	<body>
		<div class="container">
	
			<p class="font-weight-bold">
				<center>
					<h1><u><i><b>Admin Management - GadgetBadget</b></i></u></h1>
				</center>
			</p>
			<br><br>
			
			<fieldset>
	
				<legend><b>Add Funders Details</b></legend>
					<form id="ORDER" name="ORDER" class="border border-light p-5">
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Funder Name:</label>
						    <input type="text" id="Name" class="form-control" name="Name">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Field:</label>
						    <input type="text" id="Field" class="form-control" name="Field">						    
						</div>
						
						<div class="form-outline mb-4">
						    <label class="form-label" for="form6Example3" class="col-sm-2 col-form-label col-form-label-sm">Range:</label>
						    <input type="text" id="Range" class="form-control" name="Range">						    
						</div>
						
						 
												
						<br> 
						
						<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary btn-lg btn-block"> 
						<input type="hidden" id="hidOrderIDSave" name="hidOrderIDSave" value="">
					</form>
				
					<div id="alertSuccess" class="alert alert-success"></div>
					<div id="alertError" class="alert alert-danger"></div>			
			</fieldset>
			
			<br> 
			
			<div class="container" id="FunderGrid">
				<fieldset>
					<legend><b>View Funders Details</b></legend>
					<form method="post" action="index.jsp" class="table table-striped">
						<%
						    FundingBodyServlet viewFunds = new FundingBodyServlet();
							out.print(viewFunds.readFunds());
						%>
					</form>
					<br>
				</fieldset>
			</div>
		</div>
	</body>
</html>
