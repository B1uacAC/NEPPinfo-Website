var error = new URLSearchParams(window.location.search).get('error');
if(error){
    alert("账号或密码错误！")
}