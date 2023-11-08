<%@ page contentType="text/html;charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="resources/css/custom/custom.css" rel="stylesheet">
</head>

<body class="bg-body-tertiary">

    <!-- Password Recovery Modal -->
    <div class="modal fade" id="password_recovery_modal" tabindex="-1" aria-labelledby="password_recovery_modal_label"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border border-2 border-primary">
                <div class="modal-header bg-body-tertiary">
                    <h1 class="modal-title fs-5" id="password_recovery_modal_label">Recupero Password</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="password_recovery_modal_status_text"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex flex-column justify-content-center align-items-center w-100 h-100">
        <div class="mb-5">
            <h1 class="text-primary m-0 display-4">TalentBridge</h1>
            <div class="d-flex flex-row justify-content-center align-items-center">
                <hr class="border border-primary border-2 opacity-100 w-100">
                <h4 class="p-0 m-0">&nbsp;GRUPPO&nbsp;ZUCCHETTI&nbsp;</h4>
                <hr class="border border-primary border-2 opacity-100 w-100">
            </div>
        </div>
        <h2 class="mb-2">Accedi</h2>
        <div class="alert alert-danger d-none" style="width: 450px;" id="login_form_error_text" role="alert">

        </div>
        <div class="container bg-white border border-2 border-primary rounded-4 p-4 shadow mb-5" style="width: 450px;">
            <div class="container d-flex justify-content-center align-items-center mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="95" height="95" fill="currentColor"
                    class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
                </svg>
            </div>
            <form action="/hrport/loginUser" method="post" id="login_form" class="needs-validation" novalidate>
                <div class="position-relative mb-3">
                    <label for="login_input_email" class="form-label">
                        <h4>Email</h4>
                    </label>
                    <input name="email" type="email" class="form-control" placeholder="namito.kawamoto@gmail.com"
                        id="login_input_email" required>
                    <div class="invalid-tooltip">
                        Inserisci la tua email
                    </div>
                </div>
                <div class="position-relative mb-4">
                    <label for="login_input_password" class="form-label">
                        <h4>Password</h4>
                    </label>
                    <div class="d-flex justify-content-center align-items-center position-relative">
                        <input name="password" type="password" class="form-control" placeholder="password" id="login_input_password"
                            required>
                        <div class="position-absolute end-0 bg-white m-2">
                            <svg id="login_eye_show" xmlns="http://www.w3.org/2000/svg" width="26" height="26"
                                fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                                <path
                                    d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                            </svg>
                            <svg id="login_eye_hide" xmlns="http://www.w3.org/2000/svg" width="26" height="26"
                                fill="currentColor" class="bi bi-eye-slash-fill d-none" viewBox="0 0 16 16">
                                <path
                                    d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7.029 7.029 0 0 0 2.79-.588zM5.21 3.088A7.028 7.028 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474L5.21 3.089z" />
                                <path
                                    d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829l-2.83-2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12-.708.708z" />
                            </svg>
                        </div>
                    </div>
                    <div class="invalid-tooltip">
                        Inserisci la tua password
                    </div>
                </div>
                <div class="d-flex flex-row justify-content-between align-items-center mb-4">
                    <a href="#" id="login_btn_password_recovery" class="m-0">Recupera password</a>
                    <button type="submit" class="btn btn-primary text-light">
                        <h5 class="m-0">Accedi</h5>
                    </button>
                </div>
                <p class="text-center m-0">
                    <a href="/hrport/register">Non hai un account? &dash; Registrati</a>
                </p>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@barba/core"></script>
    <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
    <script>
    	let error = `<%=response.getHeader("data")%>`;
    	if(error != "null") console.log(error)
    
        let loginForm = document.querySelector('#login_form');
        let loginBtnPasswordRecovery = document.querySelector('#login_btn_password_recovery');

        let loginInputEmail = document.querySelector('#login_input_email');
        let loginInputPassword = document.querySelector('#login_input_password');

        let loginFormErrorText = document.querySelector('#login_form_error_text');

        loginForm.addEventListener('submit', e => {
            e.preventDefault()
            e.stopPropagation()
            if (loginForm.checkValidity()) {
                loginFormErrorText.innerHTML = "Niente...";
                loginFormErrorText.classList.remove('d-none');
                loginForm.submit();
            }

            loginForm.classList.add('was-validated');
        });

        const passwordRecoveryModal = new bootstrap.Modal('#password_recovery_modal', {});
        let passwordRecoveryModalStatusText = document.querySelector('#password_recovery_modal_status_text');

        loginBtnPasswordRecovery.addEventListener('click', e => {
            e.preventDefault();
            if (!loginInputEmail.checkValidity()) {
                passwordRecoveryModalStatusText.innerHTML = "Per poter procedere con il recupero della password, inserisci un indirizzo email valido nel campo <b>\"Email\"</b>";
            } else {
                passwordRecoveryModalStatusText.innerHTML = "Procedura di recupero della password avviata correttamente; <b>Controlla la tua casella email per continuare.</b>";
            }
            passwordRecoveryModal.show();
        });

        let loginEyeShow = document.querySelector('#login_eye_show');
        let loginEyeHide = document.querySelector('#login_eye_hide');

        loginEyeShow.addEventListener('click', e => {
            loginInputPassword.type = 'text';
            loginEyeShow.classList.add('d-none');
            loginEyeHide.classList.remove('d-none');
        });

        loginEyeHide.addEventListener('click', e => {
            loginInputPassword.type = 'password';
            loginEyeHide.classList.add('d-none');
            loginEyeShow.classList.remove('d-none');
        });
    </script>
</body>

</html>