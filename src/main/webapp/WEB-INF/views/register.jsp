<%@ page contentType="text/html;charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrati</title>
    <link href="resources/css/custom/custom.css" rel="stylesheet">
</head>

<body class="bg-body-tertiary">

    <div class="d-flex flex-column justify-content-center align-items-center w-100 h-100">
        <div class="mb-5">
            <h1 class="text-primary m-0 display-4">TalentBridge</h1>
            <div class="d-flex flex-row justify-content-center align-items-center">
                <hr class="border border-primary border-2 opacity-100 w-100">
                <h4 class="p-0 m-0">&nbsp;GRUPPO&nbsp;ZUCCHETTI&nbsp;</h4>
                <hr class="border border-primary border-2 opacity-100 w-100">
            </div>
        </div>
        <h2 class="mb-2">Registrati</h2>
        <div class="alert alert-danger d-none" style="width: 450px;" id="register_form_error_text" role="alert">
                
        </div> 
        <div class="container bg-white border border-2 border-primary rounded-4 shadow p-0 mb-5" style="width: 450px;">
            <div class="accordion accordion-flush bg-transparent m-0 mb-4" id="register_steps_accordion">

                <div class="accordion-item bg-transparent">
                    <h2 class="accordion-header">
                        <button class="accordion-button rounded-top-4" type="button" data-bs-toggle="collapse"
                            data-bs-target="#register_steps_accordion_step_one" aria-expanded="false"
                            aria-controls="flush-collapseOne" disabled>
                            Dati Personali
                        </button>
                    </h2>
                    <div id="register_steps_accordion_step_one" class="accordion-collapse collapse show"
                        data-bs-parent="#register_steps_accordion">
                        <div class="accordion-body p-4">
                            <form id="register_steps_form_step_one" class="needs-validation" novalidate>
                                <div
                                    class="position-relative d-flex flex-row justify-content-center align-items-center mb-2">
                                    <div>
                                        <label for="register_input_name" class="form-label">
                                            <h4>Nome</h4>
                                        </label>
                                        <input id="register_input_name" type="text" class="form-control"
                                            placeholder="Namito" minlength="3" required>
                                        <div class="invalid-tooltip">
                                            Inserisci un nome valido
                                        </div>
                                    </div>
                                    <div class="m-1"></div>
                                    <div>
                                        <label for="register_input_surname" class="form-label">
                                            <h4>Cognome</h4>
                                        </label>
                                        <input id="register_input_surname" type="text" class="form-control"
                                            placeholder="Kawamoto" minlength="3" required>
                                        <div class="invalid-tooltip">
                                            Inserisci un cognome valido
                                        </div>
                                    </div>
                                </div>
                                <div class="position-relative  mb-3">
                                    <label for="register_input_email" class="form-label">
                                        <h4>Email</h4>
                                    </label>
                                    <input id="register_input_email" type="email" class="form-control"
                                        placeholder="namito.kawamoto@gmail.com" minlength="5" required>
                                    <div class="invalid-tooltip">
                                        Inserisci un indirizzo email valido
                                    </div>
                                </div>
                                <div class="d-flex flex-row justify-content-end align-items-center mb-4">
                                    <button id="register_steps_btn_step_one" type="submit"
                                        class="btn btn-primary text-light">
                                        <h5 class="m-0">Continua</h5>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="accordion-item bg-transparent">
                    <h2 class="accordion-header bg-transparent">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#register_steps_accordion_step_two" aria-expanded="false"
                            aria-controls="flush-collapseOne" disabled>
                            Password
                        </button>
                    </h2>
                    <div id="register_steps_accordion_step_two" class="accordion-collapse collapse"
                        data-bs-parent="#register_steps_accordion">
                        <div class="accordion-body p-4">
                            <form id="register_steps_form_step_two" class="needs-validation" novalidate>
                                <div class="position-relative mb-4">
                                    <label for="register_input_password" class="form-label">
                                        <h4>Password</h4>
                                    </label>
                                    <input type="password" class="form-control" placeholder="password"
                                        id="register_input_password" minlength="8" required>
                                    <div class="invalid-tooltip">
                                        Inserisci una password valida
                                    </div>
                                </div>
                                <div class="position-relative mb-4">
                                    <label for="register_input_confirm_password" class="form-label">
                                        <h4>Conferma Password</h4>
                                    </label>
                                    <input type="password" class="form-control" placeholder="password"
                                        id="register_input_confirm_password" minlength="8" required>
                                    <div class="invalid-tooltip">
                                        Conferma la password
                                    </div>
                                </div>
                                <div class="position-relative form-check mb-4">
                                    <input id="register_check_tos" type="checkbox" class="form-check-input"
                                        id="validationFormCheck1" required>
                                    <label class="form-check-label" for="validationFormCheck1">Accetto la Politica sulla
                                        Privacy e i Termini di Servizio</label>
                                    <div class="invalid-tooltip">Conferma di aver accettato per continuare</div>
                                </div>
                                <div class="d-flex flex-row justify-content-between align-items-center mb-4">
                                    <a href="#" id="register_steps_btn_back_step_two" class="m-0">Torna indietro</a>
                                    <button id="register_steps_btn_step_two" type="submit"
                                        class="btn btn-primary text-light">
                                        <h5 class="m-0">Registrati</h5>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <p class="text-center mb-4">
                <a href="/hrport/login">Hai giÃ  un account? &dash; Accedi</a>
            </p>
        </div>
    </div>

    <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
    <script>
        let registerStepOneControl = document.querySelector('[data-bs-target="#register_steps_accordion_step_one"]');
        let registerStepOneContent = document.querySelector('#register_steps_accordion_step_one');
        let registerStepOneBtn = document.querySelector('#register_steps_btn_step_one');
        let registerStepOneForm = document.querySelector('#register_steps_form_step_one');

        let registerStepTwoControl = document.querySelector('[data-bs-target="#register_steps_accordion_step_two"]');
        let registerStepTwoContent = document.querySelector('#register_steps_accordion_step_two');
        let registerStepTwoBtn = document.querySelector('#register_steps_btn_step_two');
        let registerStepTwoBackBtn = document.querySelector('#register_steps_btn_back_step_two');
        let registerStepTwoForm = document.querySelector('#register_steps_form_step_two');

        let registerInputName = document.querySelector('#register_input_name');
        let registerInputSurname = document.querySelector('#register_input_surname');
        let registerInputEmail = document.querySelector('#register_input_email');


        let registerInputPassword = document.querySelector('#register_input_password');
        let registerInputConfirmPassword = document.querySelector('#register_input_confirm_password');
        let registerCheckTos = document.querySelector('#register_check_tos');

        let registerFormErrorText = document.querySelector('#register_form_error_text');

        registerStepOneForm.addEventListener('submit', e => {
            e.preventDefault()
            e.stopPropagation()
            if (registerStepOneForm.checkValidity()) {
                registerStepOneControl.classList.add('collapsed');
                registerStepOneContent.classList.remove('show');

                registerStepTwoControl.classList.remove('collapsed');
                registerStepTwoContent.classList.add('show');
            }

            registerStepOneForm.classList.add('was-validated');
        });

        registerInputPassword.addEventListener('keyup', checkPasswordConfirm);
        registerInputConfirmPassword.addEventListener('keyup', checkPasswordConfirm);

        registerStepTwoForm.addEventListener('submit', e => {
            e.preventDefault()
            e.stopPropagation()
            checkPasswordConfirm()

            if (registerStepTwoForm.checkValidity()) {
                registerFormErrorText.innerHTML = "Niente...";
                registerFormErrorText.classList.remove('d-none');
                
            	/* fetch api */
            	let jsonData = {
					"email": registerInputEmail.value,
					"password": registerInputPassword.value,
					"admin": 0,
					"nome": registerInputName.value,
					"cognome": registerInputSurname.value
				}
				
				async function callRegistration() {
					
					const response = await fetch('http://localhost:8080/hrport/registration', {
					    method: 'POST',
					    headers: {
					        'Content-Type': 'application/json'
					    },
					    body: JSON.stringify(jsonData)
					});
					
					const result = await response.json();
					 
	            	console.log(result);
	            	
	            	if(response.ok) {
						
		            	setTimeout(() => {
							
			            	location.href = "http://localhost:8080/hrport/index.jsp";
						}, 2000)
					}
				}
				
				callRegistration();
            }

            registerStepTwoForm.classList.add('was-validated');
        });

        function checkPasswordConfirm(){
            if (registerInputPassword.value != registerInputConfirmPassword.value) {
                registerInputConfirmPassword.setCustomValidity('Conferma la password');
            } else {
                registerInputConfirmPassword.setCustomValidity('');
            }
        }

        registerStepTwoBackBtn.addEventListener('click', e => {
            registerStepTwoControl.classList.add('collapsed');
            registerStepTwoContent.classList.remove('show');

            registerStepOneControl.classList.remove('collapsed');
            registerStepOneContent.classList.add('show');
        });

    </script>
</body>

</html>