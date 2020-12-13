const helpers=global.helpers();

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



// username field validation ie should greater than 10 less than 20
username.addEventListener('change', function ($event) {
    $event.preventDefault();
    let username = $event.target.value;
    if (helpers.isGreaterThan(username, 20) !== '') {
        userErrorMessage.innerHTML = helpers.isGreaterThan(username, 20);
    } else if (helpers.isLessThan(username, 10) !== '') {
        userErrorMessage.innerHTML = helpers.isLessThan(username, 10);
    } else {
        userErrorMessage.innerHTML = '';
    };
});

email.addEventListener('change', function ($event) {
    $event.preventDefault();
    let email = $event.target.value;
    if (helpers.isEmail(email) !== '') {
        emailErrorMessage.innerHTML = `<i>${helpers.isEmail(email)}</i>`;
    }else if(helpers.isContainingDot(email)!==''){
        emailErrorMessage.innerHTML = `<b>${helpers.isContainingDot(email)}</b>` 
    }else{
        emailErrorMessage.innerHTML=''; 
    }
})

password.addEventListener('change', function ($event) {
    $event.preventDefault();
    let password = $event.target.value;
    if (helpers.isNumber(password) !== '') {
        passwordErrorMessage.innerHTML = `${helpers.isNumber(password)}`;
    }else if(helpers.isLessThan(password,6)!==''){
        passwordErrorMessage.innerHTML =`<span style='color:blue;'>${helpers.isLessThan(password,6)}</span>`;
    }
    else{
        passwordErrorMessage.innerHTML=''; 
    }
})

function isFormValid(form){
    let valid=true;
    if( helpers.isLessThan(form.username,10)!=='' || helpers.isGreaterThan(form.username,20)!==''){
        valid=false;
    }else if( helpers.isEmail(form.email)!=='' || helpers.isContainingDot(form.email)!==''){
        valid=false;
    }else if(helpers.isNumber(form.password)!=='' || helpers.isLessThan(form.password,6)!==''){
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
        let url= `./homepage.html?usename=${form.username}&email=${form.email}&password=${form.password}`;
        window.location.href = url;
    }else{
        alert('Erreur de validation')
    }
});


function clean() {
    console.log('implement staff here');
}