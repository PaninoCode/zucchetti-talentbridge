<script>

    let skillsInfoText = document.querySelector('#skills_info_text');

    let skillsCategoryTemplate = document.querySelector('#template_cetegoria_skills');
    let skillPillTemplate = document.querySelector('#template_skill_pill');
    let skillsList = document.querySelector('#skills_list');

    if (dataUser.hasOwnProperty('profile')) {
        if (dataUser.profile.hasOwnProperty('category')) {

            let userCategory = dataUser.profile.category;

            loadSkills(userCategory);

            let newCategory = {};
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