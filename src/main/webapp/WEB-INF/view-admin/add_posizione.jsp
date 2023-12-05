<%@ page contentType="text/html;charset=UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TalentBridge</title>
<link href="/hrport/resources/css/custom/custom.css" rel="stylesheet">
<link
	href="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.css"
	rel="stylesheet">

	<script type="text/javascript" src="/hrport/resources/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-body-tertiary">

	<jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>

	<jsp:include page='../view-common/admin_header.jsp'>
		<jsp:param name="activeLinkId" value="posizioni" />
	</jsp:include>

	<section style="min-height: 100vh;">
		<div class="container-fluid p-4">
			<h1>Posizione</h1>
			<hr>

			<div class="modal fade" id="expanded_image" tabindex="-1"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content border border-2 border-primary">
						<div class="modal-header bg-body-tertiary">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Immagine
								posizione</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body bg-dark">
							<img id="modal_expanded_image" class="w-100 h-100 rounded">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Chiudi</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-5" style=" justify-content: center">
					<h2 class="mb-3">Dati posizione</h2>
					<div class="card" style="width: 800px;" >
						
						<div id="foto_url_example"
							class="card-img-top foto-url-example position-relative">
							<div class="w-100 h-100 position-absolute bg-dark opacity-25"></div>
							<div class="position-absolute bottom-0 end-0">
							</div>
						</div>
						<form id="insertForm" class="card-body">
							
							<div class="row mb-3" style="align-items: center;">
								<label for="input_nome_posizione"
									class="col-sm-3 col-form-label">Nome</label>
								<div class="col-sm-9">
									<input type="text" class="form-control"
										id="input_nome_posizione">
								</div>
							</div>
							
							<hr>
							
						
                                    
							<div class="row mb-3">
								<label id="posizione_foto_upload" for="input_id_foto_url" class="col-sm-3 col-form-label">URL
									Immagine</label>
								<div class="col-sm-9">
									 <input type="file" class="form-control" id="foto_upload" name="file">
								</div>
							</div>
							
							<div class="row mb-3 d-flex justify-content-end p-2"></div>
							<div class="row mb-3">
							
							
								<label for="positionSelect" class="col-sm-3 col-form-label">
									Seleziona quiz</label>
								<div class="col-sm-9">
									<select id="quizSelect" ></select>
									
								</div>
							</div>
							
							<div class="row mb-3 d-flex justify-content-end p-2"></div>
							
							<hr>
							<div class="row mb-3">
								<label for="input_descrizione" class="col-sm-3 col-form-label">Descrizione</label>
								<div class="col-sm-9">
									<textarea class="form-control" id="input_descrizione"
										style="height: 100px;"></textarea>
								</div>
							</div>
							<hr class="mb-4">
							<div
								class="d-flex flex-row justify-content-between align-items-center p-2 mb-4">
								
								
								<button type="submit" id="updatePositionBtn"
									class="btn btn-primary text-light" onclick="addPosizione()">
									<h5 class="m-0">Salva</h5>
								</button>
							</div>
						</form>
					</div>
				</div>
				
			</div>
			
			

		</div>
	</section>
	<jsp:include page='../view-common/footer.jsp'></jsp:include>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
	<script
		src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.js"></script>
	<script
		src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.js"></script>
		
		
	<script>
	/*
			let JSPquiz = `<%=request.getAttribute("data")%>`;
			let jsonQuiz = JSON.parse(JSPquiz);
			
			
			 // Get the select element
			var selectBoxQuiz = document.getElementById("quizSelect");
			
			// Populate the select box with options
		    jsonQuiz.forEach(function(position) {
		        var option = document.createElement("option");
		        option.value = position.id;
		        option.text = position.nome;
		        selectBoxQuiz.add(option);
		    });
			
		    console.log(selectBoxQuiz.value);
			console.log(jsonQuiz);
			*/
	/*
			function addPosizione() {
	            
	            let form = document.getElementById('insertForm');
	            
	            let nomePosizione = form.querySelector('#input_nome_posizione').value;
	            let stato = true;
	            let idFotoUrl = form.querySelector('#input_id_foto_url').value;
	            let descrizione = form.querySelector('#input_descrizione').value;
	            
				
	            let positionData = {
	            		
	            		nome: nomePosizione,
	            		aperta: stato,
	            		fotoUrl: idFotoUrl,
	            		descrizione: descrizione
	            		
	            }
			}*/
	             /*        
	            //Insert posizione
	            fetch('http://localhost:8080/hrport/admin/insert-new-position', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json',
	                },
	                body: JSON.stringify(positionData),
	            })
	            .then(response => response.json())
	            .then(data => {
	            	 alert("Position Inserted");
	            	 window.location.href = "http://localhost:8080/hrport/admin/posizioni";
	            })
	            .catch(error => {
	            	alert("error" + error);
	                console.error('Error:', error);
	            });
	            window.location.href = "http://localhost:8080/hrport/admin/posizioni";
	        }
	
	
            let table = new DataTable('#myTable', {
                dom: "PlftipB",
                buttons: [
                    {
                        extend: 'pdf',
                        text: 'Save current page',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }catt
                        }
                    }
                ],
                "oLanguage": {
                    "sLengthMenu": "Mostra _MENU_ risultati per pagina",
                    "sZeroRecords": "Nessun candidato trovato per questa posizione",
                    "sInfo": "Mostrando i record da _START_ a _END_. Totale: _TOTAL_",
                    "sInfoEmpty": "Nessun record da mostrare",
                    "sInfoFiltered": "(filtrati tra _MAX_ record)"
                }
            });
            */
        </script>
   			<jsp:include page='scripts/posizione_image.jsp'></jsp:include> 
</body>


</html>