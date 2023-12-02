<script>
	async function uploadImage() {
	    const fileInput = document.getElementById("anagrafica_foto_upload");
	    const file = fileInput.files[0];
		console.log("entro")
	
	    if (file) {
	        const formData = new FormData();
	        formData.append('file', file);
	
	        const response = await fetch('http://localhost:8080/hrport/app/upload-attachment/immagine_profilo', {
	            method: 'POST',
	            body: formData
	        });

			const result = await response.text();
			console.log(result);
	        
	    } else {
	        console.error('No file selected');
	    }
	}
	
	let uploadImageProfile = document.getElementById("image_upload_profile");

	uploadImageProfile.addEventListener('click', function() {
		
		uploadImage();
	})
</script>