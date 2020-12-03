// intercepting main DOM elements
const registerForm = window.document.forms.registerForm;
const messageOutput = document.getElementById('message-output');
const output = document.getElementById('output');


// some helpers function
function displayMessage(message) {
    messageOutput.innerHTML = message;
}

function displayRegisterForm(form) {
    output.innerHTML = JSON.stringify(form, 5, 5);
}
//samples how to use them
displayMessage('Error de type: CIN doit etre de type Numerique')
displayRegisterForm({
    fullname: 'Ferid',
    cin: '08090603',
    birthdate: new Date(),
    gender: 'Homme'
});






function validateTheForm() {
    //debugger;
    // control variables initialization
    let fulltext = registerForm.fulltext.value;
    let cin = registerForm.cin.value;
    let gender = registerForm.gender.value;
    let birthdate = registerForm.birthdate.value;
    let email = registerForm.email.value
    let adress = registerForm.adress.value;
    let zipCode = registerForm.zipcode.value;
    let city = registerForm.city.value;
    let situation = registerForm.situation.value;
    let observation = registerForm.observation.value;
    console.log(fulltext, cin, gender, birthdate, adress, zipCode, city, situation, observation);

}


// exercice
/*
    objectif: validation des valeur des controles

    1/ fullname doit etre alphabetique de longueur entre 10 et 30 caractères
    2/ CIN doit ètre numerique de taill 8
    3/ birthdate doit <= à la date du jour et >= 01/01/2000
    4/ zipcode doit etre entre 1000 to 9000
    5/ l'email doit etre valide ie userbname@domaine.com
    6/ observation doit etre de longuer >= 50 <= 300 caratères

    TD: les message d'erreures s'affichera dans la division message-output
        une fois terminer, et le formulaire est valide, les valeurs du formulaire registerform safficherons sous form
        d'un object JSON ie {key1:value1,key2:value2...} dans la devision de droite
*/