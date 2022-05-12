let tbody = document.getElementById("body");
tbody.addEventListener("click", (e)=>{
    var target = e.target;
    if(target.tagName =="SPAN"){
        if(target.classList.contains("razon")){
            let id = target.id;
            let splited = id.split("_");
            //obtener la razón de rechazo de una solicitud


            $.post("/SolicitudManagerServlet?opcion=razon", {
                "id" : splited[1]
            }, function (result){
                Swal.fire('La razón del rechazo es:',
                    result, 'info'
                )
            })

        }
    }
})