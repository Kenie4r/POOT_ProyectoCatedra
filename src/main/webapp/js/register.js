let labels = document.getElementsByClassName('label');
let aLabels = Array.prototype.slice.call(labels);
let inputsC = document.getElementsByClassName('text-inp');
let aInputs = Array.prototype.slice.call(inputsC)
let form = document.querySelector('#form-p');

let btnRegister = document.getElementById("btn-form");
btnRegister.addEventListener("click", (e)=>{
    let conf = passC.value
    let pass = passIn.value;
    if(pass!=conf){
        e.preventDefault();
    }else{

    }
})


let passC = document.getElementById('txtPassc');
let passIn = document.getElementById('txtPass');
let iconCheck = document.getElementById('conf')
passC.addEventListener("input", (e)=>{
    let conf = passC.value
    let pass = passIn.value;
    if(pass!=conf){
        iconCheck.className = "icon-alert-triangle";
    }else{
        iconCheck.className = "icon-check-circle";

    }
})
