function addelm(){
    var lattitude = document.getElementById('lattitude').value;
    var Longitude = document.getElementById('Longitude').value;
    var date = document.getElementById('dateTimeInput').value;
    var val=document.getElementById('valueInput').value;

    if (!lattitude.trim() || !Longitude.trim() || !date.trim() || !val.trim()) {
        alert('Please enter valid value before submitting.');
        return;
    }
    addToTable(lattitude,Longitude,date,val);
    console.log(lattitude +"-"+Longitude+"-"+date+"-"+val);
    document.getElementById('inputform').reset();
}

function addToTable(value1, value2, value3, value4) {

    var tableBody = document.getElementById('datatable').getElementsByTagName('tbody')[0];

    var newRow = tableBody.insertRow(tableBody.rows.length);

    var cell1 = newRow.insertCell(0);
    var cell2 = newRow.insertCell(1);
    var cell3 = newRow.insertCell(2);
    var cell4 = newRow.insertCell(3);
    var cell5 = newRow.insertCell(4);

    cell1.appendChild(document.createTextNode(value1));
    cell2.appendChild(document.createTextNode(value2));
    cell3.appendChild(document.createTextNode(value3));
    cell4.appendChild(document.createTextNode(value4));

    var button = document.createElement('button');
        button.innerHTML = 'Delete';
        button.onclick = function() {
            tableBody.deleteRow(newRow.rowIndex-1);
        };

    cell5.appendChild(button);
    console.log("appended");
}

function prune(){
    console.log("prune!!!");
}