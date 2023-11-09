<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TalentBridge</title>
        <link href="resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary">
        <jsp:include page='account_edit_modal.jsp'></jsp:include>

        <jsp:include page='admin_header.jsp'>
            <jsp:param name="activeLinkId" value="posizioni" />
        </jsp:include>


        <span class="d-none" id="template_posizione">
            <div class="card" style="width: 450px;">
                <img src="{position_img}" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title">{position_title}</h5>
                    <p class="card-text">
                        {position_description}
                    </p>
                    <div class="d-flex justify-content-around align-items-center">
                        <h5 class="d-flex justify-content-center align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                <path
                                    d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                <path
                                    d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z" />
                            </svg>
                            <span class="m-1"></span>
                            {position_candidates}
                        </h5>

                        <div class="d-flex justify-content-center align-items-center">
                            {position_status}
                        </div>
                    </div>
                    <span class="m-2"></span>
                    <div class="d-flex justify-content-end align-items-center">
                        <a href="#" class="btn btn-primary">Modifica</a>
                    </div>
                </div>
            </div>
        </span>

        <section style="height: 100vh;">
            <div class="container-fluid p-4">
                <h1>Tutte le posizioni</h1>
                <hr>
                <span id="posizioni_aperte">

                </span>
            </div>
        </section>

        <jsp:include page='admin_footer.jsp'></jsp:include>


        <script>
            let mockPosizione = [
                {
                    "idPos": 1,
                    "nome": "Programmatore",
                    "aperta": true,
                    "fotoUrl": "https://picsum.photos/450/300"
                }
            ]

            let posizioniAperte = document.querySelector('#posizioni_aperte');
            let template_posizione = document.querySelector('#template_posizione');

            let status_open = '<span class="badge text-bg-success text-light">Aperta</span>';
            let status_closed = '<span class="badge text-bg-danger text-light">Chiusa</span>';

            mockPosizione.forEach(posizione => {

                let stautsPosizione = status_closed;

                if(posizione.aperta) stautsPosizione = status_open;

                posizioniAperte.innerHTML += template_posizione.innerHTML
                    .replace('{position_title}', posizione.nome)
                    .replace('{position_description}', "...")
                    .replace('{position_img}', posizione.fotoUrl)
                    .replace('{position_candidates}', 18)
                    .replace('{position_status}', stautsPosizione);
            });

        </script>
    </body>

    </html>