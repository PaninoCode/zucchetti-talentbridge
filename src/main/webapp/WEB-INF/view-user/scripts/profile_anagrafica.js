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
    }else{
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
}