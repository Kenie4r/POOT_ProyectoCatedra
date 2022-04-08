let dragArea = document.querySelector(".drag-file-area");
let input = document.getElementById("txtFile")

dragArea.addEventListener("dragover", (e)=>{
    e.preventDefault();
    console.log("over")
    dragArea.classList.add("active");
})
dragArea.addEventListener("dragleave",(e)=>{
    e.preventDefault();
    dragArea.classList.remove("active")
})
dragArea.addEventListener("drop", (e)=>{
    e.preventDefault();
    console.log("Drop file")
    filechange(e);
})

input.addEventListener("change", (e)=>{
    filechange(e);
})
function filechange(event){
    let file = event.dataTransfer.files[0];
    let fileT = file.type;
    console.log(fileT)
    if(fileT =="application/pdf"){
        let text = document.getElementById("nameFile");
        text.innerHTML = file.name;
        let reader = new FileReader();
        reader.onload = ()=>{
            let fileURL = reader.result;
            input.value = fileURL;
        }
        reader.readAsDataURL(file)
    }else{
        alert("El tipo de archivo no es valido")
    }
}