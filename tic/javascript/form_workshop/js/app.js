// get the form in a variable
const myForm = window.document.myForm;

// get all needed elements
const username = myForm.username;
const userErrorMessage = document.getElementById('usermessage');

const email = myForm.email;
const emailErrorMessage = document.getElementById('emailmessage');

const password = myForm.password;
const passwordErrorMessage = document.getElementById('passwordmessage');

const submitButton = document.getElementById('submit');

// validation helpers functions
function isLessThan(str, size) {
    return str.length > size ? '' : `Size Error: ${str.length} doit etre > ${size}`;
}

function isGreaterThan(str, size) {
    return str.length < size ? '' : `Size Error : ${str.length} doit etre < ${size}`;
}

function isEmail(email) {
    return !(email.indexOf("@") <= 0 || (email.lastIndexOf("@") !== email.indexOf("@"))) ?
        '' :
        `Mismatch Error : @ est absente`;
}

function isNumber(str) {
    return !isNaN(str) ? '' : 'Type Error: doit etre numérique';
}

function isContainingDot(str) {
    return str.indexOf('.') > -1 ? '' : `Mismatch Error : ce champ ne contient pas . `
}

function isContainingSemiColumn(str) {
    return str.indexOf(';') > -1 ? `` : `Mismatch Error :ce champ le contient avoir  ; `

}

// username field validation ie should greater than 10 less than 20
username.addEventListener('change', function ($event) {
    $event.preventDefault();
    let username = $event.target.value;
    if (isGreaterThan(username, 20) !== '') {
        userErrorMessage.innerHTML = isGreaterThan(username, 20);
    } else if (isLessThan(username, 10) !== '') {
        userErrorMessage.innerHTML = isLessThan(username, 10);
    } else {
        userErrorMessage.innerHTML = '';
    };
});

email.addEventListener('change', function ($event) {
    $event.preventDefault();
    let email = $event.target.value;
    if (isEmail(email) !== '') {
        emailErrorMessage.innerHTML = `<i>${isEmail(email)}</i>`;
    }else if(isContainingDot(email)!==''){
        emailErrorMessage.innerHTML = `<b>${isContainingDot(email)}</b>` 
    }else{
        emailErrorMessage.innerHTML=''; 
    }
})

password.addEventListener('change', function ($event) {
    $event.preventDefault();
    let password = $event.target.value;
    if (isNumber(password) !== '') {
        passwordErrorMessage.innerHTML = `${isNumber(password)}`;
    }else if(isLessThan(password,6)!==''){
        passwordErrorMessage.innerHTML =`<span style='color:blue;'>${isLessThan(password,6)}</span>`;
    }
    else{
        passwordErrorMessage.innerHTML=''; 
    }
})

function isFormValid(form){
    let valid=true;
    if( isLessThan(form.username,10)!=='' || isGreaterThan(form.username,20)!==''){
        valid=false;
    }else if( isEmail(form.email)!=='' || isContainingDot(form.email)!==''){
        valid=false;
    }else if(isNumber(form.password)!=='' || isLessThan(form.password,6)!==''){
        valid=false
    }
    return valid;
}

submitButton.addEventListener('click',function($event){
    $event.preventDefault();
    let form={
        username:myForm.username.value,
        email:myForm.email.value,
        password:myForm.password.value
    }

    if(isFormValid(form)){
        window.location.href ='http://localhost:3000/homepage.html';
    }else{
        alert('Erreur de validation')
    }
});


function clean() {
    console.log('implement staff here');
}