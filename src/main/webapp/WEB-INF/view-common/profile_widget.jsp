<div class="container p-2" style="width: 350px;">
    <span class="mb-2"></span>
    <div class="text-center">
	    <div class="d-flex justify-content-center align-items-center">
	        <h1 class="rounded-circle bg-primary text-light d-flex justify-content-center align-items-center" style="width: 120px; height: 120px;" id="profile_widget_propic">
	        	MR
	        </h1>
	    </div>
        <p class="fs-4" id="profile_widget_full_name">Mario Rossi</p>

        <div class="d-flex flex-row justify-content-center" id="profile_widget_roles"></div>

    </div>

    <span class="m-4"></span>

    <ul class="list-group list-group-flush">
        <li class="list-group-item d-flex flex-row justify-content-start align-items-center" style="cursor: pointer;" id="profile_widget_edit_account_btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                <path
                    d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
            </svg>
            <span class="m-2"></span>
            Modifica Account Utente
        </li>
        <li class="list-group-item d-flex flex-row justify-content-start align-items-center" style="cursor: pointer;" id="profile_widget_logout_btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                    d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z" />
                <path fill-rule="evenodd"
                    d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z" />
            </svg>
            <span class="m-2"></span>
            Esci
        </li>
    </ul>

</div>
</div>


<script>

    let profileTypes = '${param.profileType}'.split(',');

    const profileWidgetRoles = document.querySelector('#profile_widget_roles');
    const profileWidgetEditAccountBtn = document.querySelector('#profile_widget_edit_account_btn');
    const profileWidgetEditLogoutBtn = document.querySelector('#profile_widget_logout_btn');

    profileTypes.forEach(type => {
        profileWidgetRoles.innerHTML += '<span class="badge rounded-pill text-bg-info">' + type + '</span>';
    });

    profileWidgetEditAccountBtn.addEventListener('click', e => {
        accountDataModal.show(); 
    });

    profileWidgetEditLogoutBtn.addEventListener('click', e => {
        location.href = "<%=request.getContextPath()%>/app/logout";
    });
    

	let profileWidgetProPic = document.querySelector('#profile_widget_propic');
	let profileWidgetFullName = document.querySelector('#profile_widget_full_name');

    async function callDatiWidgetProfilo() {

        const response = await fetch('http://localhost:8080/hrport/app/get-info-user', {
            method: 'GET'
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
        	alert("Si e' presentato un errore nel caricamento dei dati utente.");
        }

        if (response.ok) {
            profileWidgetFullName.innerHTML = result.nome + " " + result.cognome;
        profileWidgetProPic.innerHTML = result.nome[0] + result.cognome[0];
        }
    }

    callDatiWidgetProfilo();


</script>