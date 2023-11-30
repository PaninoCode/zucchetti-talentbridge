<script>
	function uploadFile() {
	    const fileInput = document.getElementById("curriculum_upload");
	    const file = fileInput.files[0];
	
	    if (file) {
	        const formData = new FormData();
	        formData.append('file', file);
	
	        fetch('/your-servlet-url', {
	            method: 'POST',
	            body: formData
	        })
	        .then(response => response.text())
	        .then(result => {
	            console.log(result);
	            // Handle the server response if needed
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    } else {
	        console.error('No file selected');
	    }
	}
	
	let uploadCurriculum = document.getElementById("pdf_upload_curriculum");

	uploadCurriculum.addEventListener('click', function() {
		
		uploadFile();
	})
</script>