<script>
    const failedQuizModal = new bootstrap.Modal('#quiz_failed_modal', {});

    let openQuizBtns = null;

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
                        //quizWindow.close();
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

                    if (quizStatus == "timeover") {
                        alert("TEMPO SCADUTO! Il quiz e' stato inviato correttamente.");
                    }

                    if (quizStatus == "started") {
                        failedQuizModal.show();
                    }

                    if (quizStatus == "usersubmitted") {
                        alert("Il quiz e' stato inviato correttamente.");
                    }
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

    //0 -> question not found / 1 -> success / 2 -> question already answered
    function setQuestionAnswer(questionNum, answerId){
        answerData.forEach(answer => function(){
            if(answer.questionId == quizData.listaDomande[questionNum].id){
                return 1;
            }
        });

        answerData.push({
            questionId: quizData.listaDomande[questionNum].id,
            answerId: answerId
        })
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

</script>