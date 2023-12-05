<script>

    let btnInviaCandidatura = document.querySelector('#btn_invia_candidatura');
    let btnRitiraCandidaturaModal = document.querySelector('#btn_ritira_candidatura_modal');
    let btnRitiraCandidatura = document.querySelector('#btn_ritira_candidatura');

    let quizCard = document.querySelector('#quiz_card');
    let quizInfoText = document.querySelector('#quiz_info_text');

    let candidaturaStatusMissing = document.querySelector('#candidatura_status_missing');
    let candidaturaStatusSent = document.querySelector('#candidatura_status_sent');
    let candidaturaStatusAccepted = document.querySelector('#candidatura_status_accepted');
    let candidaturaStatusDenied = document.querySelector('#candidatura_status_denied');
    let candidaturaStatusClosedGeneric = document.querySelector('#candidatura_status_closed_generic');

    //Stati candidatura:
    // 0 -> candidato, quiz non fatti
    // 1 -> candidato, quiz fatti
    // 2 -> posizione chiusa, accettato
    // 3 -> posizione chiusa, rifiutato
    // 4 -> posizione chiusa, motivo indefinito

    let dataApplication = null;

    if (dataPos.hasOwnProperty('applications')) {
        dataPos.applications.forEach(application => {
            if (application.user.idUtente == dataUser.idUtente) {
                dataApplication = application;
            }
        });

        if (dataApplication == null) {
            quizInfoText.innerHTML = "Prima di poter completare i quiz dovrai candidarti";
            quizInfoText.classList.remove('d-none');
            btnInviaCandidatura.classList.remove('d-none');
            quizCard.style.opacity = '0.5';
            listaQuiz.classList.add('d-none');
            listaQuizDisabled.classList.remove('d-none');
        } else {
            console.log("Stato candidatura: " + dataApplication.stato);
            statoCandidatura = dataApplication.stato;
            btnRitiraCandidaturaModal.classList.remove('d-none');

            switch(statoCandidatura){
                case 0:
                    candidaturaStatusMissing.classList.remove('d-none');
                    break;
                case 1:
                    candidaturaStatusSent.classList.remove('d-none');
                    break;
                case 2:
                    candidaturaStatusAccepted.classList.remove('d-none');
                    if(localStorage.getItem('candidatura-' + dataPos.idPos + '-celebration-shown') != "yes"){
                        const jsConfetti = new JSConfetti();
                        jsConfetti.addConfetti()
                        localStorage.setItem('candidatura-' + dataPos.idPos + '-celebration-shown', 'yes');
                    }
                    break;
                case 3:
                    candidaturaStatusDenied.classList.remove('d-none');
                    break;
                case 4:
                    candidaturaStatusClosedGeneric.classList.remove('d-none');
            }

        }

        btnInviaCandidatura.addEventListener('click', e => {
            addCandidatura();
        });

        btnRitiraCandidatura.addEventListener('click', e => {
            removeCandidatura();
        });



        function addCandidatura() {
            insertCandidatura(dataPos.idPos, function (error, data) {
                if (error != null) {
                    console.log(error);
                    return;
                }
                location.reload();
            });
        }

        function removeCandidatura() {
            deleteCandidatura(dataPos.idPos, function (error, data) {
                if (error != null) {
                    console.log(error);
                    return;
                }
                location.reload();
            });
        }
    }


    async function insertCandidatura(idPos, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/insert-candidatura/' + idPos, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
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

    async function deleteCandidatura(idPos, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/delete-candidatura/' + idPos, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
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