function showInfo(tool){

const descriptions = {
Docker:"Docker packages applications and dependencies into containers.",
Kubernetes:"Kubernetes orchestrates and scales containerized applications.",
AWS:"AWS provides scalable cloud infrastructure services.",
Terraform:"Terraform provisions infrastructure using Infrastructure as Code.",
GitHub:"GitHub hosts code and enables CI/CD pipelines.",
Linux:"Linux powers most servers and cloud infrastructure."
};

const infoBox = document.getElementById("infoBox");

if(!infoBox){
console.error("infoBox not found in HTML");
return;
}

infoBox.innerHTML =
'<div class="card">' +
'<button onclick="document.getElementById(\'infoBox\').innerHTML=\'\'">Close</button>' +
'<h2>' + tool + '</h2>' +
'<p>' + descriptions[tool] + '</p>' +
'</div>';

}