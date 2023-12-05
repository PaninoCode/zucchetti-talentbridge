<script>

    let esperienzaInfoText = document.querySelector('#esperienza_info_text');

    let esperienzaAccordion = document.querySelector('#esperienza_accordion');

    function buildEsperienza(id, nomeAzienda, indirizzoAzienda, posizione, dataInizio, dataFine, funzione) {

        let itemTemplate = document.querySelector('#esperienza_accordion_example_item').innerHTML;

        let newItem = itemTemplate
            .replaceAll('<!--', '')
            .replaceAll('-->', '')
            .replaceAll('{id_esperienza}', id)
            .replace('{nome_azienda}', nomeAzienda)
            .replace('{indirizzo_azienda}', indirizzoAzienda)
            .replace('{posizione}', posizione)
            .replace('{data_inizio}', dataInizio)
            .replace('{data_fine}', dataFine)
            .replace('{funzione}', funzione);

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

            userExperiences.forEach(experiencesElement => {
                buildEsperienza(experiencesElement.idEl, experiencesElement.azienda, experiencesElement.indirizzo, experiencesElement.posizione, experiencesElement.dInizio, experiencesElement.dFine, experiencesElement.funzione);
            });
        }
    }
</script>