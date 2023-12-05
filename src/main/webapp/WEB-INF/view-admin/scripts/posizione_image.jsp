<script>
	
let JSPquiz = `<%=request.getAttribute("data")%>`;
let jsonQuiz = JSON.parse(JSPquiz);


 // Get the select element
var selectBoxQuiz = document.getElementById("quizSelect");

// Populate the select box with options
jsonQuiz.forEach(function(position) {
    var option = document.createElement("option");
    option.value = position.id;
    option.text = position.nome;
    selectBoxQuiz.add(option);
});

console.log(selectBoxQuiz.value);
console.log(jsonQuiz[selectBoxQuiz.value-1]);
console.log(jsonQuiz);

	async function addPosizione() {
		
		//FILE INSERITO
	    const fileInput = document.getElementById("foto_upload");
	    const file = fileInput.files[0];
	    
	  
	    
	    let form = document.getElementById('insertForm');
        
	    //POSIZIONE
        let nomePosizione = form.querySelector('#input_nome_posizione').value;
        let stato = true;
        let descrizione = form.querySelector('#input_descrizione').value;
        
        //CREO LA POSIZIONE
        let positionData = {
        		nome: nomePosizione,
        		aperta: stato,
        		descrizione: descrizione
        }
        
       
        
        //QUIZ SELEZIONATO
		let quizSelected = jsonQuiz[selectBoxQuiz.value-1]; 
		
		
        if (file) {
        	alert("ok");
            const formData = new FormData();
            formData.append('file', file);
            formData.append('posData', JSON.stringify(positionData));
            formData.append('quiz', JSON.stringify(quizSelected));
           
             for (var key of formData.entries()) {
        		console.log(key[0] + ', ' + key[1]);
   				 }
            try {
                const response = await fetch('http://localhost:8080/hrport/admin/insert-new-position', {
                    method: 'POST',
                    body: formData
                });

                if (!response.ok) {
                	alert("not ok");
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }

                const result = await response.text();
                console.log(result);
            } catch (error) {
                console.error('Fetch error:', error.message);
                // Handle the error as needed, e.g., show an error message to the user
            }
        } else {
            console.error('No file selected');
            // Handle the case where no file is selected
        }
    }
	
	/*
	let uploadImageProfile = document.getElementById("posizione_foto_upload");

	uploadImageProfile.addEventListener('click', function() {
		
		uploadImage();
	})

	if (dataUser.hasOwnProperty('profile')) {
		let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagine_profilo?imgPath=" + dataUser.profile.fotoUrl;

		let anagraficaWidgetProPic = document.querySelector('#anagrafica_propic');

		pdfDownloadBtn.addEventListener('click', e => { pdfDownloadLink.click(); });

		anagraficaWidgetProPic.style.backgroundImage = "url('" + fotoUrl + "')";
	}*/
</script>