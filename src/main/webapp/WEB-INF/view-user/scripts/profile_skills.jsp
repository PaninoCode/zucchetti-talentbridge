<script>

    let skillsGestisciCategoriaModal = document.querySelector('#skills_gestisci_categoria_modal');
    let skillsGestisciCategoriaModalNome = document.querySelector('#skills_gestisci_categoria_modal_nome');
    let skillsGestisciCategoriaModalErrorText = document.querySelector('#skills_gestisci_categoria_modal_error_text');
    let skillsGestisciCategoriaModalSalvaBtn = document.querySelector('#skills_gestisci_categoria_modal_salva_btn');
    let skillsGestisciCategoriaModalEliminaBtn = document.querySelector('#skills_gestisci_categoria_modal_elimina_btn');


    let skillsAggiungiCategoriaModal = document.querySelector('#skills_aggiungi_categoria_modal');
    let skillsAggiungiCategoriaModalNome = document.querySelector('#skills_aggiungi_categoria_modal_nome');
    let skillsAggiungiCategoriaModalSkills = document.querySelector('#skills_aggiungi_categoria_modal_skills');
    let skillsAggiungiCategoriaModalAggiungiBtn = document.querySelector('#skills_aggiungi_categoria_modal_aggiungi_btn');

    let skillsCategoryTemplate = document.querySelector('#template_cetegoria_skills');
    let skillPillTemplate = document.querySelector('#template_skill_pill');
    let skillsList = document.querySelector('#skills_list');

    if (dataUser.hasOwnProperty('profile')) {
        if (dataUser.profile.hasOwnProperty('category')) {

            let userCategory = dataUser.profile.category;

            loadSkills(userCategory);

            let newCategory = {};

            skillsGestisciCategoriaModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                let idCategoria = parseInt(btn.getAttribute('data-id-categoria'));

                userCategory.forEach(category => {
                    if (category.idCs == idCategoria) newCategory = category;
                });

                skillsGestisciCategoriaModalNome.value = btn.getAttribute('data-nome-categoria');

            });

            skillsGestisciCategoriaModalSalvaBtn.addEventListener('click', e => {
                if (skillsGestisciCategoriaModalNome.value.length < 3) {
                    skillsGestisciCategoriaModalErrorText.innerHTML = "Inserisci un nome di categoria valido per continuare.";
                    skillsGestisciCategoriaModalErrorText.classList.remove('d-none');
                } else {
                    newCategory.nomeCategoria = skillsGestisciCategoriaModalNome.value;
                    // console.log(newCategory);
                    updateExistingCategoryAndSkills(newCategory, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        skillsGestisciCategoriaModalErrorText.innerHTML = "Errore nell'invio dei dati.";
                        skillsGestisciCategoriaModalErrorText.classList.remove('d-none');
                    });
                }
            });

            skillsGestisciCategoriaModalEliminaBtn.addEventListener('click', e => {
                deleteCategory(newCategory, function (error, data) {
                    if (error == null) {
                        location.reload();
                        return;
                    }

                    skillsGestisciCategoriaModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                    skillsGestisciCategoriaModalErrorText.classList.remove('d-none');
                });
            });


            skillsAggiungiCategoriaModalAggiungiBtn.addEventListener('click', e => {
                let insertCategory = {
                    nomeCategoria: skillsAggiungiCategoriaModalNome.value,
                    skills: []
                }

                let newSkills = skillsAggiungiCategoriaModalSkills.value.split("\n");
                
                newSkills.forEach(skill => {
                    insertCategory.skills.push({nomeSkill: skill});
                });

                newCategoryAndSkills(insertCategory, function (error, data) {
                    if (error == null) {
                        location.reload();
                        return;
                    }
                });
            });

        }
    }


    async function deleteCategory(category, callback) {

        const response = await fetch('http://localhost:8080/hrport/user/delete-category/' + category.idCs, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
            callback(result.error, null);
        }

        if (response.ok) {
            callback(null, result);
        }
    }

    async function newCategoryAndSkills(category, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/insert-category-and-skills', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(category)
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
            callback(result.error, null);
        }

        if (response.ok) {
            callback(null, result);
        }
    }

    async function updateExistingCategoryAndSkills(category, callback) {
        const response = await fetch('http://localhost:8080/hrport/user/insert-category-and-skills', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(category)
        });

        const result = await response.json();

        // console.log(result);

        if (result.error != null) {
            callback(result.error, null);
        }

        if (response.ok) {
            callback(null, result);
        }
    }

    function loadSkills(userCategory) {

        skillsList.innerHTML = "";

        userCategory.forEach(category => {
            // console.log(category);
            skillsList.innerHTML += skillsCategoryTemplate.innerHTML
                .replaceAll('{nome_categoria}', category.nomeCategoria)
                .replaceAll('{id_categoria}', category.idCs)
                .replaceAll('{skills_pills}', createSkillPillsHTML(category.skills));
        });
    }

    function createSkillPillsHTML(skills) {
        let htmlResult = "";

        if (skills.length < 1) {
            htmlResult = "<p>Nessuna skill per questa categoria</p>";
            return htmlResult;
        }

        skills.forEach(skill => {
            htmlResult += skillPillTemplate.innerHTML.replaceAll('{nome_skill}', skill.nomeSkill);
        });

        return htmlResult;
    }
</script>