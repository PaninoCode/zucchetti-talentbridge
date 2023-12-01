<%@ page contentType="text/html;charset=UTF-8" session="false" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profilo Candidato | TalentBridge</title>
        <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary">

        <jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>


        <jsp:include page='../view-common/user_header.jsp'>
            <jsp:param name="activeLinkId" value="profilo" />
        </jsp:include>

        <section style="min-height: 100vh;">
            <div class="container-fluid p-4">
                <h1 class="mb-2">Profilo candidato</h1>
                <hr>

                <div class="row">

                    <div class="row mb-3">

                        <div class="col-5">
                            <h2 class="mb-3">Anagrafica</h2>
                            <div class="card mb-3" style="width: 100%;">
                                <div class="card-body">

                                    <div class="mb-5">
                                     
                                        <div class="text-center">
                                        
                                            <div class="d-flex justify-content-center align-items-center">
                                                <h1 class="rounded-circle bg-primary text-light d-flex justify-content-center align-items-center"
                                                    style="width: 140px; height: 140px;" id="anagrafica_propic">
                                        		  <img src="C:\\Users\\atacai\\Documents\\GitHub\\hrport\\src\main\\webapp\\WEB-INF\\view-admin\\daniel3.png" alt="Profile Picture" >
                                                </h1>
                                            </div>
                                            <p class="fs-3" id="anagrafica_full_name"></p>
                                        </div>
                                    </div>

                                  

                                    <form id="anagrafica_form">

                                        <div class="alert alert-info d-none" id="anagrafica_info_text" role="alert">

                                        </div>

                                        <div class="alert alert-success d-none" id="anagrafica_success_text"
                                            role="alert">

                                        </div>
                                        <div class="alert alert-danger d-none" id="anagrafica_error_text" role="alert">

                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_data_nascita" class="form-label">Data di
                                                        nascita</label>
                                                    <div class="form-control" id="anagrafica_data_nascita">test
                                                        </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_provincia_nascita"
                                                        class="form-label">Provincia
                                                        di nascita</label>
                                                    <div class="form-control"
                                                        id="anagrafica_provincia_nascita">test</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_numero_telefono" class="form-label">Numero di
                                                        telefono</label>
                                                        <div class="form-control"
                                                        id="anagrafica_numero_telefono">test</div>
                                                   
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_stato_origine" class="form-label">Stato di
                                                        origine</label>
                                                    <div  class="form-control"
                                                        id="anagrafica_stato_origine">test
                                                        </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_codice_fiscale" class="form-label">Codice
                                                        Fiscale</label>
                                                    <div  class="form-control"
                                                        id="anagrafica_codice_fiscale">test
                                                        </div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <p>Sesso</p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="anagrafica_sesso_M"
                                                        name="anagrafica_sesso" disabled required>
                                                    <label class="form-check-label" for="anagrafica_sesso_M">M</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="anagrafica_sesso_F"
                                                        name="anagrafica_sesso" disabled required>
                                                    <label class="form-check-label" for="anagrafica_sesso_F">F</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_domicilio" class="form-label">Indirizzo
                                                    Domicilio</label>
                                                 <div  class="form-control"
                                                        id="anagrafica_indirizzo_domicilio">test
                                                        </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_residenza" class="form-label">Indirizzo
                                                    Residenza</label>
                                                <div  class="form-control"
                                                        id="anagrafica_indirizzo_residenza">test
                                                        </div>
                                            </div>
                                        </div>

                                    </form>

                                  

                                    <hr>

                                    

                                </div>
                            </div>
                        </div>
                    <div class="col-7">
                            <h2 class="mb-3">Curriculum vitae</h2>
                            <div class="card mb-3 bg-white">
                                <div class="card-body p-0">
                                    <div class="position-relative bg-dark rounded-top-1 w-100"
                                        style="min-height: 200px;">
                                        <object data="<%=request.getContextPath()%>/pdfs/esempio_cv.pdf"
                                            type="application/pdf" class="rounded-top-1 shadow-sm w-100"
                                            style="height: 500px;">
                                            <div class="w-100 p-5" style="z-index: 1200;">
                                                <p class="text-light text-center">
                                                    Impossibile mostrare questa risorsa, puoi <a
                                                        href="<%=request.getContextPath()%>/pdfs/esempio_cv.pdf"
                                                        target="_blank">aprirla in un altra scheda</a>.
                                                </p>
                                            </div>
                                        </object>
                                        <div class="position-absolute bottom-0 end-0" style="z-index: 1600;">
                                            <div id="download_pdf_btn" class="bg-primary rounded shadow-sm p-2 m-2"
                                                style="cursor: pointer;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                    fill="#FFFFFF" class="bi bi-download" viewBox="0 0 16 16">
                                                    <path
                                                        d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5" />
                                                    <path
                                                        d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-4">
                                        <label for="curriculum_upload" class="form-label">Carica nuovo
                                            curriculum</label>
                                        <div class="row">
                                            <div class="col-10">
                                                <div class="mb-3">
                                                    <input type="file" class="form-control" id="curriculum_upload">
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <button type="button" class="btn btn-primary text-light w-100">
                                                    <h5 class="m-0">Carica</h5>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_aggiungi_categoria_modal" tabindex="-1"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Aggiungi Categoria</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_aggiungi_categoria_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_aggiungi_categoria_modal_nome"
                                                        class="form-label">Nome Categoria</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_aggiungi_categoria_modal_nome">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-3">
                                                    <p>
                                                        Aggiungi le skill per questa categoria.
                                                    </p>
                                                    <textarea type="text" class="form-control"
                                                        id="skills_aggiungi_categoria_modal_skills" rows="6"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_aggiungi_categoria_modal_aggiungi_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Aggiungi</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_aggiungi_skill_modal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Aggiungi Skill</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_aggiungi_skill_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_aggiungi_skill_modal_nome"
                                                        class="form-label">Nome Skill</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_aggiungi_skill_modal_nome">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_aggiungi_skill_modal_aggiungi_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Aggiungi</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_gestisci_skill_modal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Modifica Skill</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_gestisci_skill_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_gestisci_skill_modal_nome"
                                                        class="form-label">Nome Skill</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_gestisci_skill_modal_nome">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_gestisci_skill_modal_elimina_btn"
                                                class="btn btn-danger text-light">
                                                <h5 class="m-0">Elimina Categoria</h5>
                                            </button>
                                            <button type="button" id="skills_gestisci_skill_modal_salva_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Salva</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_gestisci_categoria_modal" tabindex="-1"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Modifica Categoria</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_gestisci_categoria_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_gestisci_categoria_modal_nome"
                                                        class="form-label">Nome Categoria</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_gestisci_categoria_modal_nome">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_gestisci_categoria_modal_elimina_btn"
                                                class="btn btn-danger text-light">
                                                <h5 class="m-0">Elimina Categoria</h5>
                                            </button>
                                            <button type="button" id="skills_gestisci_categoria_modal_salva_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Salva</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h2 class="mb-3">Skills</h2>
                            <div class="card mb-3" style="width: 100%;">
                                <div class="card-body">

                                    <div class="alert alert-info d-none" id="skills_info_text" role="alert">

                                    </div>

                                    <span id="template_skill_pill" class="d-none">
                                        <span
                                            class="badge rounded-pill text-bg-primary text-light p-2 m-2 d-flex justify-content-center align-items-center">
                                            <h5 class="m-0">{nome_skill}</h5>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                style="cursor: pointer;" fill="currentColor" class="bi bi-pencil m-1"
                                                viewBox="0 0 16 16" data-bs-toggle="modal"
                                                data-bs-target="#skills_gestisci_skill_modal" data-id-skill="{id_skill}"
                                                data-id-categoria="{id_categoria}" data-nome-skill="{nome_skill}">
                                                <path
                                                    d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                            </svg>
                                        </span>
                                    </span>

                                    <span id="template_cetegoria_skills" class="d-none">
                                        <div class="row">
                                            <div class="mb-2 mt-3">
                                                <div class="row">
                                                    <div class="col-11">
                                                        <h4>{nome_categoria}</h4>
                                                    </div>
                                                 
                                                </div>
                                                <hr>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="d-flex">
                                                {skills_pills}

                                               
                                            </div>
                                        </div>
                                    </span>

                                    <span id="skills_list">

                                    </span>

                                   

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="istruzione_aggiungi_modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5">Aggiungi Istruzione</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="esperienza_aggiungi_modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5">Aggiungi Esperienza</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <h2 class="mb-3">Istruzione</h2>
                    <div class="card bg-white">
                        <div class="card-body">

                            <span class="d-none" id="istruzione_accordion_example_item">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#istruzione_accordion_collapse_sampleId"
                                            aria-expanded="true" aria-controls="istruzione_accordion_collapse_sampleId">
                                            {titolo_di_studio}
                                        </button>
                                    </h2>
                                    <div id="istruzione_accordion_collapse_sampleId"
                                        class="accordion-collapse collapse collapsed"
                                        data-bs-parent="#istruzione_accordion">
                                        <div class="accordion-body">
                                            <h3>
                                                {nome_istituto}
                                            </h3>
                                            <h6>
                                                Da {data_inizio} a {data_fine}
                                            </h6><br>
                                            <h2><span class="badge bg-primary">{voto}</span></h2>

                                        </div>
                                    </div>
                                </div>
                            </span>

                            <div class="accordion mb-3" id="istruzione_accordion">
                            </div>

                            <div class="row">
                                <div class="col-10"></div>
                               
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <h2 class="mb-3">Esperienza</h2>
                    <div class="card bg-white">
                        <div class="card-body">

                            <span class="d-none" id="esperienza_accordion_example_item">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#esperienza_accordion_collapse_sampleId"
                                            aria-expanded="true" aria-controls="esperienza_accordion_collapse_sampleId">
                                            {nome_azienda}
                                        </button>
                                    </h2>
                                    <div id="esperienza_accordion_collapse_sampleId" class="accordion-collapse collapse"
                                        data-bs-parent="#esperienza_accordion">
                                        <div class="accordion-body">
                                            <h3>
                                                {posizione}
                                            </h3>
                                            <h6>
                                                Da {data_inizio} a {data_fine}
                                            </h6><br>
                                            <p>
                                                {funzione}
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </span>

                            <div class="accordion mb-3" id="esperienza_accordion">
                            </div>

                            <div class="row">
                                <div class="col-10"></div>
                              
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            </div>    
        </section>


        <jsp:include page='../view-common/footer.jsp'></jsp:include>

      
        <script type="text/javascript">
        	let dataUser = JSON.parse(`<%=request.getAttribute("dataUser")%>`);
        	
            let anagraficaWidgetProPic = document.querySelector('#anagrafica_propic');
            let anagraficaWidgetFullName = document.querySelector('#anagrafica_full_name');
            let dataNascita = document.getElementById("anagrafica_data_nascita");   
            
            let provinciaNascita = document.getElementById("anagrafica_provincia_nascita");
            let numeroTelefono = document.getElementById("anagrafica_numero_telefono");
            let statoOrigine = document.getElementById("anagrafica_stato_origine");
            let codice_fiscale = document.getElementById("anagrafica_codice_fiscale");
            let indDomicilio = document.getElementById("anagrafica_indirizzo_domicilio");
            let indResidenza = document.getElementById("anagrafica_indirizzo_residenza");
            
            

            console.log(dataUser);

            anagraficaWidgetFullName.innerHTML = dataUser.nome + " " + dataUser.cognome;
            anagraficaWidgetProPic.innerHTML = dataUser.nome[0] + dataUser.cognome[0];
            dataNascita.innerHTML = dataUser.profile.dNascita;
            
            provinciaNascita.innerHTML = "asdas";
            numeroTelefono.innerHTML = dataUser.profile.telefono;
            statoOrigine.innerHTML = dataUser.profile.statoOrigine;
            codice_fiscale.innerHTML = dataUser.profile.codiceFiscale;
            indDomicilio.innerHTML = dataUser.profile.inDomicilio;
            indResidenza.innerHTML = dataUser.profile.indResidenza;
            
            
            var radioM = document.getElementById("anagrafica_sesso_M");
            var radioF = document.getElementById("anagrafica_sesso_F");
           
            if(dataUser.profile.gender){
            	radioM.checked = true;
            }else{
				radioF.checked = true;            	
            }
            
            
            
        </script>
        
       
        <jsp:include page='scripts/profile_skills.jsp'></jsp:include>
        <jsp:include page='scripts/profile_istruzione.jsp'></jsp:include>
        <jsp:include page='scripts/profile_esperienza.jsp'></jsp:include>
        
        

     

    </body>

    </html>