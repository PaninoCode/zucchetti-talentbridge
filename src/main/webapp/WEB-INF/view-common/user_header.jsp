<nav class="navbar navbar-expand-lg bg-white fixed-top shadow-sm" data-bs-theme="light">
    <div class="container-fluid">
        <a class="navbar-brand display-6" href="#">TalentBridge</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" id="menu_link_posizioni" href="posizioni.jsp">Posizioni</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="menu_link_candidati" href="candidati.jsp">Candidati</a>
                </li>

            </ul>
        </div>


        <div class="dropdown">
            <button
                class="btn btn-outline-secondary text-dark dropdown-toggle d-flex justify-content-center align-items-center fs-5"
                type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd"
                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
                <div class="m-1"></div>
                Profilo
            </button>
            <div class="dropdown-menu dropdown-menu-end border border-primary shadow-sm">
                <jsp:include page='profile_widget.jsp'>
                    <jsp:param name="profileType" value="Candidato" />
                </jsp:include>
            </div>
        </div>
    </div>
</nav>
<div style="height: 5rem;"></div>


<script>
    document.getElementById('menu_link_${param.activeLinkId}').classList.add('active');
</script>