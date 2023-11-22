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
        
        <jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>

        <jsp:include page='../view-common/admin_header.jsp'>
            <jsp:param name="activeLinkId" value="posizioni" />
        </jsp:include>

        <section style="min-height: 100vh;">
            <div class="container-fluid p-4">
                <h1>Posizione</h1>
                <hr>

                <div class="modal fade" id="expanded_image" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Immagine posizione</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body bg-dark">
                                <img id="modal_expanded_image" class="w-100 h-100 rounded">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-5">
                        <h2 class="mb-3">Dati posizione</h2>
                        <div class="card" style="width: 100%;">
                            <style>
                                .foto-url-example {
                                    aspect-ratio: 5/4;
                                    height: 220px;
                                    background-position: center center;
                                    background-size: cover;
                                }
                            </style>
                            <div id="foto_url_example" class="card-img-top foto-url-example position-relative">
                                <div class="w-100 h-100 position-absolute bg-dark opacity-25"></div>
                                <div class="position-absolute bottom-0 end-0">
                                    <div id="expand_img_btn"
                                        class="bg-dark rounded shadow-sm border border-light-subtle p-2 m-2"
                                        style="cursor: pointer;" data-bs-toggle="modal"
                                        data-bs-target="#expanded_image">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#FFFFFF"
                                            class="bi bi-arrows-angle-expand" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <form class="card-body">
                                <div class="row mb-3">
                                    <label for="input_id_posizione" class="col-sm-3 col-form-label">ID Posizione</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="input_id_posizione" value="<%=request.getAttribute("idPosizione")%>" readonly disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="input_nome_posizione" class="col-sm-3 col-form-label">Nome</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="input_nome_posizione">
                                    </div>
                                </div>
                                <fieldset class="row mb-3">
                                    <legend class="col-form-label col-sm-3 pt-0">Stato</legend>
                                    <div class="col-sm-9">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="input_stato"
                                                id="input_stato_aperta" value="aperta">
                                            <label class="form-check-label" for="input_stato_aperta">
                                                Aperta
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="input_stato"
                                                id="input_stato_chiusa" value="chiusa">
                                            <label class="form-check-label" for="input_stato_chiusa">
                                                Chiusa
                                            </label>
                                        </div>
                                    </div>
                                </fieldset>
                                <hr>
                                <div class="row mb-3">
                                    <label for="input_id_foto_url" class="col-sm-3 col-form-label">URL Immagine</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="input_id_foto_url">
                                    </div>
                                </div>
                                <div class="row mb-3 d-flex justify-content-end p-2">
                                </div>
                                <script>
                                    let inputFotoUrl = document.querySelector('#input_id_foto_url');
                                    let fotoUrlExample = document.querySelector('#foto_url_example');
                                    let modalFotoUrlExample = document.querySelector('#modal_expanded_image');
                                    inputFotoUrl.addEventListener('keyup', loadExamplePic);
                                    loadExamplePic();

                                    function loadExamplePic() {
                                        fotoUrlExample.style.backgroundImage = "url('<%=request.getContextPath()%>/app/getImage?imgPath=" + inputFotoUrl.value + "')";
                                        modalFotoUrlExample.src = "<%=request.getContextPath()%>/app/getImage?imgPath=" + inputFotoUrl.value;
                                    }
                                </script>
                                <hr>
                                <div class="row mb-3">
                                    <label for="input_descrizione" class="col-sm-3 col-form-label">Descrizione</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" id="input_descrizione"
                                            style="height: 400px;"></textarea>
                                    </div>
                                </div>
                                <hr class="mb-4">
                                <div class="d-flex flex-row justify-content-between align-items-center p-2 mb-4">
                                    <a href="#" class="m-0 link-danger">Elimina posizione</a>
                                    <button type="submit" class="btn btn-primary text-light">
                                        <h5 class="m-0">Salva</h5>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-7">
                        <h2 class="mb-3">Candidati Posizione</h2>
                        <div class="card bg-white">
                            <div class="card-body">
                                <table id="myTable" class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>Cognome</th>
                                            <th>Punteggio</th>
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
                </div>

            </div>
        </section>
        <jsp:include page='../view-common/footer.jsp'></jsp:include>
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
                ],
                "oLanguage": {
                    "sLengthMenu": "Mostra _MENU_ risultati per pagina",
                    "sZeroRecords": "Nessun candidato trovato per questa posizione",
                    "sInfo": "Mostrando i record da _START_ a _END_. Totale: _TOTAL_",
                    "sInfoEmpty": "Nessun record da mostrare",
                    "sInfoFiltered": "(filtrati tra _MAX_ record)"
                }
            });
        </script>
    </body>

    </html>