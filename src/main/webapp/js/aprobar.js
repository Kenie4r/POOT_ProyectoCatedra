let labels = document.getElementsByClassName('label');
let aLabels = Array.prototype.slice.call(labels);
let inputsC = document.getElementsByClassName('text-inp');
let aInputs = Array.prototype.slice.call(inputsC)
let form = document.querySelector('#form-p');

function creteNoti(){
    let noti = " <div class='notification' id='notification'><div class='noti' id='not-div'><div class='header'>Aprovar caso</div><div class='body'>¿Aprobar el caso?</div><div class='options-not'><ul><li class='opt-cancel'>Cancelar</li><li class='opt-confirm'>Confirmar</li></ul></div></div></div>";
    let body =  document.getElementById("nots");
    body.innerHTML += noti;
    let notyOpts = document.querySelector('.options-not')
    notyOpts.addEventListener("click", (e)=>{
        if(e.target.tagName == "LI"){
            let liopt = e.target;
            if(liopt.className == "opt-cancel"){
                body.innerHTML = "";
            }else if(liopt.className == "opt-confirm"){
                let idCaso = document.getElementById("txtID").value
                $.post("/AprobarCaso",
                    {"idCaso" : idCaso, "fecha" : fecha},
                    function (result){
                        let notification = document.getElementById("not-div");
                        notification.innerHTML = result;
                    });
            }
        }
    })
}