<script>
	async function uploadFile() {
	    const fileInput = document.getElementById("curriculum_upload");
	    const file = fileInput.files[0];
		console.log("entro")
	
		console.log(file);

	    if (file) {
	        const formData = new FormData();
	        formData.append('file', file);
	
	        const response = await fetch('http://localhost:8080/hrport/app/upload-attachment/pdf', {
	            method: 'POST',
	            body: formData
	        });

			const result = await response.text();
			console.log(result);
	        
	    } else {
	        console.error('No file selected');
	    }
	}
	
	let uploadCurriculum = document.getElementById("pdf_upload_curriculum");

	uploadCurriculum.addEventListener('click', function() {
		
		uploadFile();
	})

	let pdfDownloadBtn = document.querySelector('#download_pdf_btn');

	if (dataUser.hasOwnProperty('profile')) {
		let fileUrl = "http://localhost:8080/hrport/app/getAttachment/pdf?imgPath=" + dataUser.profile.fileUrl;

		let pdfDisplayObject = document.querySelector('#pdf_display_object');
		let pdfDownloadLink = document.querySelector('#pdf_download_link');

		pdfDownloadBtn.addEventListener('click', e => { pdfDownloadLink.click(); });

		pdfDisplayObject.data = fileUrl;
		pdfDownloadLink.href = fileUrl;
	}
</script>