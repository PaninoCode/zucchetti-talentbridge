<script>

    let istruzioneCard = document.querySelector('#istruzione_card');
    let istruzioneAggiungiOpenModalBtn = document.querySelector('#istruzione_aggiungi_openmodal_btn')

    let istruzioneInfoText = document.querySelector('#istruzione_info_text');

    let istruzioneAccordion = document.querySelector('#istruzione_accordion');
    let istruzioneModificaModal = document.querySelector('#istruzione_modifica_modal');
    let istruzioneModificaModalTitle = document.querySelector('#istruzione_modifica_modal_title');
    let istruzioneModificaModalErrorText = document.querySelector('#istruzione_modifica_modal_error_text');
    let istruzioneModificaModalTitoloDiStudio = document.querySelector('#istruzione_modifica_modal_titolo_di_studio');
    let istruzioneModificaModalNomeIstituto = document.querySelector('#istruzione_modifica_modal_nome_istituto');
    let istruzioneModificaModalIndirizzoIstituto = document.querySelector('#istruzione_modifica_modal_indirizzo_istituto');
    let istruzioneModificaModalDataInizio = document.querySelector('#istruzione_modifica_modal_data_inizio');
    let istruzioneModificaModalDataFine = document.querySelector('#istruzione_modifica_modal_data_fine');
    let istruzioneModificaModalVoto = document.querySelector('#istruzione_modifica_modal_voto');

    let istruzioneModificaModalModificaBtn = document.querySelector('#istruzione_modifica_modal_modifica_btn');
    let istruzioneModificaModalAggiungiBtn = document.querySelector('#istruzione_modifica_modal_aggiungi_btn');

    let istruzioneEliminaModal = document.querySelector('#istruzione_elimina_modal');
    let istruzioneEliminaModalTitoloDiStudio = document.querySelector('#istruzione_elimina_modal_titolo_di_studio');

    let istruzioneEliminaModalEliminaBtn = document.querySelector('#istruzione_elimina_modal_elimina_btn');

    function buildIstruzione(id, titoloDiStudio, nomeIstituto, indirizzoIstituto, dataInizio, dataFine, voto) {

        let itemTemplate = document.querySelector('#istruzione_accordion_example_item').innerHTML;

        let newItem = itemTemplate
            .replaceAll('<!--', '')
            .replaceAll('-->', '')
            .replaceAll('{id_istruzione}', id)
            .replaceAll('{titolo_di_studio}', titoloDiStudio)
            .replaceAll('{nome_istituto}', nomeIstituto)
            .replaceAll('{indirizzo_istituto}', indirizzoIstituto)
            .replaceAll('{data_inizio}', dataInizio)
            .replaceAll('{data_fine}', dataFine)
            .replaceAll('{voto}', voto);

        istruzioneAccordion.innerHTML += newItem;

    }

    if (dataUser.hasOwnProperty('profile')) {
        if (dataUser.profile.hasOwnProperty('education')) {

            let userEducation = dataUser.profile.education;

            // console.log(userEducation);

            if(userEducation.length < 1){
                istruzioneInfoText.innerHTML = "Nessun dettaglio sull'istruzione presente.";
                istruzioneInfoText.classList.remove('d-none');
            }

            userEducation.sort((a,b) => a.idIst - b.idIst);

            userEducation.forEach(educationElement => {
                buildIstruzione(educationElement.idIst, educationElement.titoloIstruzione, educationElement.istituto, educationElement.indirizzo, educationElement.dInizio, educationElement.dFine, educationElement.voto);
            });

            istruzioneModificaModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                istruzioneModificaModal.setAttribute('data-istruzione-id', btn.getAttribute('data-istruzione-id'));
                let idIstruzione = parseInt(istruzioneModificaModal.getAttribute('data-istruzione-id'));

                istruzioneModificaModalTitoloDiStudio.value = "";
                istruzioneModificaModalNomeIstituto.value = "";
                istruzioneModificaModalIndirizzoIstituto.value = "";
                istruzioneModificaModalDataInizio.value = "";
                istruzioneModificaModalDataFine.value = "";
                istruzioneModificaModalVoto.value = "";
                istruzioneModificaModalAggiungiBtn.classList.add('d-none');
                istruzioneModificaModalModificaBtn.classList.add('d-none');
                istruzioneModificaModalErrorText.classList.add('d-none');

                console.log(idIstruzione);

                if (idIstruzione == null || idIstruzione == undefined || isNaN(idIstruzione)) {
                    console.log("Istruzione - mod. aggiungi");
                    istruzioneModificaModalTitle.innerHTML = "Aggiungi Istruzione";
                    istruzioneModificaModalAggiungiBtn.classList.remove('d-none');
                } else {
                    console.log("Istruzione - mod. modifica");

                    userEducation.forEach(education => {
                        if (education.idIst == idIstruzione) {
                            istruzioneModificaModalTitoloDiStudio.value = education.titoloIstruzione;
                            istruzioneModificaModalNomeIstituto.value = education.istituto;
                            istruzioneModificaModalIndirizzoIstituto.value = education.indirizzo;
                            istruzioneModificaModalDataInizio.value = education.dInizio,
                                istruzioneModificaModalDataFine.value = education.dFine;
                            istruzioneModificaModalVoto.value = education.voto;
                        }
                    });

                    istruzioneModificaModalTitle.innerHTML = "Modifica Istruzione";
                    istruzioneModificaModalModificaBtn.classList.remove('d-none');
                }

            });

            istruzioneModificaModalModificaBtn.addEventListener('click', e => {
                if (istruzioneValidateInputs()) {
                    let idIstruzione = parseInt(istruzioneModificaModal.getAttribute('data-istruzione-id'));
                    let updatedIstruzione = {
                        idIst: idIstruzione,
                        idCv: dataUser.profile.idCv,
                        titoloIstruzione: istruzioneModificaModalTitoloDiStudio.value,
                        istituto: istruzioneModificaModalNomeIstituto.value,
                        indirizzo: istruzioneModificaModalIndirizzoIstituto.value,
                        voto: istruzioneModificaModalVoto.value,
                        dInizio: istruzioneModificaModalDataInizio.value,
                        dFine: istruzioneModificaModalDataFine.value
                    }
                    updateIstruzione(updatedIstruzione, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        istruzioneModificaModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        istruzioneModificaModalErrorText.classList.remove('d-none');
                    });
                }
            });

            istruzioneModificaModalAggiungiBtn.addEventListener('click', e => {
                if (istruzioneValidateInputs()) {
                    let idIstruzione = parseInt(istruzioneModificaModal.getAttribute('data-istruzione-id'));
                    let updatedIstruzione = {
                        idCv: dataUser.profile.idCv,
                        titoloIstruzione: istruzioneModificaModalTitoloDiStudio.value,
                        istituto: istruzioneModificaModalNomeIstituto.value,
                        indirizzo: istruzioneModificaModalIndirizzoIstituto.value,
                        voto: istruzioneModificaModalVoto.value,
                        dInizio: istruzioneModificaModalDataInizio.value,
                        dFine: istruzioneModificaModalDataFine.value
                    }
                    insertIstruzione(updatedIstruzione, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        istruzioneModificaModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        istruzioneModificaModalErrorText.classList.remove('d-none');
                    });
                }
            });

            function istruzioneValidateInputs() {
                if (istruzioneModificaModalTitoloDiStudio.value.length < 3 ||
                    istruzioneModificaModalNomeIstituto.value.length < 3 ||
                    istruzioneModificaModalIndirizzoIstituto.value.length < 3 ||
                    istruzioneModificaModalDataInizio.value.length < 3 ||
                    istruzioneModificaModalDataFine.value.length < 3 ||
                    istruzioneModificaModalVoto.value.length < 1) {
                    istruzioneModificaModalErrorText.innerHTML = "Compila tutti i campi prima di continuare.";
                    istruzioneModificaModalErrorText.classList.remove('d-none');
                    return false;
                }
                return true;
            }

            istruzioneEliminaModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                istruzioneEliminaModal.setAttribute('data-istruzione-id', btn.getAttribute('data-istruzione-id'));
                let idIstruzione = parseInt(istruzioneEliminaModal.getAttribute('data-istruzione-id'));
                console.log(idIstruzione);

                userEducation.forEach(education => {
                    if (education.idIst == idIstruzione) {
                        istruzioneEliminaModalTitoloDiStudio.innerHTML = education.titoloIstruzione;
                    }
                });
            });

            istruzioneEliminaModalEliminaBtn.addEventListener('click', e => {
                let idIstruzione = parseInt(istruzioneEliminaModal.getAttribute('data-istruzione-id'));
                deleteIstruzione(idIstruzione, function (error, data) {
                    if (error == null) {
                        location.reload();
                        return;
                    }
                });
            });
        }
    }else{
        istruzioneCard.style.opacity = "0.5";
        istruzioneAggiungiOpenModalBtn.disabled = true;
    }

    async function updateIstruzione(category, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/update-istruzione', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(category)
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
            callback(result.error, null);
        }

        if (response.ok) {
            callback(null, result);
        }
    }

    async function insertIstruzione(category, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/insert-istruzione', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(category)
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
            callback(result.error, null);
        }

        if (response.ok) {
            callback(null, result);
        }
    }

    async function deleteIstruzione(idIstruzione, callback) {

        const response = await fetch('http://localhost:8080/hrport/user/delete-istruzione/' + idIstruzione, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
            callback(result.error, null);
        }

        if (response.ok) {
            callback(null, result);
        }
    }
</script>