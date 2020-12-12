// get the form in a variable
const myForm = window.document.myForm;

// get all needed elements
const username = myForm.username;
const userErrorMessage = document.getElementById('usermessage');

const email = myForm.email;
const emailErrorMessage = document.getElementById('emailmessage');

const password = myForm.password;
const passwordErrorMessage = document.getElementById('passwordmessage');


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
        `Mismatch Error : c''est n''est pas un email`;
}

function isNumber(str) {
    return isNaN(+str) ?'':'Type Error: doit etre numérique'; 
}

function isContainingDot(str) {
    return str.indexOf('.') >-1 ? '' : `Mismatch Error : ce champ contient . `
}

function isContainingSemiColumn(str) {
    return str.indexOf(';') > -1 ? `` : `Mismatch Error :ce champ contient avoir  ; `
   
}

username.addEventListener('change', function ($event) {
    $event.preventDefault();
    let username = $event.target.value;
     if(isGreaterThan(username, 20)!==''){
        userErrorMessage.innerHTML = isGreaterThan(username, 20);
     }else if(isLessThan(username,10)!==''){
        userErrorMessage.innerHTML = isLessThan(username, 20);
     }else{
        userErrorMessage.innerHTML ='';
     };
});


function clean() {
    console.log('implement staff here');
}

function verif() {
    username = document.myForm.username.value;
    if (username.length < 10 || username.length > 50) {
        alert("username incorrect ! erreure ");
        return false;
    }

    email = document.myForm.email.value;
    if (email.indexOf("@") <= 0 || email.lastIndexOf("@") !== email.indexOf("@")) {
        alert("email incorrect ! erreure ");
        return false;
    }
}