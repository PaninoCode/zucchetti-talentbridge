<%@ page contentType="text/html;charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html>

<head>
    <title>Person DB</title>
</head>
 
<body>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
        </tr>
        <tbody id="table-body">
            <!-- Data will be inserted here -->
        </tbody>
    </table>

<script type="text/javascript">
	
	let jsonDataUser = `<%=request.getAttribute("first")%>`;
	let jsonDataPositions = `<%=request.getAttribute("second")%>`;
	// let data = `<%=request.getAttribute("data")%>`;
	// let jsonUserOK = JSON.parse(jsonDataUser);
	// let jsonPositionsOK = JSON.parse(jsonDataPositions);
	
	console.log(jsonDataUser);
	console.log(jsonDataPositions);
	
	console.log(data);

</script>
 
</body>
</html>