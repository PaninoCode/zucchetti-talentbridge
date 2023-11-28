<script>
let esperienzaAccordion = document.querySelector('#esperienza_accordion');

function buildEsperienza(id, nomeAzienda, posizione, dataInizio, dataFine, funzione){

    let itemTemplate = document.querySelector('#esperienza_accordion_example_item').innerHTML;

    let newItem = itemTemplate
                    .replaceAll('esperienza_accordion_collapse_sampleId', 'esperienza_accordion_collapse_' + id)
                    .replace('{nome_azienda}', nomeAzienda)
                    .replace('{posizione}', posizione)
                    .replace('{data_inizio}', dataInizio)
                    .replace('{data_fine}', dataFine)
                    .replace('{funzione}', funzione);

    esperienzaAccordion.innerHTML += newItem;

}

if (dataUser.hasOwnProperty('profile')) {
    if (dataUser.profile.hasOwnProperty('experiences')) {

        let userExperiences = dataUser.profile.experiences;
        
        console.log(userExperiences);

        userExperiences.forEach(experiencesElement => {
            buildEsperienza(experiencesElement.idEl, experiencesElement.azienda, experiencesElement.posizione, experiencesElement.dInizio, experiencesElement.dFine, experiencesElement.funzione);
        });
    }
}
</script>