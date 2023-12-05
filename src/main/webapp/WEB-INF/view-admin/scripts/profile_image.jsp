<script>
	if (dataUser.hasOwnProperty('profile')) {
		let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagine_profilo?imgPath=" + dataUser.profile.fotoUrl;

		let anagraficaWidgetProPic = document.querySelector('#anagrafica_propic');

		pdfDownloadBtn.addEventListener('click', e => { pdfDownloadLink.click(); });

		anagraficaWidgetProPic.style.backgroundImage = "url('" + fotoUrl + "')";
	}else{
		uploadImageProfile.disabled = true;
	}
</script>