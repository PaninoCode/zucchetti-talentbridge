<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TalentBridge</title>
        <link href="/hrport/temp-admin/resources/css/custom/custom.css" rel="stylesheet">
        
        <link
            href="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.css"
            rel="stylesheet">
        <script type="text/javascript" src="/hrport/temp-admin/resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary">
        
        <jsp:include page='admin_header.jsp'>
            <jsp:param name="activeLinkId" value="candidati" />
        </jsp:include>

        <section style="height: 100vh;">
            <div class="container-fluid p-4">
                <h1>Candidati</h1>
                <hr>

                <div class="card bg-white">
                    <div class="card-body">
                        <table id="myTable" class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>Cognome</th>
                                    <th>Posizione</th>
                                    <th>Profilo</th>
                                </tr>
                            </thead>
                            <tbody id="profiles-data">
                                <!-- Lista di profili -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page='admin_footer.jsp'></jsp:include>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.js"></script>
        <script
            src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.js"></script>
        <script>
        
        
      
		
		let JSPcandidati = `<%=request.getAttribute("candidati")%>`;
		
	
		let candidati = JSON.parse(JSPcandidati);
		
		console.log(candidati);
		
        
    	var tableBody = document.getElementById("profiles-data");
    	
    	candidati.forEach(function(candidato){
    		var row = document.createElement("tr");
    		
    		var idCell = document.createElement("td");
    		idCell.textContent = candidato.idCand;
    		
    		var nomeCell = document.createElement("td");
    		nomeCell.textContent = candidato.nome;
    		
    		var cognomeCell = document.createElement("td");
    		cognomeCell.textContent = candidato.cognome;
    		
    		var posizioneCell = document.createElement("td");
    		posizioneCell.textContent = candidato.posizione;
    		
    		var linkCell = document.createElement("td");
    		var linkElement = document.createElement("a");
    		linkElement.textContent = "Profilo";
    		linkElement.href = "#";
    		
    		linkCell.appendChild(linkElement);
    		
    		row.appendChild(idCell);
    		row.appendChild(nomeCell);
    		row.appendChild(cognomeCell);
    		row.appendChild(posizioneCell);
    		row.appendChild(linkCell);
    		
    		tableBody.appendChild(row);
    		
    	});
    	
    	
      
        
            let table = new DataTable('#myTable', {
                dom: "PlftipB",
                buttons: [
                    {
                        extend: 'pdf',
                        text: 'Save current page',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }
                        }
                    }
                ]
            });
        </script>
    </body>
   

    </html>