<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TalentBridge</title>
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
                            .replace('{position_img}', "<%=request.getContextPath()%>/app/getImage?imgPath=/immagini_posizioni/" + arrayPosizione[i].fotoUrl)
                            .replace('{position_status}', stautsPosizione)
                            .replace('{position_id}', arrayPosizione[i].idPos);
                    }
                }
            }

        </script>


    </body>

    </html>