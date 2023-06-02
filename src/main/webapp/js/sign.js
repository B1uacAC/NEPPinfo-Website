const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
    container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
    container.classList.add("right-panel-active");
});


var message = new URLSearchParams(window.location.search).get('message');
if (message) {
    switch (message){
        case "error1":
            alert("输入不得有空！");
            break;
        case "error2":
            alert("两次密码输入不一致！");
            break;
        case "error3":
            alert("密码不得少于6位或多于15位！");
            break;
        case "error4":
            alert("邮箱已经被注册！");
            break;
        case "error5":
            alert("邮箱或密码错误！");
            break;
    }
}
