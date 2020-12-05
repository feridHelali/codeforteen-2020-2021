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
function isLessThanError(str, size) {
    return str.length < size ? {
        status: false,
        message: `Size Error: doit etre > ${size}`
    } : {
        status: true,
        message: ""
    };
}

function isGreaterThanError(str, size) {
    return str.length > size ? {
        status: false,
        message: `Size Error : doit etre < ${size}`
    } : {
        status: true,
        message: ""
    };
}

function isNotEmail(email) {
    return (email.indexOf("@") <= 0 || (email.lastIndexOf("@") !== email.indexOf("@"))) ? {
        status: false,
        message: `Size Error : doit etre < ${size}`
    } : {
        status: true,
        message: ""
    };

}

function isNotNumber(str) {
  return {
      //TODO:To implement
  }
}

function itNotContainDot(str) {
    return str.indexOf('.') === -1 ? {
        status: true,
        message: ``
    } : {
        status: false,
        message: `Mismatch Error : ne doit pas avoir  . `
    }
}

function itNotContainSemiColumn(str) {
    return str.indexOf(';') === -1 ? {
        status: true,
        message: ``
    } : {
        status: false,
        message: `Mismatch Error : ne doit pas avoir  ; `
    }
}

username.addEventListener('change', function ($event) {
    $event.preventDefault();
    let username = $event.target.value;

    if (isGreaterThanError(username, 20).status !== true) {
        userErrorMessage.innerHTML = isGreaterThanError(username, 20).message;
    } else if (isLessThanError(username, 10).status !== true) {
        userErrorMessage.innerHTML = isLessThanError(username, 10).message;
    } else {
        userErrorMessage.innerHTML = "";
    }

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