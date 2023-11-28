let anagraficaForm = document.querySelector('#anagrafica_form');

let anagraficaAbilitaModifica = document.querySelector('#anagrafica_abilita_modifica');

let anagraficaDataNascita = document.querySelector('#anagrafica_data_nascita');
let anagraficaProvinciaNascita = document.querySelector('#anagrafica_provincia_nascita');
let anagraficaNumeroTelefono = document.querySelector('#anagrafica_numero_telefono');
let anagraficaStatoOrigine = document.querySelector('#anagrafica_stato_origine');
let anagraficaCodiceFiscale = document.querySelector('#anagrafica_codice_fiscale');
let anagraficaSessoM = document.querySelector('#anagrafica_sesso_M');
let anagraficaSessoF = document.querySelector('#anagrafica_sesso_F');
let anagraficaIndirizzoDomicilio = document.querySelector('#anagrafica_indirizzo_domicilio');
let anagraficaIndirizzoResidenza = document.querySelector('#anagrafica_indirizzo_residenza');

let listaProvince = document.querySelector('#lista_province');

let anagraficaSalvaBtn = document.querySelector('#anagrafica_salva_btn');

anagraficaAbilitaModifica.addEventListener('click', e => {
    e.preventDefault();
    if (anagraficaSalvaBtn.disabled) {
        anagraficaAbilitaModifica.innerHTML = "Disabilita Modifica";
        anagraficaDataNascita.disabled = false;
        anagraficaProvinciaNascita.disabled = false;
        anagraficaNumeroTelefono.disabled = false;
        anagraficaStatoOrigine.disabled = false;
        anagraficaCodiceFiscale.disabled = false;
        anagraficaSessoM.disabled = false;
        anagraficaSessoF.disabled = false;
        anagraficaIndirizzoDomicilio.disabled = false;
        anagraficaIndirizzoResidenza.disabled = false;
        anagraficaSalvaBtn.disabled = false;
    } else {
        anagraficaAbilitaModifica.innerHTML = "Abilita Modifica";
        anagraficaDataNascita.disabled = true;
        anagraficaProvinciaNascita.disabled = true;
        anagraficaNumeroTelefono.disabled = true;
        anagraficaStatoOrigine.disabled = true;
        anagraficaCodiceFiscale.disabled = true;
        anagraficaSessoM.disabled = true;
        anagraficaSessoF.disabled = true;
        anagraficaIndirizzoDomicilio.disabled = true;
        anagraficaIndirizzoResidenza.disabled = true;
        anagraficaSalvaBtn.disabled = true;
    }
});

if (dataUser.hasOwnProperty('profile')) {

    let userProfile = dataUser.profile;
    console.log(userProfile);

    anagraficaDataNascita.value = userProfile.dNascita;
    anagraficaProvinciaNascita.value = userProfile.comNascita;
    anagraficaCodiceFiscale.value = userProfile.codiceFiscale;
    anagraficaStatoOrigine.value = userProfile.statoOrigine;
    anagraficaNumeroTelefono.value = userProfile.telefono;
    anagraficaIndirizzoDomicilio.value = userProfile.inDomicilio;
    anagraficaIndirizzoResidenza.value = userProfile.indResidenza;


    if (userProfile.gender == true) {
        anagraficaSessoM.checked = true;
    } else {
        anagraficaSessoF.checked = true;
    }

}else{
    alert("Profilo mancante!");
}

async function editProfilo(jsonData) {

    const response = await fetch('http://localhost:8080/hrport/user/update-profile-no-attachments', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(jsonData)
    });

    const result = await response.json();

    console.log(result);

    if (result.error != null) {
        alert("error");
    }

    if (response.ok) {
        alert("ok");
        anagraficaAbilitaModifica.click();
    }
}

anagraficaSalvaBtn.addEventListener('click', e => {
    let listaProvinceResults = document.querySelector('#lista_province option[value="' + anagraficaProvinciaNascita.value + '"]');
    if (anagraficaForm.checkValidity() && listaProvinceResults != null && listaProvinceResults != undefined) {

        let datiProfilo = {
            'gender' : anagraficaSessoM.checked,
            'dNascita' : anagraficaDataNascita.value,
            'indResidenza' : anagraficaIndirizzoResidenza.value,
            'inDomicilio' : anagraficaIndirizzoDomicilio.value,
            'telefono' : anagraficaNumeroTelefono.value,
            'codiceFiscale' : anagraficaCodiceFiscale.value,
            'statoOrigine' : anagraficaStatoOrigine.value,
            'comNascita' : anagraficaProvinciaNascita.value
        }

        editProfilo(datiProfilo);

    } else if (listaProvinceResults == null || listaProvinceResults == undefined) {
        alert("Provincia non valida!");
    } else {
        alert("Dati non validi!");
    }
});