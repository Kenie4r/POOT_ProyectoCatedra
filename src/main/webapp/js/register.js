let labels = document.getElementsByClassName('label');
let aLabels = Array.prototype.slice.call(labels);
let inputsC = document.getElementsByClassName('text-inp');
let aInputs = Array.prototype.slice.call(inputsC)
let form = document.querySelector('#form-p');
form.addEventListener('click',function(e){
    let input = e.target;
    if(input.tagName == "INPUT"){
        let id =input.id;
        let index = aInputs.indexOf(input);
        console.log(aLabels[index])
        aLabels[index].style.transform = "translateY(-20px)";
        aLabels[index].style.font = "15px";
    }

} )
let passC = document.getElementById('txtPassc');
let passIn = document.getElementById('txtPass');
let iconCheck = document.getElementById('conf')
passC.addEventListener("input", (e)=>{
    let conf = passC.value
    let pass = passIn.value;
    if(pass!=conf){
        iconCheck.className = "icon-alert-triangle"
    }else{
        iconCheck.className = "icon-check-circle";

    }
})