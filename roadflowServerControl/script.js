function addelm(){
    var lattitude = document.getElementById('lattitude').value;
    var Longitude = document.getElementById('Longitude').value;
    var date = document.getElementById('dateTimeInput').value;
    var val=document.getElementById('valueInput').value;

    if (!lattitude.trim() || !Longitude.trim() || !date.trim() || !val.trim()) {
        alert('Please enter valid value before submitting.');
        return;
    }
    // addToTable(lattitude,Longitude,date,val);
    const id=enterdataToDb(date,lattitude,Longitude,val);
    console.log("id-"+id);
    console.log(lattitude +"-"+Longitude+"-"+date+"-"+val);
    document.getElementById('inputform').reset();
}

function addToTable() {
    // var tableBody = document.getElementById('datatable').getElementsByTagName('tbody')[0];

    // var newRow = tableBody.insertRow(tableBody.rows.length);

    // var cell1 = newRow.insertCell(0);
    // var cell2 = newRow.insertCell(1);
    // var cell3 = newRow.insertCell(2);
    // var cell4 = newRow.insertCell(3);
    // var cell5 = newRow.insertCell(4);
    // var cell6 = newRow.insertCell(5);

    // cell1.appendChild(document.createTextNode(doc.data.lattitude));
    // cell2.appendChild(document.createTextNode(doc.data.Longitude));
    // cell3.appendChild(document.createTextNode(doc.data.date));
    // cell4.appendChild(document.createTextNode(doc.data.value));
    
    // var button = document.createElement('button');
    //     button.innerHTML = 'Delete';
    //     button.onclick = function() {

    //         tableBody.deleteRow(newRow.rowIndex+1);
    //     };

    // cell5.appendChild(button);
    // console.log("appended");
    // cell6.appendChild(document.createTextNode(doc.id));
}

function printGeopoints() {
    firebase.firestore().collection("geopoints")
        .get()
        .then((querySnapshot) => {
            querySnapshot.forEach((doc) => {
                console.log(doc.id, " => ", doc.data());
            });
        })
        .catch((error) => {
            console.error("Error getting documents: ", error);
        });
}


function prune(){
    showAllData();
}

function enterdataToDb(date,lattitude,Longitude,value) {
    // var firestore = firebase.firestore();
    firebase.firestore().collection("geopoints").add({
        dateupdated: date,
        lattitude: lattitude,
        Longitude: Longitude,
        value: value,

    })
    .then((docRef) => {
        alert("User details saved successfully!");
        console.log(docRef.id)
        return docRef.id; // Return the document ID
    })
    .catch((error) => {
        alert(`Error saving user details: ${error.message}`);
        return null; // Return null in case of error
    });

}

function showAllData() {
    clearTable();
    var docdat;
    firebase.firestore().collection("geopoints")
        .get()
        .then((querySnapshot) => {
            querySnapshot.forEach((doc) => {
                // console.log("Document ID:", doc.id);
                // console.log("Data:", doc.data());

                var tableBody = document.getElementById('datatable').getElementsByTagName('tbody')[0];

                var newRow = tableBody.insertRow(tableBody.rows.length);

                var cell1 = newRow.insertCell(0);
                var cell2 = newRow.insertCell(1);
                var cell3 = newRow.insertCell(2);
                var cell4 = newRow.insertCell(3);
                var cell5 = newRow.insertCell(4);
                var cell6 = newRow.insertCell(5);

                cell1.appendChild(document.createTextNode(doc.data().lattitude));
                cell2.appendChild(document.createTextNode(doc.data().Longitude));
                cell3.appendChild(document.createTextNode(doc.data().dateupdated));
                cell4.appendChild(document.createTextNode(doc.data().value));
                
                var button = document.createElement('button');
                    button.innerHTML = 'Delete';
                    button.onclick = function() {

                        tableBody.deleteRow(newRow.rowIndex+1);
                    };

                cell5.appendChild(button);
                console.log("appended");
                cell6.appendChild(document.createTextNode(doc.id));
            });
        })
        .catch((error) => {
            console.error("Error getting documents: ", error);
        });
}

function clearTable() {
    var table = document.getElementById("datatable"); // Get reference to the table element in your HTML
    var tbody = table.getElementsByTagName("tbody")[0]; // Get reference to the table body
    
    // Remove all rows from the table
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
    console.log("table cleared");
}
