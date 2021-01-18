document.addEventListener('turbolinks:load', function(){
    var new_user = document.querySelector('.new_user')
    if (new_user){
        var userPasswordConfInput = document.querySelector("input[id=user_password_confirmation]")
        userPasswordConfInput.addEventListener('keyup', passwordsMatch)
    }
})

function passwordsMatch(value){
    var passWrongImg = document.querySelector(".pass-icon-wrong")
    var passSuccessImg = document.querySelector(".pass-icon-success")
    var userPasswordInput = document.querySelector("input[id=user_password]")
    var userPasswordConfirmationInput = document.querySelector("input[id=user_password_confirmation]")
    var confirmPasswordText = userPasswordConfirmationInput.value
    var userPasswordText = userPasswordInput.value
    var actions = document.querySelector('.actions')
    var but = actions.childNodes[1]

    if (confirmPasswordText.replace(/\s/g,"") == "" || userPasswordText.replace(/\s/g,"") == ""){
        passSuccessImg.classList.add('hide')
        passWrongImg.classList.add('hide')
        but.disabled = true
    } else {
        if (confirmPasswordText == userPasswordText){
            passWrongImg.classList.add('hide')
            passSuccessImg.classList.remove('hide')
            but.disabled = false
        } else {
            passWrongImg.classList.remove('hide')
            passSuccessImg.classList.add('hide')
            but.disabled = true
        }
    }
}
