let table = document.getElementById("table");

table.addEventListener("click" , (e)=>{
    if(e.target.className == "btn-adm"){
        let buttonClicked = e.target;
        let dataBTN = buttonClicked.id.split("_");

        let idSoli = document.getElementById("sol_"+dataBTN[1]).value;

        creteNoti(idSoli);

    }


})





function creteNoti(idSol){
    let noti = " <div class='notification' id='notification'><div class='noti' id='not-div'><div class='header'>¿Qué quiéres hacer?</div><div class='body'>¿Quieres rechazar o comenzar el caso?</div><div class='options-not'><ul><li class='opt-cancel'>Cancelar</li><li class='opt-confirm'>Rechazar</li><li class='opt-confirm2'>Comenzar caso</li></ul></div></div></div>";
    let body =  document.getElementById("nots");
    body.innerHTML += noti;
    let notyOpts = document.querySelector('.options-not')
    notyOpts.addEventListener("click", (e)=>{
        if(e.target.tagName == "LI"){
            let liopt = e.target;
            if(liopt.className == "opt-cancel"){
                body.innerHTML = "";
            }else if(liopt.className == "opt-confirm"){
                let notification = document.getElementById("not-div");
                //opcion de rechazar
                notification.innerHTML = "<div class='header'>Rechazando solicitud</div><div class='body-flex'><label>Escribe un razón</label> <textarea id='razon' maxlength='100'></textarea></div><div class='options-not'><ul><li class='opt-cancel-r'>Cancelar</li><li class='opt-confirm-r'>Rechazar</li></ul></div>"
                notification.addEventListener("click", (e)=>{
                   if(e.target.tagName =="LI"){
                       let opt = e.target;
                       if(opt.className == "opt-cancel-r"){
                           body.innerHTML = "";
                       }else if(opt.className == "opt-confirm-r"){
                           let razon = document.getElementById("razon").value
                            if(razon== ""){
                                alert("Por favor ingrese una razón del rechazo")
                            }else
                            {
                                //post
                                $.post("/SolicitudManagerServlet",
                                    {"opcion": "rechazar",
                                       "idUsuario": 1,
                                       "razon" :  razon,
                                       "idSolicitud": idSol
                                    },
                                    function (result){
                                        notification.innerHTML = result;
                                    });

                            }
                       }
                   }
                })

                /*$.post("/DeleteUserServlet",
                    {"UserID" : userID},
                    function (result){
                        let notification = document.getElementById("not-div");
                        notification.innerHTML = result;
                    });*/
            }else if(liopt.className == "opt-confirm2"){
                //opcion de aceptar soli
                window.location = "../solicitudes/acceptSolicitud.jsp?idSoli="+ idSol;
            }
        }
    })
}