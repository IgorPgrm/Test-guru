document.addEventListener('turbolinks:load', timerFinder)

function timerFinder(){
    var redirectTimer = document.querySelector('.time-stamp')
    if (redirectTimer) {
        var timerCount = parseInt(redirectTimer.textContent)
        timerCount *= 1000
        setInterval(redirect_to_result, timerCount);
    }
}

function redirect_to_result(){
    window.location.href = window.location.pathname + "/result"
}
