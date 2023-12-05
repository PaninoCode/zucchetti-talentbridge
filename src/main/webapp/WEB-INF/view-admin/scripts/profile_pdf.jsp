<script>
	let pdfDownloadBtn = document.querySelector('#download_pdf_btn');

	if (dataUser.hasOwnProperty('profile')) {
		let fileUrl = "http://localhost:8080/hrport/app/getAttachment/pdf?imgPath=" + dataUser.profile.fileUrl;

		let pdfDisplayObject = document.querySelector('#pdf_display_object');
		let pdfDownloadLink = document.querySelector('#pdf_download_link');

		pdfDownloadBtn.addEventListener('click', e => { pdfDownloadLink.click(); });

		pdfDisplayObject.data = fileUrl;
		pdfDownloadLink.href = fileUrl;
	}else{
		uploadCurriculum.disabled = true;
	}
</script>