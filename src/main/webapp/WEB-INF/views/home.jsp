<%@ page contentType="text/html;charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TalentBridge</title>
    <link href="resources/css/custom/custom.css" rel="stylesheet">

</head>
<body class="bg-body-tertiary">
    <nav class="navbar navbar-expand-lg bg-white sticky-top" data-bs-theme="light">
        <div class="container-fluid">
            <a class="navbar-brand display-6" href="#">TalentBridge</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Features</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu border border-primary shadow-sm">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider border border-primary opacity-100">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <button type="submit" class="btn btn-outline-secondary text-dark">
                <h5 class="m-0">Accedi</h5>
            </button>
            <div class="m-1"></div>
            <button type="submit" class="btn btn-primary text-light">
                <h5 class="m-0">Registrati</h5>
            </button>
        </div>
    </nav>

    <section style="height: 100vh;">

    </section>

    <div class="container-fluid bg-white shadow">
        <div class="container p-4">
            <footer class="py-3 my-4">
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
                </ul>
                <div class="d-flex flex-column justify-content-center align-items-center w-100 h-100">
                    <div class="mb-2">
                        <h1 class="text-primary m-0 display-4">TalentBridge</h1>
                        <div class="d-flex flex-row justify-content-center align-items-center">
                            <hr class="border border-primary border-2 opacity-100 w-100">
                            <h4 class="p-0 m-0">&nbsp;GRUPPO&nbsp;ZUCCHETTI&nbsp;</h4>
                            <hr class="border border-primary border-2 opacity-100 w-100">
                        </div>
                    </div>
                </div>
                <p class="text-center text-body-secondary">Â© 2023 TalentBridge</p>
            </footer>
        </div>
    </div>

    <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@barba/core"></script>

</body>
</html>