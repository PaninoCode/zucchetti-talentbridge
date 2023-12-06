<script>

let esperienzaCard = document.querySelector('#esperienza_card');
    let esperienzaAggiungiOpenModalBtn = document.querySelector('#esperienza_aggiungi_openmodal_btn')

    let esperienzaInfoText = document.querySelector('#esperienza_info_text');

    let esperienzaAccordion = document.querySelector('#esperienza_accordion');
    let esperienzaModificaModal = document.querySelector('#esperienza_modifica_modal');
    let esperienzaModificaModalTitle = document.querySelector('#esperienza_modifica_modal_title');
    let esperienzaModificaModalErrorText = document.querySelector('#esperienza_modifica_modal_error_text');
    let esperienzaModificaModalPosizione = document.querySelector('#esperienza_modifica_modal_posizione');
    let esperienzaModificaModalAzienda = document.querySelector('#esperienza_modifica_modal_azienda');
    let esperienzaModificaModalIndirizzoAzienda = document.querySelector('#esperienza_modifica_modal_indirizzo_azienda');
    let esperienzaModificaModalDataInizio = document.querySelector('#esperienza_modifica_modal_data_inizio');
    let esperienzaModificaModalDataFine = document.querySelector('#esperienza_modifica_modal_data_fine');
    let esperienzaModificaModalFunzione = document.querySelector('#esperienza_modifica_modal_funzione');
    let esperienzaModificaModalFunzioneCharcounter = document.querySelector('#esperienza_modifica_modal_funzione_charcounter');

    let esperienzaModificaModalModificaBtn = document.querySelector('#esperienza_modifica_modal_modifica_btn');
    let esperienzaModificaModalAggiungiBtn = document.querySelector('#esperienza_modifica_modal_aggiungi_btn');

    let esperienzaEliminaModal = document.querySelector('#esperienza_elimina_modal');
    let esperienzaEliminaModalPosizione = document.querySelector('#esperienza_elimina_modal_posizione');

    let esperienzaEliminaModalEliminaBtn = document.querySelector('#esperienza_elimina_modal_elimina_btn');

    function buildEsperienza(id, nomeAzienda, indirizzoAzienda, posizione, dataInizio, dataFine, funzione) {

        let itemTemplate = document.querySelector('#esperienza_accordion_example_item').innerHTML;

        let newItem = itemTemplate
            .replaceAll('<!--', '')
            .replaceAll('-->', '')
            .replaceAll('{id_esperienza}', id)
            .replaceAll('{nome_azienda}', nomeAzienda)
            .replaceAll('{indirizzo_azienda}', indirizzoAzienda)
            .replaceAll('{posizione}', posizione)
            .replaceAll('{data_inizio}', dataInizio)
            .replaceAll('{data_fine}', dataFine)
            .replaceAll('{funzione}', funzione);

        esperienzaAccordion.innerHTML += newItem;

    }

    if (dataUser.hasOwnProperty('profile')) {
        if (dataUser.profile.hasOwnProperty('experiences')) {

            let userExperiences = dataUser.profile.experiences;

            // console.log(userExperiences);

            if(userExperiences.length < 1){
                esperienzaInfoText.innerHTML = "Nessun dettaglio sull'esperienza lavorativa presente.";
                esperienzaInfoText.classList.remove('d-none');
            }

            userExperiences.sort((a,b) => a.idEl - b.idEl);

            userExperiences.forEach(experiencesElement => {
                buildEsperienza(experiencesElement.idEl, experiencesElement.azienda, experiencesElement.indirizzo, experiencesElement.posizione, experiencesElement.dInizio, experiencesElement.dFine, experiencesElement.funzione);
            });

            esperienzaModificaModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                esperienzaModificaModal.setAttribute('data-esperienza-id', btn.getAttribute('data-esperienza-id'));
                let idEsperienza = parseInt(esperienzaModificaModal.getAttribute('data-esperienza-id'));

                esperienzaModificaModalPosizione.value = "";
                esperienzaModificaModalAzienda.value = "";
                esperienzaModificaModalIndirizzoAzienda.value = "";
                esperienzaModificaModalDataInizio.value = "";
                esperienzaModificaModalDataFine.value = "";
                esperienzaModificaModalFunzione.value = "";
                esperienzaModificaModalAggiungiBtn.classList.add('d-none');
                esperienzaModificaModalModificaBtn.classList.add('d-none');
                esperienzaModificaModalErrorText.classList.add('d-none');

                console.log(idEsperienza);

                if (idEsperienza == null || idEsperienza == undefined || isNaN(idEsperienza)) {
                    console.log("Esperienza - mod. aggiungi");
                    esperienzaModificaModalTitle.innerHTML = "Aggiungi Esperienza";
                    esperienzaModificaModalAggiungiBtn.classList.remove('d-none');
                } else {
                    console.log("Esperienza - mod. modifica");

                    userExperiences.forEach(experience => {
                        if (experience.idEl == idEsperienza) {
                            esperienzaModificaModalPosizione.value = experience.posizione;
                            esperienzaModificaModalAzienda.value = experience.azienda;
                            esperienzaModificaModalIndirizzoAzienda.value = experience.indirizzo;
                            esperienzaModificaModalDataInizio.value = experience.dInizio;
                            esperienzaModificaModalDataFine.value = experience.dFine;
                            esperienzaModificaModalFunzione.value = experience.funzione;
                        }
                    });

                    esperienzaModificaModalTitle.innerHTML = "Modifica Esperienza";
                    esperienzaModificaModalModificaBtn.classList.remove('d-none');
                }
            });

            esperienzaModificaModalModificaBtn.addEventListener('click', e => {
                if (esperienzaValidateInputs()) {
                    let idEsperienza = parseInt(esperienzaModificaModal.getAttribute('data-esperienza-id'));
                    let updatedEsperienza = {
                        idEl: idEsperienza,
                        idCv: dataUser.profile.idCv,
                        posizione: esperienzaModificaModalPosizione.value,
                        azienda: esperienzaModificaModalAzienda.value,
                        indirizzo: esperienzaModificaModalIndirizzoAzienda.value,
                        funzione: esperienzaModificaModalFunzione.value,
                        dInizio: esperienzaModificaModalDataInizio.value,
                        dFine: esperienzaModificaModalDataFine.value
                    }
                    updateEsperienza(updatedEsperienza, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        esperienzaModificaModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        esperienzaModificaModalErrorText.classList.remove('d-none');
                    });
                }
            });

            esperienzaModificaModalAggiungiBtn.addEventListener('click', e => {
                if (esperienzaValidateInputs()) {
                    let idEsperienza = parseInt(esperienzaModificaModal.getAttribute('data-esperienza-id'));
                    let updatedEsperienza = {
                        idCv: dataUser.profile.idCv,
                        posizione: esperienzaModificaModalPosizione.value,
                        azienda: esperienzaModificaModalAzienda.value,
                        indirizzo: esperienzaModificaModalIndirizzoAzienda.value,
                        funzione: esperienzaModificaModalFunzione.value,
                        dInizio: esperienzaModificaModalDataInizio.value,
                        dFine: esperienzaModificaModalDataFine.value
                    }
                    insertEsperienza(updatedEsperienza, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        esperienzaModificaModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        esperienzaModificaModalErrorText.classList.remove('d-none');
                    });
                }
            });

            function esperienzaValidateInputs() {
                if (esperienzaModificaModalPosizione.value.length < 3 ||
                    esperienzaModificaModalAzienda.value.length < 3 ||
                    esperienzaModificaModalIndirizzoAzienda.value.length < 3 ||
                    esperienzaModificaModalDataInizio.value.length < 3 ||
                    esperienzaModificaModalDataFine.value.length < 3 ||
                    esperienzaModificaModalFunzione.value.length < 1) {
                    esperienzaModificaModalErrorText.innerHTML = "Compila tutti i campi prima di continuare.";
                    esperienzaModificaModalErrorText.classList.remove('d-none');
                    return false;
                }
                return true;
            }

            esperienzaEliminaModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                esperienzaEliminaModal.setAttribute('data-esperienza-id', btn.getAttribute('data-esperienza-id'));
                let idEsperienza = parseInt(esperienzaEliminaModal.getAttribute('data-esperienza-id'));
                console.log(idEsperienza);

                userExperiences.forEach(education => {
                    if (education.idEl == idEsperienza) {
                        esperienzaEliminaModalPosizione.innerHTML = education.posizione;
                    }
                });
            });

            esperienzaEliminaModalEliminaBtn.addEventListener('click', e => {
                let idEsperienza = parseInt(esperienzaEliminaModal.getAttribute('data-esperienza-id'));
                deleteEsperienza(idEsperienza, function (error, data) {
                    if (error == null) {
                        location.reload();
                        return;
                    }
                });
            });

        }
    }else{
        esperienzaCard.style.opacity = "0.5";
        esperienzaAggiungiOpenModalBtn.disabled = true;
    }

    async function updateEsperienza(category, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/update-esperienza', {
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

    async function insertEsperienza(category, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/insert-esperienza', {
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

    async function deleteEsperienza(idEsperienza, callback) {

        const response = await fetch('http://localhost:8080/hrport/user/delete-experience/' + idEsperienza, {
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

    esperienzaModificaModalFunzione.addEventListener('input', e => {
        if (esperienzaModificaModalFunzione.value.length > 500) {
            esperienzaModificaModalFunzioneCharcounter.classList.add('text-danger');
        } else {
            esperienzaModificaModalFunzioneCharcounter.classList.remove('text-danger');
        }
        esperienzaModificaModalFunzioneCharcounter.innerHTML = esperienzaModificaModalFunzione.value.length;
    });
</script>