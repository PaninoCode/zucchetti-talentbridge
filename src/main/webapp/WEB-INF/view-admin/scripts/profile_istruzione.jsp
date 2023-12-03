<script>
    let istruzioneInfoText = document.querySelector('#istruzione_info_text');

    let istruzioneAccordion = document.querySelector('#istruzione_accordion');

    function buildIstruzione(id, titoloDiStudio, nomeIstituto, indirizzoIstituto, dataInizio, dataFine, voto) {

        let itemTemplate = document.querySelector('#istruzione_accordion_example_item').innerHTML;

        let newItem = itemTemplate
            .replaceAll('<!--', '')
            .replaceAll('-->', '')
            .replaceAll('{id_istruzione}', id)
            .replace('{titolo_di_studio}', titoloDiStudio)
            .replace('{nome_istituto}', nomeIstituto)
            .replace('{indirizzo_istituto}', indirizzoIstituto)
            .replace('{data_inizio}', dataInizio)
            .replace('{data_fine}', dataFine)
            .replace('{voto}', voto);

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

            userEducation.forEach(educationElement => {
                buildIstruzione(educationElement.idIst, educationElement.titoloIstruzione, educationElement.istituto, educationElement.indirizzo, educationElement.dInizio, educationElement.dFine, educationElement.voto);
            });
        }
    }
</script>