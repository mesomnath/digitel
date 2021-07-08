<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
</head>
<body>
	<h1>Add User:</h1>
	<form method="post" action="CreateUserServlet">
		<table>
			<!-- <tr>
				<td>UserID:</td>
				<td><input name="USER_ID" /></td>
			</tr>-->
			<tr>
				<td>Name:</td>
				<td><input name="name" /></td>
			</tr>
			<tr>
				<td>Telephone Number:</td>
				<td><input name="tel" /></td>
			</tr>
			<tr>
				<td>Status:</td>
				
				<td><input name="status" />
				<!-- <select name="STATUS">
					<option value="initial" name="STATUS1">Initial</option>
					<option value="ready" name="STATUS2">Ready to Provision</option>
					<option value="provisioned" name="STATUS3">Provisioned</option>
					<option value="active" name="STATUS4">Active</option>
					<option value="suspended" name="STATUS5">Suspended</option>
					<option value="deactivate" name="STATUS6">Deactivate</option>
				</select>-->

				</td>
			</tr>
			<tr>
				<td />
				<td><input type="submit" value="Add New User" /></td>
		</table>
	</form>
</body>
</html>