<%@ page contentType="text/html;charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TalentBridge</title>
    <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">

</head>
<body class="bg-body-tertiary">
    <nav class="navbar navbar-expand-lg bg-white sticky-top" data-bs-theme="light">
        <div class="container-fluid">
            <a class="navbar-brand display-6" href="#">TalentBridge</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu border border-primary shadow-sm">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider border border-primary opacity-100">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </nav>


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
                        <a href="modifica_posizione.jsp?posId={position_id}" class="btn btn-primary text-light">
                            <h5 class="m-0 d-flex justify-content-center align-items-center">
                                Modifica
                                <span class="m-1"></span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-pencil-fill" viewBox="0 0 16 16">
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


    <div class="container-fluid bg-white shadow">
        <div class="container p-4">
            <footer class="py-3 my-4">
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
                </ul>
                <div class="d-flex flex-column justify-content-center align-items-center w-100 h-100">
                    <div class="mb-2">
                        <h1 class="text-primary m-0 display-4">TalentBridge</h1>
                        <div class="d-flex flex-row justify-content-center align-items-center">
                            <hr class="border border-primary border-2 opacity-100 w-100">
                            <h4 class="p-0 m-0">&nbsp;GRUPPO&nbsp;ZUCCHETTI&nbsp;</h4>
                            <hr class="border border-primary border-2 opacity-100 w-100">
                        </div>
                    </div>
                </div>
                <p class="text-center text-body-secondary">Â© 2023 TalentBridge</p>
            </footer>
        </div>
    </div>

    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>


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

                if(endAt > arrayPosizione.length) endAt = arrayPosizione.length;

                let check_posizioni_aperte = document.querySelector('#check_posizioni_aperte');
                let check_posizioni_chiuse = document.querySelector('#check_posizioni_chiuse');

                for (let i = startFrom; i < endAt; i++) {

                    if ((arrayPosizione[i].aperta && check_posizioni_aperte.checked) || (!arrayPosizione[i].aperta && check_posizioni_chiuse.checked)) {
                        let stautsPosizione = status_closed;

                        if (arrayPosizione[i].aperta) stautsPosizione = status_open;


                        posizioniAperte.innerHTML += template_posizione.innerHTML
                            .replace('{position_title}', arrayPosizione[i].nome)
                            .replace('{position_description}', arrayPosizione[i].descrizione)
                            .replace('{position_img}', "<%=request.getContextPath()%>/app/getImage?imgPath=/immagini_posizioni/az" + arrayPosizione[i].fotoUrl)
                            .replace('{position_status}', stautsPosizione)
                            .replace('{position_id}', arrayPosizione[i].idPos);
                    }
                }
            }

</script>
 

</body>
</html>