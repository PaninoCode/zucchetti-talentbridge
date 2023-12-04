<%@ page contentType="text/html;charset=UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Posizioni | Amministrazione - TalentBridge</title>
<link href="/hrport/resources/css/custom/custom.css" rel="stylesheet">
<script type="text/javascript" src="/hrport/resources/js/bootstrap.bundle.min.js"></script>

</head>

<body class="bg-body-tertiary">
	<jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>

	<jsp:include page='../view-common/admin_header.jsp'>
		<jsp:param name="activeLinkId" value="posizioni" />
	</jsp:include>
	<div style="height: 5rem;"></div>

	<span class="d-none" id="template_posizione">
		<div class="col m-1 mb-2" style="width: 450px;">
			<div class="card">
				<div class="rounded shadow-sm mb-1 bg-dark" style="width: 100%; height: 220px; background-position: center center; background-size: cover; background-repeat: no-repeat; aspect-ratio: 5/4; background-image: [position_img];" id="position_propic">
				</div>
				<div class="card-body">
					<h5 class="card-title">{position_title}</h5>
					<p class="card-text">{position_description}</p>
					<div class="d-flex justify-content-end align-items-center">
						<!-- <h5 class="d-flex justify-content-center align-items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                    <path
                                        d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                    <path
                                        d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z" />
                                </svg>
                                <span class="m-1"></span>
                                {position_candidates}
                            </h5> -->

						<div class="d-flex justify-content-center align-items-center">
							{position_status}</div>
					</div>
					<span class="m-2"></span>
					<div id="positionLink" class="d-flex justify-content-end align-items-center">
						<a href="dettaglio-posizione/{position_id}"
							class="btn btn-primary text-light">
							<h5 class="m-0 d-flex justify-content-center align-items-center">
								Modifica <span class="m-1"></span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-pencil-fill"
									viewBox="0 0 16 16">
                                        <path
										d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
                                    </svg>
							</h5>
						</a>
					</div>
				</div>
			</div>
		</div>
	</span>

	<section style="min-height: 100vh;">
		<div class="container-fluid p-4">
			<h1 class="mb-2">Tutte le posizioni</h1>
			<hr>
			<div
				class="d-flex justify-content-between align-items-center mb-4 p-2">
				<label class="d-flex justify-content-center align-items-center">
					Mostra&nbsp; <select class="form-select"
					id="posizioni_results_number_select">
						<option value="10" selected>10</option>
						<option value="25">25</option>
						<option value="50">50</option>
						<option value="100">100</option>
				</select> &nbsp;risultati&nbsp;per&nbsp;pagina.
				</label> <label> Mostra solo posizioni:&nbsp;
					<div class="btn-group" role="group"
						aria-label="Basic checkbox toggle button group">

						<input type="checkbox" class="btn-check"
							id="check_posizioni_aperte" autocomplete="off" checked> <label
							class="btn btn-outline-success" for="check_posizioni_aperte">Aperte</label>

						<input type="checkbox" class="btn-check"
							id="check_posizioni_chiuse" autocomplete="off" checked> <label
							class="btn btn-outline-danger" for="check_posizioni_chiuse">Chiuse</label>
					</div>
				</label>
			</div>
			<span id="posizioni_aperte" class="row row-cols-6"> </span>
			<hr>
			<div class="d-flex justify-content-end align-items-center">
				<nav>
					<ul class="pagination" id="posizioni_pagination">
					</ul>
				</nav>
			</div>
		</div>
	</section>

	<jsp:include page='../view-common/footer.jsp'></jsp:include>


	<script>
        	
        	//Object from database
	        let JSPposizioni = `<%=request.getAttribute("data")%>`;
			//Object Json
	        let posizioni = JSON.parse(JSPposizioni);
			
	        
	        //Catch only the data needed
	       let jobPositions2 = [];
	        posizioni.forEach(function (posizione){
	        	
	        	let position = {
	        			idPos: posizione.idPos,        			
	        			nome: posizione.nome,
	        			descrizione: posizione.descrizione,
	        			fotoUrl: posizione.fotoUrl,
	        			aperta: posizione.aperta
	        	}
	        	
	        	jobPositions2.push(position);
	        	
	        	
	        });
	        
	        //position Link
	        var positionLink = document.getElementById("positionLink");
	       	        
	        //take checkbox open/close
	        let checkbox_aperte = document.getElementById("check_posizioni_aperte");
	        let checkbox_chiuse = document.getElementById("check_posizioni_chiuse");
	        
	        
	        //take the templates
	        let posizioniAperte = document.getElementById("posizioni_aperte");
	        let template_posizione = document.getElementById("template_posizione");
	        
	     	// Event Listener checkbox APERTE
	        checkbox_aperte.addEventListener("change", function () {
	            updatePositionsDisplay();
	        });

	        // Event Listener CHIUSE
	        checkbox_chiuse.addEventListener("change", function () {
	            updatePositionsDisplay();
	        });

	        // Initial check for both checkboxes
	        if (checkbox_aperte.checked && checkbox_chiuse.checked) {
	        	printAllPositions();
	        }

	        function updatePositionsDisplay() {
	            posizioniAperte.innerHTML = "";

	            if (checkbox_aperte.checked && checkbox_chiuse.checked) {
	            	printAllPositions(); // Display all positions
	            } else if (checkbox_aperte.checked) {
	                printPositions(true); // Display open positions
	            } else if (checkbox_chiuse.checked) {
	                printPositions(false); // Display closed positions
	            }
	            
	        }

	        function printPositions(state) {
	            jobPositions2.forEach((position) => {
	                if (position.aperta === state) {
	                	console.log(position.aperta);
						let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagini_posizioni?imgPath=" + position.fotoUrl;
	                    posizioniAperte.innerHTML += template_posizione.innerHTML
	                        .replace('{position_title}', position.nome)
	                        .replace('{position_description}', position.descrizione)
	                        .replace('[position_img]', "url('" + fotoUrl + "')")
	                        .replace('{position_status}', position.aperta)
	                        .replace('{position_id}', position.idPos);
	                    
	                    console.log(position.idPos);
	                    
	                    if (positionLink) {
	                        var linkElement = positionLink.querySelector('a');
	                        
	                        if (linkElement) {
	                        	linkElement.href = "dettaglio-posizione/" + position.idPos + "?input_stato=" + (position.aperta === true ? "aperta" : "chiusa");
	                        }
	                    }
	                }
	            });
	        }
	        
	        function printAllPositions() {
	            jobPositions2.forEach((position) => {
	            	
					//position Link
					if (positionLink) {
						var linkElement = positionLink.querySelector('a');
						
						if (linkElement) {
							linkElement.href = "dettaglio-posizione/" + position.idPos + "?input_stato=" + (position.aperta === true ? "aperta" : "chiusa");
						}
					}
	    	        	
	            	let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagini_posizioni?imgPath=" + position.fotoUrl;
	                posizioniAperte.innerHTML += template_posizione.innerHTML
	                    .replace('{position_title}', position.nome)
	                    .replace('{position_description}', position.descrizione)
	                    .replace('[position_img]', "url('" + fotoUrl + "')")
	                    .replace('{position_status}', position.aperta)
	                    .replace('{position_id}', position.idPos);
	                
	                console.log(position.idPos);
					             
	            });
	        }

	        
	      
        </script>
</body>

</html>