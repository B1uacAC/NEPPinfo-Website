var universities = document.querySelectorAll('.university');
universities.forEach(function (div){
    div.addEventListener('click',function (){
        var name = this.getAttribute('name');
        var url = 'neppdata.jsp?uni='+name;
        window.location.href=url;
    })
})