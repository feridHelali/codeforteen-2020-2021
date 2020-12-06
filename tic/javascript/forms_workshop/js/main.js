// intercepting main DOM elements
const registerForm = window.document.forms.registerForm;
const messageOutput = document.getElementById('message-output');
const output = document.getElementById('output');
const fullname = registerForm.fullname;
const cin = registerForm.cin;
const gender = registerForm.gender;
const birthdate = registerForm.birthdate;
const email = registerForm.email
const adress = registerForm.adress;
const zipCode = registerForm.zipcode;
const city = registerForm.city;
const situation = registerForm.situation;
const observation = registerForm.observation;

const tools = {
    displayMessage: function displayMessage(message) {
        messageOutput.innerHTML = message;
    },
    displayRegisterForm: function displayRegisterForm(form) {
        output.innerHTML = JSON.stringify(form, 5, 5);
    },
    isLessThanError: function isLessThanError(str, size) {
        return str.length < size ? {
            status: true,
            message: `Size Error: doit etre > ${size}`
        } : {
            status: false,
            message: ``
        };
    },
    isGreaterThanError: function isGreaterThanError(str, size) {
        return str.length > size ? {
            status: true,
            message: `Size Error : doit etre < ${size}`
        } : {
            status: false,
            message: ""
        };
    },
    isNotEmail: function isNotEmail(email) {
        return (email.indexOf("@") <= 0 || (email.lastIndexOf("@") !== email.indexOf("@"))) ? {
            status: false,
            message: `Size Error : doit etre < ${size}`
        } : {
            status: true,
            message: ""
        };

    },
    itNotContainDot: function itNotContainDot(str) {
        return str.indexOf('.') === -1 ? {
            status: true,
            message: ``
        } : {
            status: false,
            message: `Mismatch Error : ne doit pas avoir  . `
        }
    },
    isContainingADot: function (str) {
        return str.indexOf('.') === -1 ? {
            status: false,
            message: ``
        } : {
            status: true,
            message: `Mismatch Error : email doit avoir . `
        }
    },
    isNumber: function (str) {
        return !isNaN(str) ? {
            status: true,
            message: ``
        } : {
            status: false,
            message: `Type Error: n'est pas numerique`
        }
    },
}

fullname.addEventListener("change", function ($event) {
    let fullname = $event.target.value;
    let validatorLessError=tools.isLessThanError(fullname, 10);   
    let validatorGreatError = tools.isGreaterThanError(fullname, 20);
    let message="";
    if(validatorGreatError.status ){
        message=validatorGreatError.message;
    } 
    else if (validatorLessError.status===true){
        message=validatorLessError.message;
    };
    tools.displayMessage(message);
});

function validateTheForm() {

    console.log(fulltext, cin, gender, birthdate, adress, zipCode, city, situation, observation);

}


// exercice
/*
    objectif: validation des valeur des controles

    1/ fullname doit etre alphabetique de longueur entre 10 et 30 caractères
    2/ CIN doit ètre numerique de taill 8
    **3/ birthdate doit <= à la date du jour et >= 01/01/2000
    4/ zipcode doit etre entre 1000 to 9000
    5/ l'email doit etre valide ie userbname@domaine.com
    6/ observation doit etre de longuer >= 50 <= 300 caratères

    TD: les message d'erreures s'affichera dans la division message-output
        une fois terminer, et le formulaire est valide, les valeurs du formulaire registerform safficherons sous form
        d'un object JSON ie {key1:value1,key2:value2...} dans la devision de droite
*/