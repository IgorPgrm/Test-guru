document.addEventListener('turbolinks:load', function(){
    var control = document.querySelector('.sort-by-title')
    control.addEventListener('click', function (){
        alert("CLICK!")
    })
})

function sortRowBytitle(){
    var table = document.querySelector('table')
}
