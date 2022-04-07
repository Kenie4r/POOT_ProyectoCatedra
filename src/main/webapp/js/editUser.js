let optionDiv = document.querySelector('.options');
let values = new Array();
let form = document.getElementById("form-user");

let inputs = form.getElementsByTagName("input");
let selects = document.getElementsByTagName("select");

optionDiv.addEventListener("click", (e)=>{
    if(e.target.tagName == "LI"){
        let option = e.target;

        let btn_form = document.getElementById("btn-form");
        if(option.className == "btn-edit"){
            SetAllinputs(1);


            option.innerHTML  ="<span class='icon-x'></span> Cancelar edicion";
            option.className = "btn-cancelEdit"
            btn_form.style.display = "block"
        }else if (option.className == "btn-del"){
            creteNoti()
        }else if(option.className == "btn-cancelEdit"){


            option.innerHTML  ="<span class='icon-edit'></span> Editar";
            option.className = "btn-edit"
            btn_form.style.display = "none"
            SetAllinputs(2);
        }
    }
})


function SetAllinputs(inted){
    switch(inted){
        case 1:
            for(inx = 0; inx <inputs.length ; inx++ ){
                inputs[inx].disabled = false;
                values[inx] = inputs[inx].value;
                if(inputs[inx].id=="txtDepartamento" || inputs[inx].id=="txtRol" ){
                    inputs[inx].style.display = "none";
                }
            }
            for(inx = 0; inx<selects.length; inx++){
                selects[inx].style.display = "block";
                selects[inx].disabled = false
            }
            break;
        case 2:
            for(inx = 0; inx <inputs.length ; inx++ ){
                inputs[inx].disabled = true;
                inputs[inx].value = values[inx];
                if(inputs[inx].id=="txtDepartamento" || inputs[inx].id=="txtRol" ){
                    inputs[inx].style.display = "block";
                }
            }
            for(inx = 0; inx<selects.length; inx++){
                selects[inx].style.display = "none";
                selects[inx].disabled = true
            }
            break;
    }
}

function creteNoti(){
    let noti = " <div class='notification' id='notification'><div class='noti' id='not-div'><div class='header'>Eliminar usuario</div><div class='body'>¿Quieres eliminar usuario?</div><div class='options-not'><ul><li class='opt-cancel'>Cancelar</li><li class='opt-confirm'>Confirmar</li></ul></div></div></div>";
    let body =  document.getElementById("nots");
    body.innerHTML += noti;
    let notyOpts = document.querySelector('.options-not')
    notyOpts.addEventListener("click", (e)=>{
        if(e.target.tagName == "LI"){
            let liopt = e.target;
            if(liopt.className == "opt-cancel"){
                body.innerHTML = "";
            }else if(liopt.className == "opt-confirm"){
                let userID = document.getElementById("UserID").value
                $.post("/DeleteUserServlet",
                    {"UserID" : userID},
                    function (result){
                        let notification = document.getElementById("not-div");
                        notification.innerHTML = result;
                    });
            }
        }
    })
}