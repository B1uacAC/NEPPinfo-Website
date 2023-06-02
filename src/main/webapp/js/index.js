
var slidesContainer = document.querySelector('.slides');
var slides = document.querySelectorAll('.slide');
var dotsContainer = document.querySelector('.dots');
var dots = [];

var currentSlide = 0;
var interval;

for (var i = 0; i < slides.length; i++) {
    var dot = document.createElement('span');
    dot.classList.add('dot');
    dotsContainer.appendChild(dot);
    dots.push(dot);
    dot.addEventListener('click', function () {
        var dotIndex = dots.indexOf(this);
        showSlide(dotIndex);
    });
}

function showSlide(slideIndex) {
    slidesContainer.style.transform = `translateX(-${slideIndex * 100}%)`;

    for (var i = 0; i < slides.length; i++) {
        dots[i].classList.remove('active');
    }
    dots[slideIndex].classList.add('active');

    currentSlide = slideIndex;
}

function nextSlide() {
    currentSlide++;
    if (currentSlide >= slides.length) {
        currentSlide = 0;
    }
    showSlide(currentSlide);
}

function startSlideshow() {
    interval = setInterval(nextSlide, 5000); // 自动轮播时间间隔，单位为毫秒
}

function stopSlideshow() {
    clearInterval(interval);
}

startSlideshow();

function redirectTo(url){
    switch (url){
        case 'img1':
            window.location.href = "index.jsp"
            break;
        case 'img2' :
            window.location.href = "index.jsp"
            break;
        case 'img3' :
            window.location.href = "index.jsp"
            break;
        case 'img4' :
            window.location.href = "index.jsp"
            break;
    }
}




// 获取图标元素和导航栏内容元素
var icons = document.querySelectorAll('.selector i');
var contentItems = document.querySelectorAll('.content .navigation');

// 为每个图标添加点击事件监听器
icons.forEach(function(icon, index) {
    icon.addEventListener('click', function() {
        // 隐藏所有导航栏内容
        contentItems.forEach(function(item) {
            item.style.display = 'none';
        });

        // 显示点击的图标对应的导航栏内容
        contentItems[index].style.display = 'block';
    });
});


var icons = document.querySelectorAll('.selector i');

icons.forEach(function(icon) {
    icon.classList.add('tooltip');
});

