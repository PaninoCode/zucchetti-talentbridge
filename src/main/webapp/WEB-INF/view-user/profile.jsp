<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profilo | TalentBridge</title>
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
                <h1 class="mb-2">Profilo personale</h1>
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
                                                </h1>
                                            </div>
                                            <p class="fs-3" id="anagrafica_full_name"></p>
                                        </div>
                                    </div>

                                    <p class="text-end">
                                        <a href="#" id="anagrafica_abilita_modifica">Abilita Modifica</a>
                                    </p>

                                    <form id="anagrafica_form">

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_data_nascita" class="form-label">Data di
                                                        nascita</label>
                                                    <input type="date" class="form-control" id="anagrafica_data_nascita"
                                                        disabled required>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_provincia_nascita"
                                                        class="form-label">Provincia
                                                        di nascita</label>
                                                    <input type="text" class="form-control"
                                                        id="anagrafica_provincia_nascita" autocomplete="off"
                                                        list="lista_province" disabled required>
                                                    <datalist id="lista_province">
                                                        <option value="Agrigento">
                                                        <option value="Alessandria">
                                                        <option value="Ancona">
                                                        <option value="Aosta">
                                                        <option value="Arezzo">
                                                        <option value="Ascoli Piceno">
                                                        <option value="Asti">
                                                        <option value="Avellino">
                                                        <option value="Bari">
                                                        <option value="Barletta - Andria - Trani">
                                                        <option value="Belluno">
                                                        <option value="Benevento">
                                                        <option value="Bergamo">
                                                        <option value="Biella">
                                                        <option value="Bologna">
                                                        <option value="Bolzano">
                                                        <option value="Brescia">
                                                        <option value="Brindisi">
                                                        <option value="Cagliari">
                                                        <option value="Caltanissetta">
                                                        <option value="Campobasso">
                                                        <option value="Carbonia - Iglesias">
                                                        <option value="Caserta">
                                                        <option value="Catania">
                                                        <option value="Catanzaro">
                                                        <option value="Chieti">
                                                        <option value="Como">
                                                        <option value="Cosenza">
                                                        <option value="Cremona">
                                                        <option value="Crotone">
                                                        <option value="Cuneo">
                                                        <option value="Enna">
                                                        <option value="Fermo">
                                                        <option value="Ferrara">
                                                        <option value="Firenze">
                                                        <option value="Foggia">
                                                        <option value="Forlì - Cesena">
                                                        <option value="Frosinone">
                                                        <option value="Genova">
                                                        <option value="Gorizia">
                                                        <option value="Grosseto">
                                                        <option value="Imperia">
                                                        <option value="Isernia">
                                                        <option value=" Spezia">
                                                        <option value="L'Aquila">
                                                        <option value="Latina">
                                                        <option value="Lecce">
                                                        <option value="Lecco">
                                                        <option value="Livorno">
                                                        <option value="Lodi">
                                                        <option value="Lucca">
                                                        <option value="Macerata">
                                                        <option value="Mantova">
                                                        <option value="Massa - Carrara">
                                                        <option value="Matera">
                                                        <option value="Messina">
                                                        <option value="Milano">
                                                        <option value="Modena">
                                                        <option value="Monza e della Brianza">
                                                        <option value="Napoli">
                                                        <option value="Novara">
                                                        <option value="Nuoro">
                                                        <option value="Olbia - Tempio">
                                                        <option value="Oristano">
                                                        <option value="Padova">
                                                        <option value="Palermo">
                                                        <option value="Parma">
                                                        <option value="Pavia">
                                                        <option value="Perugia">
                                                        <option value="Pesaro e Urbino">
                                                        <option value="Pescara">
                                                        <option value="Piacenza">
                                                        <option value="Pisa">
                                                        <option value="Pistoia">
                                                        <option value="Pordenone">
                                                        <option value="Potenza">
                                                        <option value="Prato">
                                                        <option value="Ragusa">
                                                        <option value="Ravenna">
                                                        <option value="Reggio Calabria">
                                                        <option value="Reggio Emilia">
                                                        <option value="Rieti">
                                                        <option value="Rimini">
                                                        <option value="Roma">
                                                        <option value="Rovigo">
                                                        <option value="Salerno">
                                                        <option value="Medio Campidano">
                                                        <option value="Sassari">
                                                        <option value="Savona">
                                                        <option value="Siena">
                                                        <option value="Siracusa">
                                                        <option value="Sondrio">
                                                        <option value="Taranto">
                                                        <option value="Teramo">
                                                        <option value="Terni">
                                                        <option value="Torino">
                                                        <option value="Ogliastra">
                                                        <option value="Trapani">
                                                        <option value="Trento">
                                                        <option value="Treviso">
                                                        <option value="Trieste">
                                                        <option value="Udine">
                                                        <option value="Varese">
                                                        <option value="Venezia">
                                                        <option value="Verbano - Cusio - Ossola">
                                                        <option value="Vercelli">
                                                        <option value="Verona">
                                                        <option value="Vibo Valentia">
                                                        <option value="Vicenza">
                                                        <option value="Viterbo">
                                                    </datalist>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_numero_telefono" class="form-label">Numero di
                                                        telefono</label>
                                                    <input type="tel" class="form-control"
                                                        id="anagrafica_numero_telefono" disabled required>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_stato_origine" class="form-label">Stato di origine</label>
                                                    <input type="tel" class="form-control" id="anagrafica_stato_origine"
                                                        disabled  required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_codice_fiscale" class="form-label">Codice
                                                        Fiscale</label>
                                                    <input type="text" class="form-control"
                                                        id="anagrafica_codice_fiscale" disabled required>
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
                                                <input type="text" class="form-control"
                                                    id="anagrafica_indirizzo_domicilio" disabled required>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_residenza" class="form-label">Indirizzo
                                                    Residenza</label>
                                                <input type="text" class="form-control"
                                                    id="anagrafica_indirizzo_residenza" disabled required>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="row mt-3 d-flex d-flex flex-row-reverse">
                                        <div class="col-2">
                                            <button type="button" id="anagrafica_salva_btn"
                                                class="btn btn-primary text-light w-100" disabled>
                                                <h5 class="m-0">Salva</h5>
                                            </button>
                                        </div>
                                    </div>

                                    <hr>

                                    <label for="anagrafica_foto_upload" class="form-label">Carica foto personale</label>
                                    <div class="row">
                                        <div class="col-10">
                                            <div class="mb-3">
                                                <input type="file" class="form-control" id="anagrafica_foto_upload">
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

                            <h2 class="mb-3">Skills</h2>
                            <div class="card mb-3" style="width: 100%;">
                                <div class="card-body">
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
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary text-light w-100"
                                        data-bs-toggle="modal" data-bs-target="#istruzione_aggiungi_modal">
                                        <h5 class="m-0">Aggiungi</h5>
                                    </button>
                                </div>
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
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary text-light w-100"
                                        data-bs-toggle="modal" data-bs-target="#esperienza_aggiungi_modal">
                                        <h5 class="m-0">Aggiungi</h5>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            </div>
        </section>


        <jsp:include page='../view-common/footer.jsp'></jsp:include>

        <script type="text/javascript">
            let anagraficaWidgetProPic = document.querySelector('#anagrafica_propic');
            let anagraficaWidgetFullName = document.querySelector('#anagrafica_full_name');

            let dataUser = JSON.parse(`<%=request.getAttribute("dataUser")%>`);

            console.log(dataUser);

            anagraficaWidgetFullName.innerHTML = dataUser.nome + " " + dataUser.cognome;
            anagraficaWidgetProPic.innerHTML = dataUser.nome[0] + dataUser.cognome[0];
        </script>

        <script type="text/javascript">
            <jsp:include page='scripts/profile_anagrafica.js'></jsp:include>
            <jsp:include page='scripts/profile_istruzione.js'></jsp:include>
            <jsp:include page='scripts/profile_esperienza.js'></jsp:include>
        </script>

    </body>

    </html>