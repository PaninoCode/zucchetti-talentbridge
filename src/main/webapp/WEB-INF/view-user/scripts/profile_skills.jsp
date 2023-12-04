<script>

    let skillsCard = document.querySelector('#skills_card');
    let skillsAggiungiOpenModalBtn = document.querySelector('#skills_aggiungi_openmodal_btn');

    let skillsGestisciCategoriaModal = document.querySelector('#skills_gestisci_categoria_modal');
    let skillsGestisciCategoriaModalNome = document.querySelector('#skills_gestisci_categoria_modal_nome');
    let skillsGestisciCategoriaModalErrorText = document.querySelector('#skills_gestisci_categoria_modal_error_text');
    let skillsGestisciCategoriaModalSalvaBtn = document.querySelector('#skills_gestisci_categoria_modal_salva_btn');
    let skillsGestisciCategoriaModalEliminaBtn = document.querySelector('#skills_gestisci_categoria_modal_elimina_btn');


    let skillsAggiungiCategoriaModal = document.querySelector('#skills_aggiungi_categoria_modal');
    let skillsAggiungiCategoriaModalNome = document.querySelector('#skills_aggiungi_categoria_modal_nome');
    let skillsAggiungiCategoriaModalSkills = document.querySelector('#skills_aggiungi_categoria_modal_skills');
    let skillsAggiungiCategoriaModalErrorText = document.querySelector('#skills_aggiungi_categoria_modal_error_text');
    let skillsAggiungiCategoriaModalAggiungiBtn = document.querySelector('#skills_aggiungi_categoria_modal_aggiungi_btn');

    let skillsGestisciSkillsModal = document.querySelector('#skills_gestisci_skill_modal');
    let skillsGestisciSkillsModalNome = document.querySelector('#skills_gestisci_skill_modal_nome');
    let skillsGestisciSkillsModalErrorText = document.querySelector('#skills_gestisci_skill_modal_error_text');
    let skillsGestisciSkillsModalEliminaBtn = document.querySelector('#skills_gestisci_skill_modal_elimina_btn');
    let skillsGestisciSkillsModalSalvaBtn = document.querySelector('#skills_gestisci_skill_modal_salva_btn');

    let skillsAggiungiSkillsModal = document.querySelector('#skills_aggiungi_skill_modal');
    let skillsAggiungiSkillsModalNome = document.querySelector('#skills_aggiungi_skill_modal_nome');
    let skillsAggiungiSkillsModalErrorText = document.querySelector('#skills_aggiungi_skill_modal_error_text');
    let skillsAggiungiSkillsModalAggiungiBtn = document.querySelector('#skills_aggiungi_skill_modal_aggiungi_btn');

    let skillsInfoText = document.querySelector('#skills_info_text');

    let skillsCategoryTemplate = document.querySelector('#template_cetegoria_skills');
    let skillPillTemplate = document.querySelector('#template_skill_pill');
    let skillsList = document.querySelector('#skills_list');

    if (dataUser.hasOwnProperty('profile')) {
        if (dataUser.profile.hasOwnProperty('category')) {

            let userCategory = dataUser.profile.category;

            loadSkills(userCategory);

            let newCategory = {};

            // GESTISCI CATEGORIA

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


            // AGGIUNGI CATEGORIA

            skillsAggiungiCategoriaModalAggiungiBtn.addEventListener('click', e => {

                if (skillsAggiungiCategoriaModalNome.value < 3 || skillsAggiungiCategoriaModalSkills.value < 3) {
                    skillsAggiungiCategoriaModalErrorText.innerHTML = "Inserisci dei dati validi per continuare.";
                    skillsAggiungiCategoriaModalErrorText.classList.remove('d-none');
                } else {
                    let insertCategory = {
                        nomeCategoria: skillsAggiungiCategoriaModalNome.value,
                        skills: []
                    }

                    let newSkills = skillsAggiungiCategoriaModalSkills.value.split("\n");

                    newSkills.forEach(skill => {
                        insertCategory.skills.push({ nomeSkill: skill });
                    });

                    newCategoryAndSkills(insertCategory, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        skillsAggiungiCategoriaModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        skillsAggiungiCategoriaModalErrorText.classList.remove('d-none');
                    });
                }
            });

            // GESTISCI SKILL

            skillsGestisciSkillsModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                let idCategoria = parseInt(btn.getAttribute('data-id-categoria'));

                userCategory.forEach(category => {
                    if (category.idCs == idCategoria) newCategory = category;
                });

                skillsGestisciSkillsModalNome.value = btn.getAttribute('data-nome-skill');
                skillsGestisciSkillsModal.setAttribute('data-id-skill', btn.getAttribute('data-id-skill'));

            });

            skillsGestisciSkillsModalEliminaBtn.addEventListener('click', e => {
                let idSkill = parseInt(skillsGestisciSkillsModal.getAttribute('data-id-skill'));
                let insertCategory = {
                    idCs: newCategory.idCs,
                    idCv: newCategory.idCv,
                    nomeCategoria: newCategory.nomeCategoria,
                    skills: []
                }
                for (let i = 0; i < newCategory.skills.length; i++) {
                    if (newCategory.skills[i].idSkill != idSkill) {
                        insertCategory.skills.push(newCategory.skills[i]);
                    }
                }
                console.log(newCategory);
                console.log(insertCategory);

                deleteCategory(newCategory, function (error, data) {
                    newCategoryAndSkills(insertCategory, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        skillsGestisciSkillsModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        skillsGestisciSkillsModalErrorText.classList.remove('d-none');
                    });
                });


            });

            skillsGestisciSkillsModalSalvaBtn.addEventListener('click', e => {
                if (skillsGestisciSkillsModalNome.value < 3) {
                    skillsGestisciSkillsModalErrorText.innerHTML = "Inserisci un nome valido per continuare.";
                    skillsGestisciSkillsModalErrorText.classList.remove('d-none');
                } else {
                    let idSkill = parseInt(skillsGestisciSkillsModal.getAttribute('data-id-skill'));
                    for (let i = 0; i < newCategory.skills.length; i++) {
                        if (newCategory.skills[i].idSkill == idSkill) {
                            newCategory.skills[i].nomeSkill = skillsGestisciSkillsModalNome.value;
                        }
                    }

                    console.log(newCategory);

                    updateExistingCategoryAndSkills(newCategory, function (error, data) {
                        if (error == null) {
                            location.reload();
                            return;
                        }

                        skillsGestisciSkillsModalErrorText.innerHTML = "Errore nel completamento dell'operazione.";
                        skillsGestisciSkillsModalErrorText.classList.remove('d-none');
                    });
                }
            });

            // AGGIUNGI SKILL

            skillsAggiungiSkillsModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                let idCategoria = parseInt(btn.getAttribute('data-id-categoria'));

                userCategory.forEach(category => {
                    if (category.idCs == idCategoria) newCategory = category;
                });

                skillsAggiungiSkillsModalNome.value = "";
            });

            skillsAggiungiSkillsModalAggiungiBtn.addEventListener('click', e => {
                if (skillsAggiungiSkillsModalNome.value < 3) {
                    skillsAggiungiSkillsModalErrorText.innerHTML = "Inserisci un nome valido per continuare.";
                    skillsAggiungiSkillsModalErrorText.classList.remove('d-none');
                } else {
                    let newSkill = {
                        nomeSkill: skillsAggiungiSkillsModalNome.value
                    }
                    deleteCategory(newCategory, function (error, data) {
                        newCategory.skills.push(newSkill);
                        newCategoryAndSkills(newCategory, function (error, data) {
                            if (error == null) {
                                location.reload();
                                return;
                            }

                            skillsAggiungiSkillsModalErrorText.innerHTML = "Inserisci un nome valido per continuare.";
                            skillsAggiungiSkillsModalErrorText.classList.remove('d-none');
                        });
                    });
                }
            });

        }
    }else{
        skillsCard.style.opacity = "0.5";
        skillsAggiungiOpenModalBtn.disabled = true;
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
        const response = await fetch('http://localhost:8080/hrport/user/update-category-and-skills', {
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

        if(userCategory.length < 1){
            skillsInfoText.innerHTML = "Il tuo profilo non ha nessuna Skill."
            skillsInfoText.classList.remove('d-none');
        }

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
            htmlResult += skillPillTemplate.innerHTML
                .replaceAll('{nome_skill}', skill.nomeSkill)
                .replaceAll('{id_skill}', skill.idSkill)
                .replaceAll('{id_categoria}', skill.idCs);
        });

        return htmlResult;
    }
</script>