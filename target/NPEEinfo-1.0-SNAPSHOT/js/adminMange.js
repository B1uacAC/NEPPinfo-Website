var  options = document.querySelectorAll("[name='option']");
for (var i = 0; i < options.length; i++) {
    options[i].addEventListener("click", function () {
        for (var j = 0; j < options.length; j++) {
            options[j].classList.remove("side-bar-option-active");
        }
        this.classList.add("side-bar-option-active");
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("manage-container").innerHTML = xhr.responseText;
            }
        };
        var url = this.id+".jsp";
        console.log(url);
        xhr.open("GET", url, true);
        xhr.send();
    });
}