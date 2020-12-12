// intercepting main DOM elements

const registerForm = window.document.forms.registerForm;
const messageOutput = document.getElementById('message-output');
const output = document.getElementById('output');
const fulltext = registerForm.fulltext;
const cin = registerForm.cin;
const gender = registerForm.gender;
const fullname = registerForm.fullname;
const birthdate = registerForm.birthdate;
const email = registerForm.email;
const adress = registerForm.adress;
const zipCode = registerForm.zipcode;
const city = registerForm.city;
const situation = registerForm.situation;
const observation = registerForm.observation;


const tools = {
    displayMessage: function (message) {
        messageOutput.innerHTML = message;
    },
    displayRegisterForm: function (form) {
        output.innerHTML = JSON.stringify(form, 5, 5);
    },
    isNotEmail: function (email) {
        return (email.indexOf("@") <= 0 || (email.lastIndexOf("@") !== email.indexOf("@"))) ? {
            status: false,
            message: `Size Error : doit etre < ${size}`
        } : {
                status: true,
                message: ""
            };
    },
    isLessThanError: function (str, size) {
        return str.length < size ? {
            status: false,
            message: `Size Error: doit etre > ${size}`
        } : {
                status: true,
                message: ""
            };
    },
    isGreaterThanError: function (str, size) {
        return str.length > size ? {
            status: false,
            message: `Size Error : doit etre < ${size}`
        } : {
                status: true,
                message: ""
            };
    },
    isNumber: function (str) {
        return !isNaN(str) ? {
            status: true,
            message: ""
        }
            : {
                status: false,
                message: `Type error: n'est pas numerique`
            }

    }
}

fullname.addEventListner("change", function ($event) {
    let fullname = $event.target.value;
    let tmp = tools.isGreaterThanError(fullname, 20).status;
    if (tmp === false) {
        tools.displayMessage(tmp.message)
    }
    else if (tools.isLessThanError(fullname, 10).status === false) {
        tools.displayMessage(tools.isLessThanError(fullname, 10).message)
    }

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