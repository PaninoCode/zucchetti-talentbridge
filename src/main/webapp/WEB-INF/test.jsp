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
	
	let json = `<%=request.getAttribute("data")%>`;
	
	console.log(json)

</script>
 
</body>
</html>