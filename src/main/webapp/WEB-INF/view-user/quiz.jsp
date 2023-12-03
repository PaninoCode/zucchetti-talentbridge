<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Interface</title>
        <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary" data-quiz-status="opened" style="width: 100%; height: 100%;">

        <span id="take_quiz_section" style="display: none;">
            <div class="fixed-top bg-white w-100 shadow-sm">
                <div class="progress rounded-0" role="progressbar" style="height: 10px">
                    <div class="progress-bar bg-info progress-bar-striped" id="quiz_progress_bar"
                        style="width: 100%; transition: 300ms;">
                    </div>
                </div>
                <div class="p-3 d-flex justify-content-between">
                    <h4 class="mb-0 text-contents-nome-quiz">
                        {nome_quiz}
                    </h4>
                    <div class="d-flex justify-content-center align-items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                            class="bi bi-stopwatch" viewBox="0 0 16 16">
                            <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5z" />
                            <path
                                d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5M8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3" />
                        </svg>
                        <span class="m-1"></span>
                        <p class="mb-0" id="demo">--:--</p>
                    </div>
                </div>
            </div>
            <div style="height: 5rem;"></div>

            <div class="container">
                <div class="card m-4 w-100" style="min-height: 80vh;">
                    <div class="card-body m-2">

                        <span id="quiz_question_screen" style="display: none;">
                            <div class="row mb-3 d-flex flex-row">
                                    <h4>
                                        <span class="text-contents-numero-domanda"></span>. &nbsp; <span class="text-contents-testo-domanda"></span>
                                    </h4>
                            </div>

                            <span id="form_answer_template" class="d-none">
                                <div class="form-check mb-3">
                                    <input class="form-check-input me-4 form-answer-radio" data-id-risposta="{id_risposta}" data-id-domanda="{id_domanda}" style="transform: scale(2);" type="radio"
                                        name="flexRadioDefault" id="form_answer_radio_{id_risposta}">
                                    <label class="form-check-label" for="form_answer_radio_{id_risposta}">
                                        {numero_risposta}. {testo_risposta}
                                    </label>
                                </div>
                            </span>

                            <span id="form_answers_container">

                            </span>

                        </span>

                        <span id="quiz_welcome_screen">
                            <div class="row mb-3">
                                <h2 class="text-contents-nome-quiz">
                                    {nome_quiz}
                                </h2>
                            </div>

                            <div class="row" style="height: 450px;">
                                <div class="col-12">
                                    <br>
                                    Benvenuto<br><br>
                                    Prima di iniziare, tieni presente che per completare questo quiz avrai a
                                    disposizione un
                                    limite massimo di <strong>15 minuti</strong>.<br>
                                    Durante questo periodo, non sarà possibile modificare o ridurre la finestra.
                                    Inoltre, ti
                                    ricordiamo che non è consentito spostare il cursore al di fuori della
                                    finestra.<br><br>

                                    Ti consigliamo di assicurarti di avere a disposizione il tempo necessario per
                                    completare
                                    l'esame senza interruzioni, in modo da poterti concentrare al meglio.
                                    Buona fortuna!<br><br>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-8"></div>
                                <div class="col-2">
                                    <button type="button" class="btn btn-secondary text-dark w-100"
                                        id="quiz_welcome_screen_close_btn" onclick="window.close();">
                                        <h5 class="m-0">Esci</h5>
                                    </button>
                                </div>
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary text-light w-100"
                                        id="quiz_welcome_screen_start_btn">
                                        <h5 class="m-0">Inizia</h5>
                                    </button>
                                </div>
                            </div>
                        </span>
                    </div>
                </div>
                <div style="height: 5rem;"></div>
            </div>

            <div class="fixed-bottom bg-white w-100 shadow-sm border-top border-2 border-primary">
                <div class="p-2 d-flex justify-content-end align-items-center">
                    <button type="button" class="btn btn-primary text-light" id="btn_indietro" disabled>
                        <h5 class="m-0">&laquo; Indietro</h5>
                    </button>
                    <div class="mx-2"></div>
                    <button type="button" class="btn btn-primary text-light" id="btn_avanti" disabled>
                        <h5 class="m-0">Avanti &raquo;</h5>
                    </button>
                    <div class="mx-2"></div>
                </div>
            </div>
        </span>

        <script>


            let quizWelcomeScreen = document.querySelector('#quiz_welcome_screen');
            let quizQuestionScreen = document.querySelector('#quiz_question_screen');
            let quizWelcomeScreenCloseBtn = document.querySelector('#quiz_welcome_screen_close_btn');
            let quizWelcomeScreenStartBtn = document.querySelector('#quiz_welcome_screen_start_btn');

            let quizAvantiBtn = document.querySelector('#btn_avanti');
            let quizIndietroBtn = document.querySelector('#btn_indietro');
            let currentIndex = null;
            let numDomande = null;
            let answers = []

            // open quiz logic

            let indexRedirect = setInterval(function () {
                window.close();
                location.replace('<%=request.getContextPath()%>');
            }, 500);


            function initTakeQuiz(id, nome) {

                document.querySelectorAll('.text-contents-nome-quiz').forEach(elem => {
                    elem.innerHTML = nome;
                });

                document.body.setAttribute('data-quiz-id', id);

                if (id == undefined || id == null || id == "") return;

                clearInterval(indexRedirect);
                // document.getElementById('user_header').style.display = "none";
                // document.getElementById('footer').style.display = "none";
                document.getElementById('take_quiz_section').style.display = "block";
            }

            quizWelcomeScreenStartBtn.addEventListener('click', e => {
                openFullscreen();
                console.log('openfullscreen');
                quizWelcomeScreenCloseBtn.disabled = true;
                quizWelcomeScreenStartBtn.disabled = true;
            });

            // take quiz logic

            const quizProgressBar = document.querySelector('#quiz_progress_bar');

            function startTimer(duration, display) {
                let timer = duration, minutes, seconds;
                let timerInterval = setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.textContent = minutes + ":" + seconds;

                    let totalSeconds = (minutes * 60) + seconds;
                    let percent = 100 - (totalSeconds / duration) * 100 + "%";
                    console.log(percent);
                    quizProgressBar.style.width = percent;

                    if (timer - 1 <= -1) {
                        endQuiz('timeover');
                        clearInterval(timerInterval);
                        //timer = duration;
                    }

                    timer--;

                }, 1000);
            }

            function endQuiz(status) {
                setTimeout(function () {
                    document.querySelector('BODY').setAttribute('data-quiz-status', status);
                    window.close();
                }, 1000);
            }

            /* Get the documentElement (<html>) to display the page in fullscreen */
            var elem = document.documentElement;

            /* View in fullscreen */
            function openFullscreen() {
                if (elem.requestFullscreen) {
                    elem.requestFullscreen();
                } else if (elem.webkitRequestFullscreen) { /* Safari */
                    elem.webkitRequestFullscreen();
                } else if (elem.msRequestFullscreen) { /* IE11 */
                    elem.msRequestFullscreen();
                }

                setTimeout(function () {

                    window.opener.startQuiz(parseInt(document.querySelector('BODY').getAttribute('data-quiz-id')), function (isDone, numd) {
                        if(isDone == true){ window.close(); }

                        quizProgressBar.classList.remove('bg-info');
                        quizProgressBar.style.width = '0%';
                        document.querySelector('BODY').setAttribute('data-quiz-status', 'started');
                        quizWelcomeScreen.style.display = "none";
                        numDomande = numd;
                        console.log("t1 " + numDomande);
                        console.log("t2 " + numd);
                        startTimer(15 * 60, document.querySelector('#demo'));
                        currentIndex = 0;
                        displayAnswerBlock(1, currentIndex);
                    });

                }, 1500);
            }

            /* Close fullscreen */
            function closeFullscreen() {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                } else if (document.webkitExitFullscreen) { /* Safari */
                    document.webkitExitFullscreen();
                } else if (document.msExitFullscreen) { /* IE11 */
                    document.msExitFullscreen();
                }
            }

            quizAvantiBtn.addEventListener('click', e => {
                setSelectedAnswer();
                currentIndex++;
                displayAnswerBlock(1, currentIndex);
            });

            quizIndietroBtn.addEventListener('click', e => {
                setSelectedAnswer();
                currentIndex--;
                displayAnswerBlock(1, currentIndex);
            });

            function setSelectedAnswer(){
                let answersEl = document.querySelectorAll('.form-answer-radio');

                answersEl.forEach(answerEl => {
                    if(answerEl.checked){
                        answers[currentIndex] = {
                            questionId: answerEl.getAttribute('data-question-id'),
                            answerId: answerEl.getAttribute('data-answer-id')
                        }
                    }
                });

                console.log(answers);
            }

            function displayAnswerBlock(questionNumer, index){

                quizAvantiBtn.disabled = true;
                quizIndietroBtn.disabled = true;

                console.log(index);

                if(index != 0){
                    quizIndietroBtn.disabled = false;
                }

                console.log(numDomande - 1);

                if(index < (numDomande - 1)){
                    quizAvantiBtn.disabled = false;
                }

                let questionData = window.opener.getQuestion(index);
                console.log(questionData);

                document.querySelectorAll('.text-contents-numero-domanda').forEach(elem => {
                    elem.innerHTML = index + 1;
                });

                document.querySelectorAll('.text-contents-testo-domanda').forEach(elem => {
                    elem.innerHTML = questionData.testo;
                });

                let answerCounter = 0;
                let formAnswersContainer = document.querySelector('#form_answers_container');
                let formAnswerTemplate = document.querySelector('#form_answer_template');
                formAnswersContainer.innerHTML = "";
                questionData.risposte.forEach(risposta => {
                    formAnswersContainer.innerHTML += formAnswerTemplate.innerHTML
                                                        .replaceAll('{numero_risposta}', ++answerCounter)
                                                        .replaceAll('{testo_risposta}', risposta.testo)
                                                        .replaceAll('{id_risposta}', risposta.id)
                                                        .replaceAll('{id_domanda}', questionData.id);
                });


                quizQuestionScreen.style.display = "block";
            }
        </script>

    </body>

    </html>