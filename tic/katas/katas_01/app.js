// soit une chaine ch ="   devTools failed to    load   sourceMap: could not load content for this browser    "
// soit ch2= "Ali va 1266 @35 {} .23654 56"
// 1 - Tester Si ch2 est Alphabetique [A..Z][a..z]


var ch2 = "Ali va 1266 @35 {} .23654 56";
var ch3 = "Aliva";
var ch4 = "   devTools failed to    load   sourceMap: could not load content for this browser    "


function isAlphabetiqueB(chaine) {
    for (i = 0; i < chaine.length; i++) {
        if ((chaine.charAt(i).toUpperCase() < 'A' ||
                chaine.charAt(i).toUpperCase() > "Z") &&
            chaine.charAt(i) != ' ') {
            return false;
        }
    }
    return true;
}

function isAlphabetiqueM(chaine) {
    var tmp_ch = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';

    for (i = 0; i < chaine.length; i++) {
        if (!(chaine.charAt(i).toUpperCase() in tmp_ch.split())) {
            return false;
        }
    }

}

function isAlphabetiqueC(chaine) {
    var tmp_ch = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ';

    for (i = 0; i < chaine.length; i++) {
        if (tmp_ch.indexOf(chaine.charAt(i).toUpperCase()) === -1) {
            return false;
        }
    }
    return true;

}


function trimCapitalize(chaine) {
    // soit une chaine ch ="   devTools failed to    load   sourceMap: could not load content for this browser.    "

    // KISS

    // eliminer les espaces devant la chaine  -- Ok -- letTrim
    var resultat = ''
    for (i = 0; i < chaine.length; i++) {
        if (!(chaine.charAt(i) === ' ' && resultat === '')) {
            resultat = resultat + chaine.charAt(i)
        }
    }

    // eliminer les espaces entre les mots --Ok
    var resultat2 = '';
    for (i = 0; i < resultat.length; i++) {
        if (!(resultat.charAt(i) === ' ' && resultat.charAt(i + 1) === ' ')) {
            resultat2 = resultat2 + resultat.charAt(i);
        }
    }

   // Eliminer les espaces a la fin de la chaine -- Ok -- rightTrim
    var resultat3 = ''
    for (i = 0; i < resultat2.length; i++) {
        if (!(resultat2.charAt(resultat2.length - 1) === ' ' && i === resultat2.length - 1)) {
            resultat3 = resultat3 + resultat2.charAt(i);
        }
    }


    // Capitalize Words
    var resultat4=''
    for(i=0;i<resultat3.length;i++){
        if(resultat3.charAt(i-1)===' ' || i === 0){
            resultat4=resultat4+resultat3.charAt(i).toUpperCase();
        }else{
            resultat4=resultat4+resultat3.charAt(i);
        }
    }

    return resultat4;

}

console.log("source:\n", ch4, '\n\n target:\n', trimCapitalize(ch4));

/*
console.log(ch2,isAlphabetiqueB(ch2));
console.log(ch3,isAlphabetiqueB(ch3));

console.log(ch2,isAlphabetiqueM(ch2));
console.log(ch3,isAlphabetiqueM(ch3));

console.log(ch2,isAlphabetiqueC(ch2));
console.log(ch3,isAlphabetiqueC(ch3));
*/