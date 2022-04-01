let marque = document.getElementById("marque");
let couleur = document.getElementById("couleur");
let matiere = document.getElementById("matiere");
let taille = document.getElementById("taille");
let prixMax = document.getElementById("prixMax");

let max = prixMax.getAttribute("max");

function search(){
 let chaussures = document.getElementsByClassName("chaussure");
 console.log(setPath());
  let iterator = document.evaluate( setPath(), document, null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null );
  
  try {
      let res = iterator.iterateNext();
      while (res) {
        console.log( res.firstChild.firstChild.nodeValue);
        for(let chaussure of chaussures){
            if(chaussure.firstChild.textContent == res.firstChild.firstChild.nodeValue){
                
            }
        }
        res = iterator.iterateNext();
      }
   }catch (e) {
      console.log("Erreur : "+e);
   }
}

function setPath(){
    let path = "//chaussure";
    let first = true;
    
    if(marque.value != ""){
        path += "[td[1][text() = '"+marque.value+"']";
        first = false;    
    }
    
    if(couleur.value != ""){
        path += first ? "[td[2][text() = '"+couleur.value.toLowerCase()+"']" : " and td[2][text() = '"+couleur.value.toLowerCase()+"']";
        first = false;
    }
    
    if(matiere.value != ""){
        path += first ? "[td[3][text() = '"+matiere.value+"']" : " and td[3][text() = '"+matiere.value+"']";
        first = false;
    }
    
    if(taille.value != ""){
         path += first ? "[td[4][contains(text(),"+taille.value+")]" : " and td[4][text() = "+taille.value+"]";  
        first = false;
    }
    
    if(prixMax.value != "")
         path += first ? "[td[5][text() <= "+prixMax.value+"]" : " and td[5][text() <= "+prixMax.value+"]";
    else
        path += first ? "[td[5][text() <= "+max+"]" : " and td[5][text() <= "+max+"]";
    
    path += (path != "//chaussure") ? "]" : "";
    return path;
}
