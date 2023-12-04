<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dattaglio Posizione | TalentBridge</title>
        <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>

    </head>

    <body class="bg-body-tertiary">

        <jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>


        <jsp:include page='../view-common/user_header.jsp'>
            <jsp:param name="activeLinkId" value="home" />
        </jsp:include>

        <div class="modal fade quiz-end-modal" id="quiz_failed_modal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border border-2 border-danger">
                    <div class="modal-header bg-danger-subtle">
                        <h1 class="modal-title fs-5 d-flex flex-row justify-content-start align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-exclamation-square-fill" viewBox="0 0 16 16">
                                <path
                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                            </svg>
                            <span class="m-2"></span>
                            Quiz Terminato
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            <b>Hai abbandonato il quiz.</b><br>

                            Le risposte che hai inserito fin ora sono state inviate.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-danger text-dark" data-bs-dismiss="modal">
                            <h5 class="m-0">Chiudi</h5>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade quiz-end-modal" id="quiz_time_over_modal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border border-2 border-danger">
                    <div class="modal-header bg-danger-subtle">
                        <h1 class="modal-title fs-5 d-flex flex-row justify-content-start align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-exclamation-square-fill" viewBox="0 0 16 16">
                                <path
                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                            </svg>
                            <span class="m-2"></span>
                            Tempo scaduto
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            <b>Il tempo a tua disposizione &egrave; terminato.</b><br>

                            Le risposte che hai inserito fin ora sono state inviate.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-danger text-dark" data-bs-dismiss="modal">
                            <h5 class="m-0">Chiudi</h5>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade quiz-end-modal" id="quiz_user_submitted_modal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border border-2 border-success">
                    <div class="modal-header bg-success-subtle">
                        <h1 class="modal-title fs-5 d-flex flex-row justify-content-start align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-exclamation-square-fill" viewBox="0 0 16 16">
                                <path
                                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                            </svg>
                            <span class="m-2"></span>
                            Quiz Completato
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            <b>Quiz completato!</b><br>

                            Le tue risposte sono state inviate al server.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success text-dark" data-bs-dismiss="modal">
                            <h5 class="m-0">Chiudi</h5>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="quiz_results_modal" tabindex="-1">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content border border-2 border-primary">
                    <div class="modal-header bg-primary-subtle">
                        <h1 class="modal-title fs-5 d-flex flex-row justify-content-start align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-clipboard-check-fill" viewBox="0 0 16 16">
                                <path
                                    d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z" />
                                <path
                                    d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zm6.854 7.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708Z" />
                            </svg>
                            <span class="m-2"></span>
                            Risultati Quiz
                        </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h3 id="quiz_results_modal_nome_quiz">{nome_quiz}</h3>
                        <p>Scheda Risultato:</p>
                        <div class="card mb-2">
                            <div class="card-body overflow-scroll p-4" style="height: 550px;">
                                <span id="quiz_results_modal_results_table" class="">
                                </span>
                            </div>
                        </div>
                        <br>
                        <h4 class="text-end">
                            Punteggio finale: <span id="quiz_results_modal_somma_punti"></span>/<span id="quiz_results_modal_punti_totali"></span>
                        </h4>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary text-light" data-bs-dismiss="modal">
                            <h5 class="m-0">Chiudi</h5>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <section style="min-height: 100vh;">
            <div class="container-fluid p-4">
                <div class="row d-flex justify-content-center">
                    <div class="col-10">
                        <div class="rounded shadow-sm" id="dettaglio_foto_posizione"
                            style="height: 250px; background-position: center center; background-size: cover; background-repeat: no-repeat;">
                            <div class="w-100 h-100 d-flex justify-content-center rounded align-items-center bg-dark"
                                style="--bs-bg-opacity: .5;">
                                <h1 class="mb-2 text-light" id="dettaglio_nome_posizione">...</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-6">
                        <h2>
                            Dettaglio Posizione
                        </h2>
                        <div class="card mb-3" style="width: 100%;">
                            <div class="card-body">
                                <p id="dettaglio_posizione_descrizione">

                                </p>
                                <br>
                                <div class="row d-flex justify-content-center">
                                    <div class="col-6">
                                        <button type="button" class="w-100 btn btn-primary text-light"
                                            data-quiz-id="{id_quiz}">
                                            <h5 class="m-0 d-flex justify-content-center align-items-center">
                                                Invia Candidatura
                                                <span class="m-1"></span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-check2-square" viewBox="0 0 16 16">
                                                    <path
                                                        d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5z" />
                                                    <path
                                                        d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0" />
                                                </svg>
                                            </h5>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <h2>
                            Skill richieste
                        </h2>


                        <span id="button_svolgi_quiz" style="display: none;">
                            <!-- <button type="button" class="btn btn-primary text-light btn-quiz-open" data-quiz-id="{id_quiz}" data-quiz-nome="{nome_quiz}">
                                <h6 class="m-0 d-flex justify-content-center align-items-center">
                                    Svolgi quiz
                                    <span class="m-1"></span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-patch-question-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M5.933.87a2.89 2.89 0 0 1 4.134 0l.622.638.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636zM7.002 11a1 1 0 1 0 2 0 1 1 0 0 0-2 0zm1.602-2.027c.04-.534.198-.815.846-1.26.674-.475 1.05-1.09 1.05-1.986 0-1.325-.92-2.227-2.262-2.227-1.02 0-1.792.492-2.1 1.29A1.71 1.71 0 0 0 6 5.48c0 .393.203.64.545.64.272 0 .455-.147.564-.51.158-.592.525-.915 1.074-.915.61 0 1.03.446 1.03 1.084 0 .563-.208.885-.822 1.325-.619.433-.926.914-.926 1.64v.111c0 .428.208.745.585.745.336 0 .504-.24.554-.627z" />
                                    </svg>
                                </h6>
                            </button> -->
                        </span>
                        <span id="button_vedi_risultati" style="display: none;">
                            <!-- <button type="button" class="btn btn-primary text-light btn-results-open" data-quiz-id="{id_quiz}" data-quiz-nome="{nome_quiz}">
                                <h6 class="m-0 d-flex justify-content-center align-items-center">
                                    Vedi risultati
                                    <span class="m-1"></span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-flag-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001" />
                                    </svg>
                                </h6>
                            </button> -->
                        </span>

                        <span id="template_quiz" style="display: none;">
                            <!-- <a class="list-group-item" aria-current="true">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1 mt-1">{nome_quiz}</h5>
                                    <small>15 Minuti</small>
                                </div>
                                <p class="mb-2">
                                    {badge_quiz}
                                </p>
                                {controlli_quiz}
                            </a> -->
                        </span>

                        <div class="card mb-3" style="width: 100%;">
                            <div class="card-body">
                                <div class="list-group" id="lista_quiz">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page='../view-common/footer.jsp'></jsp:include>

        <jsp:include page='scripts/quiz_logic.jsp'></jsp:include>

        <script type="text/javascript">

            let dataPos = JSON.parse(`<%=request.getAttribute("dataPos")%>`);
            let dataQuiz = JSON.parse(`<%=request.getAttribute("dataQuiz")%>`);

            console.log(dataPos);
            console.log(dataQuiz);

            let dettaglioFotoPosizone = document.querySelector('#dettaglio_foto_posizione');
            let dettaglioNomePosizione = document.querySelector('#dettaglio_nome_posizione');
            let dettaglioPosizoneDescrizione = document.querySelector('#dettaglio_posizione_descrizione');

            dettaglioFotoPosizone.style.backgroundImage = "url('http://localhost:8080/hrport/app/getAttachment/immagini_posizioni?imgPath=" + dataPos.fotoUrl + "')";
            dettaglioNomePosizione.innerHTML = dataPos.nome;
            dettaglioPosizoneDescrizione.innerHTML = dataPos.descrizione;

            let listaQuiz = document.querySelector('#lista_quiz');
            let templateQuiz = document.querySelector('#template_quiz');

            let btnQuizSvolgi = document.querySelector('#button_svolgi_quiz');
            let btnQuizVediRisultati = document.querySelector('#button_vedi_risultati');

            let quizBadgeFatto = '<span class="badge bg-secondary bg-info">Fatto</span>';
            let quizBadgeDaFare = '<span class="badge bg-secondary bg-warning">Da Fare</span>';

            let idQuizMostrati = [];
            dataQuiz.forEach(quiz => {
                if (idQuizMostrati.includes(quiz.id)) {
                    idQuizMostrati.push(null);
                } else {
                    listaQuiz.innerHTML += templateQuiz.innerHTML
                        .replaceAll('<!--', '')
                        .replaceAll('-->', '')
                        .replaceAll('{nome_quiz}', quiz.nome)
                        .replaceAll('{badge_quiz}', getQuizBadge(quiz.isDone))
                        .replaceAll('{controlli_quiz}', getControlliQuiz(quiz.isDone, quiz.id, quiz.nome));
                    idQuizMostrati.push(quiz.id);
                }
                console.log(idQuizMostrati.length);
                if (idQuizMostrati.length == dataQuiz.length) {
                    initQuizButtons();
                    initResultsButtons();
                }
            });

            function getQuizBadge(fatto) {
                if (fatto) return quizBadgeFatto;
                return quizBadgeDaFare;
            }

            function getControlliQuiz(fatto, quizId, quizName) {
                if (fatto) return btnQuizVediRisultati.innerHTML.replaceAll('<!--', '').replaceAll('-->', '').replaceAll('{id_quiz}', quizId).replaceAll('{nome_quiz}', quizName);
                return btnQuizSvolgi.innerHTML.replaceAll('<!--', '').replaceAll('-->', '').replaceAll('{id_quiz}', quizId).replaceAll('{nome_quiz}', quizName);
            }

        </script>

    </body>

    </html>