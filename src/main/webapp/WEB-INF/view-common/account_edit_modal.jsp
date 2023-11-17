<div class="modal fade" id="account_data_modal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border border-2 border-primary">
            <div class="modal-header bg-body-tertiary">
                <h1 class="modal-title fs-5 d-flex flex-row justify-content-start align-items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                        class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                        <path
                            d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
                    </svg>
                    <span class="m-2"></span>
                    Gestione Account
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-center align-items-start">
                    <form id="edit_account_data" class="needs-validation" style="width: 50%;" novalidate>

                        <h4>
                            Dati Personali
                        </h4>

                        <hr>

                        <div class="position-relative d-flex flex-row justify-content-center align-items-center mb-2">
                            <div>
                                <label for="edit_user_input_name" class="form-label">
                                    <h5>Nome</h5>
                                </label>
                                <input id="edit_user_input_name" type="text" class="form-control" placeholder="Namito"
                                    value="Mario" minlength="3" required>
                                <div class="invalid-tooltip">
                                    Nome
                                </div>
                            </div>
                            <div class="m-1"></div>
                            <div>
                                <label for="edit_user_input_surname" class="form-label">
                                    <h5>Cognome</h5>
                                </label>
                                <input id="edit_user_input_surname" type="text" class="form-control"
                                    placeholder="Kawamoto" value="Rossi" minlength="3" required>
                                <div class="invalid-tooltip">
                                    Cognome
                                </div>
                            </div>
                        </div>
                        <div class="position-relative  mb-3">
                            <label for="edit_user_input_email" class="form-label">
                                <h5>Indirizzo Email</h5>
                            </label>
                            <input id="edit_user_input_email" type="email" class="form-control"
                                placeholder="namito.kawamoto@gmail.com" value="mario.rossi@libero.it" minlength="5"
                                required>
                            <div class="invalid-tooltip">
                                Indirizzo Email
                            </div>
                        </div>

                        <div class="d-flex flex-row justify-content-end align-items-center mb-4">
                            <button type="submit" class="btn btn-primary text-light">
                                <h5 class="m-0">Salva</h5>
                            </button>
                        </div>

                    </form>
                    <span class="m-4"></span>
                    <form id="edit_account_password" class="needs-validation" style="width: 50%;" novalidate>

                        <h4>
                            Password
                        </h4>

                        <hr>

                        <div class="position-relative mb-4">
                            <label for="edit_account_password_input_old_password" class="form-label">
                                <h5>Vecchia Password</h5>
                            </label>
                            <input type="password" class="form-control" placeholder="password"
                                id="edit_account_password_input_old_password" minlength="8" required>
                            <div class="invalid-tooltip">
                                Vecchia Password
                            </div>
                        </div>
                        <div class="position-relative mb-4">
                            <label for="edit_account_password_input_new_password" class="form-label">
                                <h5>Nuova Password</h5>
                            </label>
                            <input type="password" class="form-control" placeholder="password"
                                id="edit_account_password_input_new_password" minlength="8" required>
                            <div class="invalid-tooltip">
                                Nuova Password
                            </div>
                        </div>
                        <div class="position-relative mb-4">
                            <label for="edit_account_password_input_confirm_new_password" class="form-label">
                                <h5>Conferma nuova Password</h5>
                            </label>
                            <input type="password" class="form-control" placeholder="password"
                                id="edit_account_password_input_confirm_new_password" minlength="8" required>
                            <div class="invalid-tooltip">
                                Conferma nuova la password
                            </div>
                        </div>

                        <div class="d-flex flex-row justify-content-end align-items-center mb-4">
                            <button type="submit" class="btn btn-primary text-light">
                                <h5 class="m-0">Modifica Password</h5>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline-secondary text-dark"
                    data-bs-dismiss="modal">
                    <h5 class="m-0">Annulla</h5>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- modal script -->
<script>
    const accountDataModal = new bootstrap.Modal('#account_data_modal', {});
    let accountDataModalEl = document.querySelector('#account_data_modal');

    let accountEditInputName = document.querySelector('#edit_user_input_name');
    let accountEditInputSurname = document.querySelector('#edit_user_input_surname');
    let accountEditInputEmail = document.querySelector('#edit_user_input_email');

    accountDataModalEl.addEventListener('show.bs.modal', e => {

        async function callDatiUtente() {

            const response = await fetch('http://localhost:8080/hrport/app/get-info-user', {
                method: 'GET'
            });

            const result = await response.json();

            accountEditInputName.value = result.nome;
            accountEditInputSurname.value = result.cognome;
            accountEditInputEmail.value = result.email;

            console.log(result);

            if (result.error != null) {
                loginFormErrorText.classList.remove('d-none');
                loginFormErrorText.innerHTML = result.error;
            }

            if (response.ok) {

            }
        }

        callDatiUtente();
    });


</script>