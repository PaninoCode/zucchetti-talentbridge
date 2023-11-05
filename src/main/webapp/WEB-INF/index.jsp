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
	
	let json = '<%=request.getAttribute("saluto")%>';
	
	console.log(json)

</script>
 
</body>
</html>