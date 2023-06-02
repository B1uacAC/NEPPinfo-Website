var files = document.querySelectorAll('.file');
var collector = document.getElementById('collector');
var nameForm = document.getElementById('nameForm');
var nameTable = document.getElementById('nameTable');
files.forEach(function (element){
    element.addEventListener('dragstart',function (event){
        event.dataTransfer.setData('text/plain',event.target.getAttribute('data-name'));
    })
})
collector.addEventListener('dragover',function (event){
    event.preventDefault();
})
collector.addEventListener('drop',function (event){
    event.preventDefault();
    var name = event.dataTransfer.getData('text/plain');
    console.log('Dropped:', name);
    var row = nameTable.insertRow();
    var cell = row.insertCell();
    cell.textContent = name;
    cell.classList.add('name-item');
})
var cancel_btn = document.getElementById("cancel");
cancel_btn.addEventListener('click',function (event){
    event.preventDefault();
    var lastRow = nameTable.rows[nameTable.rows.length-1];
    var lastCell = lastRow.cells[lastRow.cells.length-1];
    if (lastRow.cells.length === 1) {
        nameTable.deleteRow(nameTable.rows.length - 1);
    } else {
        lastRow.removeChild(lastCell);
    }

})
nameForm.addEventListener('submit', function (event) {
    event.preventDefault();

    // 将表格中的每个名称值添加到表单中
    var nameItems = nameTable.getElementsByClassName('name-item');//数组
    var inputNames = document.getElementById('inputNames'); // 隐藏的输入字段容器

    for (var i = 0; i < nameItems.length; i++) {
        var value = nameItems[i].textContent; // 获取单元格的值

        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'names[]';
        input.value = value;

        inputNames.appendChild(input);
    }

    nameForm.submit();

});
