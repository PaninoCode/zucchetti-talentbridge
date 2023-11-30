<script>
	async function uploadFile() {
	    const fileInput = document.getElementById("curriculum_upload");
	    const file = fileInput.files[0];
		console.log("entro")
	
	    if (file) {
	        const formData = new FormData();
	        formData.append('file', file);
	
	        const response = await fetch('http://localhost:8080/hrport/upload-image-profile', {
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
</script>