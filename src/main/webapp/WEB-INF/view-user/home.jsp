<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home | TalentBridge</title>
        <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>

    </head>

    <body class="bg-body-tertiary">

        <jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>


        <jsp:include page='../view-common/user_header.jsp'>
            <jsp:param name="activeLinkId" value="home" />
        </jsp:include>


        <span class="d-none" id="template_posizione">
            <div class="col m-1 mb-2" style="width: 450px;">
                <div class="card">
                    <img src="{position_img}" class="card-img-top" style="aspect-ratio: 5/4;">
                    <div class="card-body">
                        <h5 class="card-title">{position_title}</h5>
                        <p class="card-text">
                            {position_description}
                        </p>
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
                                {position_status}
                            </div>
                        </div>
                        <span class="m-2"></span>
                        <div class="d-flex justify-content-end align-items-center">
                            <a href="http://localhost:8080/hrport/user/posizione/{position_id}"
                                class="btn btn-primary text-light">
                                <h5 class="m-0 d-flex justify-content-center align-items-center">
                                    Dettagli
                                    <span class="m-1"></span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-info-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                                        <path
                                            d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
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
                <div class="d-flex justify-content-between align-items-center mb-4 p-2">
                    <label class="d-flex justify-content-center align-items-center">
                        Mostra&nbsp;
                        <select class="form-select" id="posizioni_results_number_select">
                            <option value="10" selected>10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        &nbsp;risultati&nbsp;per&nbsp;pagina.
                    </label>
                    <label>
                        Mostra solo posizioni:&nbsp;
                        <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">

                            <input type="checkbox" class="btn-check" id="check_posizioni_aperte" autocomplete="off"
                                checked>
                            <label class="btn btn-outline-success" for="check_posizioni_aperte">Aperte</label>

                            <input type="checkbox" class="btn-check" id="check_posizioni_chiuse" autocomplete="off"
                                checked>
                            <label class="btn btn-outline-danger" for="check_posizioni_chiuse">Chiuse</label>
                        </div>
                    </label>
                </div>
                <span id="posizioni_aperte" class="row row-cols-6">

                </span>
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

        <script type="text/javascript">

            let jsonDataUser = `<%=request.getAttribute("dataUser")%>`;
            let jsonDataPositions = `<%=request.getAttribute("dataAllPositions")%>`;
            let jsonUserOK = JSON.parse(jsonDataUser);
            // let jsonPositionsOK = JSON.parse(jsonDataPositions);

            let arrayPosizione = JSON.parse(jsonDataPositions);

            console.log(jsonUserOK);
            // console.log(jsonPositionsOK);


            let posizioniAperte = document.querySelector('#posizioni_aperte');
            let template_posizione = document.querySelector('#template_posizione');

            let posizioni_pagination = document.querySelector('#posizioni_pagination');

            let status_open = '<span class="badge text-bg-success text-light">Aperta</span>';
            let status_closed = '<span class="badge text-bg-danger text-light">Chiusa</span>';

            const posizoniResultsNumberSelect = document.querySelector('#posizioni_results_number_select');

            showResults(0, posizoniResultsNumberSelect.value);

            posizoniResultsNumberSelect.addEventListener('change', e => {
                showResults(0, posizoniResultsNumberSelect.value);
            });

            document.querySelector('#check_posizioni_aperte').addEventListener('change', e => {
                showResults(0, posizoniResultsNumberSelect.value);
            });

            document.querySelector('#check_posizioni_chiuse').addEventListener('change', e => {
                showResults(0, posizoniResultsNumberSelect.value);
            });

            function showResults(showPage, positionsPerPage) {

                let pagesNumber = Math.ceil(arrayPosizione.length / posizoniResultsNumberSelect.value);

                let prevPage = showPage - 1;
                let nextPage = showPage + 1;

                posizioni_pagination.innerHTML = '<li id="prev_page" class="page-item"><a class="page-link" onclick="showResults(' + prevPage + ', ' + posizoniResultsNumberSelect.value + ')" href="#">Precedente</a></li>';

                for (let i = 0; i < pagesNumber; i++) {
                    let isActive = '';
                    if (i == showPage) isActive = 'active';
                    posizioni_pagination.innerHTML += '<li class="page-item"><a class="page-link ' + isActive + '" onclick="showResults(' + i + ', ' + posizoniResultsNumberSelect.value + ')" href="#">' + (i + 1) + '</a></li>'
                }

                posizioni_pagination.innerHTML += '<li id="next_page" class="page-item"><a class="page-link" onclick="showResults(' + nextPage + ', ' + posizoniResultsNumberSelect.value + ')" href="#">Next</a></li>'

                if (prevPage < 0) document.querySelector('#prev_page').classList.add('disabled');
                if (nextPage > pagesNumber - 1) document.querySelector('#next_page').classList.add('disabled');

                posizioniAperte.innerHTML = "";

                let startFrom = positionsPerPage * showPage;
                let endAt = startFrom + positionsPerPage;

                if (endAt > arrayPosizione.length) endAt = arrayPosizione.length;

                let check_posizioni_aperte = document.querySelector('#check_posizioni_aperte');
                let check_posizioni_chiuse = document.querySelector('#check_posizioni_chiuse');

                for (let i = startFrom; i < endAt; i++) {

                    if ((arrayPosizione[i].aperta && check_posizioni_aperte.checked) || (!arrayPosizione[i].aperta && check_posizioni_chiuse.checked)) {
                        let stautsPosizione = status_closed;

                        if (arrayPosizione[i].aperta) stautsPosizione = status_open;


                        posizioniAperte.innerHTML += template_posizione.innerHTML
                            .replace('{position_title}', arrayPosizione[i].nome)
                            .replace('{position_description}', arrayPosizione[i].descrizione)
                            .replace('{position_img}', "http://localhost:8080/hrport/app/getAttachment/immagini_posizioni?imgPath=" + arrayPosizione[i].fotoUrl)
                            .replace('{position_status}', stautsPosizione)
                            .replace('{position_id}', arrayPosizione[i].idPos);
                    }
                }
            }

        </script>


    </body>

    </html>