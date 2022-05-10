let btn = document.getElementById("pass_ch");
let id = document.getElementById("user").value;
btn.addEventListener("click", (e)=>{
    e.preventDefault();
    Swal.fire({
       title : 'Ingresa tu contraseña actual para poder seguir',
       input : 'password',
       showCancelButton: true,
       confirmButtonText: 'Seguir',
        showLoaderOnConfirm: true,
        preConfirm: (pass)=>{
           $.post("/ServletModifyUser?opt=pass", {
               'user': id, 'pass': pass
           }, function (result){
               if(result == "continuar"){
                   Swal.fire({
                       title: 'Cambiemos tu contraseña',
                       html:
                           '<input id="swal-input1" type="password" class="swal2-input" placeholder="inserta tu contraseña">' +
                           '<input id="swal-input2" type="password" class="swal2-input" placeholder="confirma tu contraseña">',
                        preConfirm: function (){
                            if($("#swal-input1").val() == $("#swal-input2").val()){
                                $.post("/ServletModifyUser?opt=change", {
                                    'user': id, 'pass': $("#swal-input1").val()
                                },
                                    function (re){
                                        Swal.fire({
                                                title: re
                                            }
                                        )
                                    })
                            }else{
                                Swal.fire({
                                    title: 'No se pudo actualizar la contraseña, prueba de nuevo'
                                    }
                                )
                            }
                        }
                   })
               }else{
                   Swal.fire({
                       title: result,
                       confirmButtonText: 'Volver'
                   })
               }
           })
        }
    });
})