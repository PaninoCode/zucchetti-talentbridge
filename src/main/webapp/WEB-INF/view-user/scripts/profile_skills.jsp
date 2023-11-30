<script>

    const skillsGestisciCategoriaModal = document.querySelector('#skills_gestisci_categoria_modal');
    let skillsGestisciCategoriaModalSkillsInput = document.querySelector('#skills_gestisci_categoria_modal_skills_input');

    let skillsCategoryTemplate = document.querySelector('#template_cetegoria_skills');
    let skillPillTemplate = document.querySelector('#template_skill_pill');
    let skillsList = document.querySelector('#skills_list');

    if (dataUser.hasOwnProperty('profile')) {
        if (dataUser.profile.hasOwnProperty('category')) {

            let userCategory = dataUser.profile.category;

            userCategory.forEach(category => {
                // console.log(category);
                skillsList.innerHTML += skillsCategoryTemplate.innerHTML
                    .replaceAll('{nome_categoria}', category.nomeCategoria)
                    .replaceAll('{id_categoria}', category.idCs)
                    .replaceAll('{skills_pills}', createSkillPillsHTML(category.skills));
            });

            skillsGestisciCategoriaModal.addEventListener('show.bs.modal', event => {
                let btn = event.relatedTarget;
                let nomeCategoria = document.querySelector('#skills_gestisci_categoria_modal_nome_categoria');

                nomeCategoria.innerHTML = btn.getAttribute('data-nome-categoria');

                let idCategoria = parseInt(btn.getAttribute('data-id-categoria'));

                skillsGestisciCategoriaModalSkillsInput.value = "";

                userCategory.forEach(category => {
                    if(category.idCs == idCategoria){
                        skillsGestisciCategoriaModalSkillsInput.value = createListOfSkills(category);
                    }
                });
            });

        }
    }

    function createListOfSkills(category) {
        let skills = category.skills;
        let list = "";
        skills.forEach(skill => {
            list += skill.nomeSkill + ",";
        });
        return list;
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