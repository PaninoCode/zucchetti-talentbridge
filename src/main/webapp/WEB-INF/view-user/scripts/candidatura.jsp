<script>
const jsConfetti = new JSConfetti();

let btnInviaCandidatura = document.querySelector('#btn_invia_candidatura');
let btnRitiraCandidatura = document.querySelector('#btn_ritira_candidatura');

btnInviaCandidatura.addEventListener('click', e => {
    addCandidatura();
});

btnRitiraCandidatura.addEventListener('click', e => {
    removeCandidatura();
});


function addCandidatura(){
    jsConfetti.addConfetti()
    btnInviaCandidatura.classList.add('d-none');
    btnRitiraCandidatura.classList.remove('d-none');
}

function removeCandidatura(){
    btnRitiraCandidatura.classList.add('d-none');
    btnInviaCandidatura.classList.remove('d-none');
}


</script>