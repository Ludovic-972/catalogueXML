function watch(){
    let prixMax = document.getElementById("prixMax");
    let min = prixMax.getAttribute("min");
    let max = prixMax.getAttribute("max");
    
    if(prixMax.value < min){
        prixMax.value = min;
    }
    if(prixMax.value > max){
        prixMax.value = max;
    }
}

function search(){
    let marque = document.getElementById("marque");
    let couleur = document.getElementById("couleur");
    let matiere = document.getElementById("matiere");
    let taille = document.getElementById("taille");
    let prixMax = document.getElementById("prixMax");
    
    // Implémenter la fonction de recherche
}