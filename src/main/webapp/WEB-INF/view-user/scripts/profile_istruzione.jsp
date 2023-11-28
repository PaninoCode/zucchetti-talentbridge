<script>
let istruzioneAccordion = document.querySelector('#istruzione_accordion');

function buildIstruzione(id, titoloDiStudio, nomeIstituto, dataInizio, dataFine, voto){

    let itemTemplate = document.querySelector('#istruzione_accordion_example_item').innerHTML;

    let newItem = itemTemplate
                    .replaceAll('istruzione_accordion_collapse_sampleId', 'istruzione_accordion_collapse_' + id)
                    .replace('{titolo_di_studio}', titoloDiStudio)
                    .replace('{nome_istituto}', nomeIstituto)
                    .replace('{data_inizio}', dataInizio)
                    .replace('{data_fine}', dataFine)
                    .replace('{voto}', voto);

    istruzioneAccordion.innerHTML += newItem;

}

if (dataUser.hasOwnProperty('profile')) {
    if (dataUser.profile.hasOwnProperty('education')) {

        let userEducation = dataUser.profile.education;
        
        console.log(userEducation);

        userEducation.forEach(educationElement => {
            buildIstruzione(educationElement.idIst, educationElement.titoloIstruzione, educationElement.istituto, educationElement.dInizio, educationElement.dFine, educationElement.voto);
        });
    }
}
</script>