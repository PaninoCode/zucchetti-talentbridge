<script>
    const failedQuizModal = new bootstrap.Modal('#quiz_failed_modal', {});
    const timeOverQuizModal = new bootstrap.Modal('#quiz_time_over_modal', {});
    const userSubmittedQuizModal = new bootstrap.Modal('#quiz_user_submitted_modal', {});
    const resultsQuizModal = new bootstrap.Modal('#quiz_results_modal', {});

    let reulstsQuizModalNomeQuiz = document.querySelector('#quiz_results_modal_nome_quiz');
    let reulstsQuizModalSommaPunti = document.querySelector('#quiz_results_modal_somma_punti');
    let reulstsQuizModalPuntiTotali = document.querySelector('#quiz_results_modal_punti_totali');
    let reulstsQuizModalNomeResultsTable = document.querySelector('#quiz_results_modal_results_table');

    let openQuizBtns = null;

    document.querySelectorAll('.quiz-end-modal').forEach(element => {
        element.addEventListener('hidden.bs.modal', e => {
            location.reload();
        });
    });

    function initResultsButtons() {
        resultsQuizBtns = document.querySelectorAll('.btn-results-open');

        resultsQuizBtns.forEach(resultsQuizBtn => {
            let quizId = resultsQuizBtn.getAttribute('data-quiz-id');

            if (quizId == null || quizId == undefined || quizId == "" || isNaN(quizId)) {
                resultsQuizBtn.disabled = true;
            }

            resultsQuizBtn.addEventListener('click', e => {
                getQuizAnswers({ idQuiz: quizId }, function (error, data) {

                    // {
                    //     "id": 1,
                    //         "nome": "SQL Quiz",
                    //             "listaDomande": [
                    //                 {
                    //                     "id": 1,
                    //                     "testo": "Cosè SQL?",
                    //                     "punteggio": 10,
                    //                     "risposte": [
                    //                         {
                    //                             "id": 1,
                    //                             "testo": "Structured Query Language",
                    //                             "giusta": true
                    //                         },
                    //                         {
                    //                             "id": 2,
                    //                             "testo": "Simple Query Language",
                    //                             "giusta": false
                    //                         },
                    //                         {
                    //                             "id": 3,
                    //                             "testo": "System Query Language",
                    //                             "giusta": false
                    //                         },
                    //                         {
                    //                             "id": 4,
                    //                             "testo": "Sequential Query Language",
                    //                             "giusta": false
                    //                         }
                    //                     ],
                    //                     "idRispostaUtente": 1
                    //                 },
                    //                 {
                    //                     "id": 2,
                    //                     "testo": "Cosa significa SQL?",
                    //                     "punteggio": 10,
                    //                     "risposte": [
                    //                         {
                    //                             "id": 5,
                    //                             "testo": "Structured Query Language",
                    //                             "giusta": true
                    //                         },
                    //                         {
                    //                             "id": 6,
                    //                             "testo": "Simple Query Language",
                    //                             "giusta": false
                    //                         },
                    //                         {
                    //                             "id": 7,
                    //                             "testo": "System Query Language",
                    //                             "giusta": false
                    //                         },
                    //                         {
                    //                             "id": 8,
                    //                             "testo": "Sequential Query Language",
                    //                             "giusta": false
                    //                         }
                    //                     ],
                    //                     "idRispostaUtente": 5
                    //                 },
                    //             ],
                    //                 "isDone": false
                    // }

                    reulstsQuizModalNomeQuiz.innerHTML = data.nome;

                    let puntiGuadagnati = 0;
                    let puntiTotali = 0;

                    resultingHtml = "";

                    data.listaDomande.forEach(domanda => {

                        puntiTotali += domanda.punteggio;

                        resultingHtml += '<br><b>' + domanda.testo + '&nbsp;<span class="badge bg-primary">' + domanda.punteggio + ' Punti</span></b><br><br>';

                        if (domanda.idRispostaUtente == 0) {
                            resultingHtml += '<div class="p-2 border"><p>Non hai selezionato una risposta per questa domanda.</p></div>';
                        } else {
                            resultingHtml += '<table class="table border">\
                            <thead>\
                                <tr>\
                                    <th scope="col">#</th>\
                                    <th scope="col">Risposta</th>\
                                    <th scope="col">Corretta</th>\
                                    <th scope="col">Selezionata</th>\
                                </tr>\
                            </thead>\
                            <tbody>';

                            let rispostaRow = 1;

                            domanda.risposte.forEach(risposta => {

                                resultingHtml += '\
                                <tr>\
                                    <th scope="row">' + rispostaRow + '</th>\
                                    <td>\
                                        ' + risposta.testo + '\
                                    </td>\
                                    <td>';

                                if (risposta.giusta) {
                                    if (risposta.id == domanda.idRispostaUtente) puntiGuadagnati += domanda.punteggio;
                                    resultingHtml += '<span class="badge rounded-pill text-bg-success text-light">Corretta</span>';
                                } else {
                                    resultingHtml += '<span class="badge rounded-pill text-bg-danger text-light">Errata</span>';
                                }

                                if (risposta.id == domanda.idRispostaUtente) {
                                    resultingHtml += '\
                                </td>\
                                    <td>\
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"\
                                            fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">\
                                            <path\
                                                d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4" />\
                                            <path\
                                                d="M8.256 14a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1z" />\
                                        </svg>\
                                    </td>\
                                </tr>';
                                } else {
                                    resultingHtml += '\
                                </td>\
                                    <td>\
                                        -\
                                    </td>\
                                </tr>';
                                }

                                if (rispostaRow == domanda.risposte.length) {
                                } else {
                                    rispostaRow++;
                                }
                            });

                            resultingHtml += "</tbody></table>"
                        }
                    });


                    reulstsQuizModalPuntiTotali.innerHTML = puntiTotali;
                    reulstsQuizModalSommaPunti.innerHTML = puntiGuadagnati;

                    if (puntiGuadagnati > 0) {
                        reulstsQuizModalNomeResultsTable.innerHTML = resultingHtml;
                    } else {
                        reulstsQuizModalNomeResultsTable.innerHTML = '<div class="alert alert-info" role="alert">Non ci sono dettagli da mostrare relativi a questo risultato.</div><br>';
                    }

                    resultsQuizModal.show();
                });
            });
        });
    }

    function initQuizButtons() {
        openQuizBtns = document.querySelectorAll('.btn-quiz-open');

        openQuizBtns.forEach(openQuizBtn => {
            let quizId = openQuizBtn.getAttribute('data-quiz-id');

            if (quizId == null || quizId == undefined || quizId == "" || isNaN(quizId)) {
                openQuizBtn.disabled = true;
            }

            openQuizBtn.addEventListener('click', e => {

                let quizWindow = open('http://localhost:8080/hrport/user/quiz', 'quiz_window', 'toolbar=no,scrollbars=no,resizable=no,top=0,left=0,width=40000,height=40000')
                quizWindow.focus();

                quizWindow.addEventListener('load', e => {
                    quizWindow.initTakeQuiz(openQuizBtn.getAttribute('data-quiz-id'), openQuizBtn.getAttribute('data-quiz-nome'));
                });

                quizWindow.addEventListener('contextmenu', e => {
                    e.preventDefault();
                });

                quizWindow.addEventListener('blur', e => {
                    if (quizWindow.document.querySelector('BODY').getAttribute('data-quiz-status') == "opened") {
                        quizWindow.close();
                        return;
                    }
                    quizClosed();
                });

                quizWindow.window.addEventListener('fullscreenchange', e => {
                    if (!quizWindow.document.fullscreenElement) {
                        e.preventDefault();
                        quizClosed();
                    }
                });

                quizWindow.window.addEventListener('mouseout', e => {
                    if (quizWindow.document.querySelector('BODY').getAttribute('data-quiz-status') == "opened") return;
                    e = e ? e : window.event;
                    var from = e.relatedTarget || e.toElement;
                    if (!from || from.nodeName == "HTML") {
                        quizClosed();
                    }
                })

                function quizClosed() {
                    let quizStatus = quizWindow.document.querySelector('BODY').getAttribute('data-quiz-status');
                    quizWindow.close();

                    sendCurrentAnswers(function (error) {
                        if (error != null) { }

                        if (quizStatus == "timeover") {
                            timeOverQuizModal.show();
                        }

                        if (quizStatus == "started") {
                            failedQuizModal.show();
                        }

                        if (quizStatus == "usersubmitted") {
                            userSubmittedQuizModal.show();
                        }
                    });
                }
            });

        });

    }

    let quizData = null;
    let answerData = [];

    function getQuizName() {
        return quizData.nome;
    }

    function getQuestion(questionNum) {
        return quizData.listaDomande[questionNum];
    }

    function clearAnswerData() {
        answerData.length = 0;
        answerData = [];
    }

    function saveAnswerData(data) {
        for (let i = 0; i < answerData.length; i++) {
            if (answerData[i].questionId == data.questionId) {
                answerData[i] = data;
                return;
            }
        }

        answerData.push(data);

        console.log(answerData);
    }

    let answersSent = false;

    function sendCurrentAnswers(callback) {

        if (answersSent == true) return;
        answersSent = true;

        callDatiUtente(function (user_id) {

            console.log(user_id);
            console.log(user_id.idUtente);

            let insertAnswers = {
                "pos_id": dataPos.idPos,
                "quiz_id": quizData.id,
                "user_id": user_id.idUtente,
                "answers": []
            }

            answerData.forEach(ansDat => {
                insertAnswers.answers.push(
                    {
                        "question_id": parseInt(ansDat.questionId) + 1,
                        "selected_option_id": parseInt(ansDat.answerId) + 1
                    }
                )
            });

            for (let i = insertAnswers.answers.length; i < quizData.listaDomande.length; i++) {
                insertAnswers.answers.push(
                    {
                        "question_id": i + 1,
                        "selected_option_id": 'null'
                    }
                )
            }

            console.log(insertAnswers);

            sendAnswers(insertAnswers, function (error, data) {
                callback(error);
                console.log('----------------');
                console.log(error);
                console.log(data);
            });

        });
    }

    function startQuiz(id, callback) {
        getQuiz({ idQuiz: id }, function (error, data) {
            if (error != null) {
                quizWindow.close();
            }
            quizData = data;
            console.log(quizData);
            console.log(data.listaDomande.length);
            callback(data.isDone, data.listaDomande.length);
        });
    }

    async function getQuiz(idQuiz, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/get-quiz', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(idQuiz)
        });

        const result = await response.json();

        // console.log(result);

        if (response == null || result.error != null) {
            callback(result.error, null);
        }

        if (response.ok && result != null) {
            callback(null, result);
        }
    }

    async function getQuizAnswers(idQuiz, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/get-quiz-answers', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(idQuiz)
        });

        const result = await response.json();

        // console.log(result);

        if (response == null || result.error != null) {
            callback(result.error, null);
        }

        if (response.ok && result != null) {
            callback(null, result);
        }
    }

    async function callDatiUtente(callback) {

        const response = await fetch('http://localhost:8080/hrport/app/get-info-user', {
            method: 'GET'
        });

        const result = await response.json();

        console.log(result);

        if (result.error != null) {
            alert("Impossibile recuperare i dati dell'account utente.");
            window.reload();
        }

        if (response.ok) {
            // console.log(result);
            callback(result);
        }
    }

    async function sendAnswers(data, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/sendAnswers', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        const result = await response.json();

        // console.log(result);

        if (response == null || result.error != null) {
            callback(result.error, null);
        }

        if (response.ok && result != null) {
            callback(null, result);
        }
    }

</script>