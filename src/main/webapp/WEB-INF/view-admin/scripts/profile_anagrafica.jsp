<script>
    let anagraficaForm = document.querySelector('#anagrafica_form');

    let anagraficaInfoText = document.querySelector('#anagrafica_info_text');
    let anagraficaSuccessText = document.querySelector('#anagrafica_success_text');
    let anagraficaErrorText = document.querySelector('#anagrafica_error_text');

    let anagraficaDataNascita = document.querySelector('#anagrafica_data_nascita');
    let anagraficaProvinciaNascita = document.querySelector('#anagrafica_provincia_nascita');
    let anagraficaNumeroTelefono = document.querySelector('#anagrafica_numero_telefono');
    let anagraficaStatoOrigine = document.querySelector('#anagrafica_stato_origine');
    let anagraficaCodiceFiscale = document.querySelector('#anagrafica_codice_fiscale');
    let anagraficaSessoM = document.querySelector('#anagrafica_sesso_M');
    let anagraficaSessoF = document.querySelector('#anagrafica_sesso_F');
    let anagraficaIndirizzoDomicilio = document.querySelector('#anagrafica_indirizzo_domicilio');
    let anagraficaIndirizzoResidenza = document.querySelector('#anagrafica_indirizzo_residenza');

    if (dataUser.hasOwnProperty('profile')) {

        let userProfile = dataUser.profile;
        // console.log(userProfile);

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
        anagraficaInfoText.classList.remove('d-none');
        anagraficaInfoText.innerHTML = "Profilo non presente! Prima di continuare devi compilare il tuo profilo.";
    }

    if (dataUser.hasOwnProperty('profile')) {
		let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagine_profilo?imgPath=" + dataUser.profile.fotoUrl;

		let anagraficaWidgetProPic = document.querySelector('#anagrafica_propic');

		anagraficaWidgetProPic.style.backgroundImage = "url('" + fotoUrl + "')";
	}
</script>