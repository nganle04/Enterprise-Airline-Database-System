// -------------------- function for tabs ----------------
async function openTable(evt, tableN) {
    document.getElementById("set-anchor").innerHTML = "";
    //console.log(table_name);
    //getTotalAtt();
    //console.log(total_attributes);
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(tableN).style.display = "block";
    evt.currentTarget.className += " active";
}
refresh();
// ------------------ function for tabs ends ---------------
async function refresh() {
    selectExtras();
    selectSupport();
    selectFlight();
    let T = await getlastTab();
    console.log(T);
    let z = "document.getElementById(\"" + T + "\").style.display = \"block\";";
    console.log(z);
    document.getElementById(T).style.display = "block";
    await setCurrT('home_page');
}
// display airports ------------------------------
let airports_table = []
const setAirports = (data) => {
    airports_table = data;
}

const displayAirports = () => {
    airports_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#airport-table');
    let tableHTML = "";
    airports_table.map(airports => {
        tableHTML +=
            `<tr key=${airports.airport_id}>
    <th>${airports.airport_id}</th>
    <th>${airports.airport_name}</th>
    <th>${airports.state}</th>
    <th>${airports.city}</th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}
selectAiport();
async function selectAiport() {
    try {
        const response = await fetch("http://localhost:5000/airports_table")
        const jsonData = await response.json();
        setAirports(jsonData);
        displayAirports();
    } catch (err) {
        console.log(err.message);
    }
}
// airports display end ------------------------------

// search crew or passenger ------------------------------
let passenger_table = []
const setPassenger = (data) => {
    passenger_table = data;
}

const displayPassenger = () => {
    passenger_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#display-passenger');
    let tableHTML = "";
    passenger_table.map(passenger => {
        tableHTML +=
            `<tr id = "tr-passenger" key=${passenger.identification_id}>
    <th id="idNOout">${passenger.identification_id}</th>
    <th id="Fnameout">${passenger.first_name}</th>
    <th id="Lnameout">${passenger.last_name}</th>
    <th id="phoneNOout">${passenger.phone}</th>
    <th id="emailout">${passenger.email}</th>
    <th id="seatNOout">${passenger.descr}</th>
    <th id="flightIDout">${passenger.flight_id}</th>
    <th id="passout">${passenger.board_id}</th>
    <th id="timeout">${passenger.checkin_time}</th>
    <th id="gateout">${passenger.gate}</th>
    <th id="img">
    <img id="img1" src="pictures/mugshot.png" alt = "mugshot">
    </th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}

selectPassenger();
async function selectPassenger() {
    try {
        // GET all records from "http://localhost:5000/passenger_table"
        const response = await fetch("http://localhost:5000/passenger_table")
        const jsonData = await response.json();
        setPassenger(jsonData);
        displayPassenger();
    } catch (err) {
        console.log(err.message);
    }
}

async function getPassenger() {
    // read data from input
    const inputID = document.querySelector('#pk_id').value;
    const x = await checkid(inputID, 'passenger', 'identification_id');
    if (x) {
        try {
            const body = { identification_id: inputID };
            const response = await fetch("http://localhost:5000/passenger_table", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });
            const newRow = await response.json();
            passenger_table.pop();
            passenger_table.push(newRow);
            displayPassenger();
            passenger_table.pop();
            inputID.value = '';
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert('ID '+ inputID + ' is invalid,\nplease make sure you are inputting a correct 8 digit #.\n' +
            'This person may also not be registered yet, check boarding table to confirm');
    }
}
let crew_table = []
const setCrew = (data) => {
    crew_table = data;
}

const displayCrew = () => {
    crew_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#display-crew');
    let tableHTML = "";
    crew_table.map(crew => {
        tableHTML +=
            `<tr id = "tr-passenger" key=${crew.identification_id}>
    <th id="idNOout">${crew.identification_id}</th>
    <th id="Fnameout">${crew.first_name}</th>
    <th id="Lnameout">${crew.last_name}</th>
    <th id="phoneNOout">${crew.phone}</th>
    <th id="emailout">${crew.email}</th>
    <th id="seatNOout">${crew.descr}</th>
    <th id="flightIDout">${crew.flight_id}</th>
    <th id="passout">${crew.board_id}</th>
    <th id="timeout">${crew.checkin_time}</th>
    <th id="gateout">${crew.gate}</th>
    <th id="img">
    <img id="img1" src="pictures/mugshot.png" alt = "mugshot">
    </th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}

selectCrew();
async function selectCrew() {
    try {
        // GET all records from "http://localhost:5000/crew_table"
        const response = await fetch("http://localhost:5000/crew_table")
        const jsonData = await response.json();
        setCrew(jsonData);
        displayCrew();
    } catch (err) {
        console.log(err.message);
    }
}

async function getCrew() {
    // read data from input
    const inputID = document.querySelector('#pk_idC').value;
    const x = await checkid(inputID, 'crew', 'identification_id');
    if (x) {
        try {
            const body = { identification_id: inputID };

            const response = await fetch("http://localhost:5000/crew_table", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });
            const newRow = await response.json();
            crew_table.pop();
            crew_table.push(newRow);
            displayCrew();
            crew_table.pop();
            inputID.value = '';
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert('ID ' + inputID + ' is invalid,\nplease make sure you are inputting a correct 8 digit #.\n' +
            'This person may also not be a crew member, try passenger search');
    }
}
// search crew or passenger end ------------------------------

// add edit flights ------------------------------
let flights_table = []
const setFlight = (data) => {
    flights_table = data;
}



const displayFlight = () => {
    flights_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#flights-table');
    let tableHTML = "";
    flights_table.map(flights => {
        tableHTML +=
            `<tr key=${flights.flight_id}>
    <th>${flights.flight_id}</th>
    <th>${flights.departured.split('T')[0]}</th>
    <th>${flights.departure}</th>
    <th>${flights.arrivald.split('T')[0]}</th>
    <th>${flights.arrival}</th>
    <th>${flights.from_airport}</th>
    <th>${flights.to_airport}</th>
    <th>${flights.plane_id}</th>
    <th><button class="btn btn-warning" type="button" data-toggle="modal" data-target="#edit-modal-flights" onclick="editFlight(${flights.flight_id})">Edit</button></th>
    <th><button class="btn btn-danger" type="button" onclick="deleteFlight(${flights.flight_id})">Delete</button></th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}
selectFlight();
async function selectFlight() {
    try {
        // GET all records from "http://localhost:5000/flights_table"
        const response = await fetch("http://localhost:5000/flights_table")
        const jsonData = await response.json();
        setFlight(jsonData);
        displayFlight();
    } catch (err) {
        console.log(err.message);
    }
}

async function insertFlight() {
    // read data from input
    const inputID = document.querySelector('#k1').value;
    const inputDEPARTURED = document.querySelector('#a1').value;
    const inputDEPARTURE = document.querySelector('#b1').value;
    const inputARRIVALD = document.querySelector('#c1').value;
    const inputARRIVAL = document.querySelector('#d1').value;
    const inputFROM = document.querySelector('#e1').value;
    const inputTO = document.querySelector('#f1').value;
    const inputPLANE_ID = document.querySelector('#g1').value;

    // want x to be false to allow this new flight
    let x = await checkid(inputID, 'flights', 'flight_id');
    // want y, z, and k to be true
    let y = await checkid(inputFROM, 'airports', 'airport_id');
    let z = await checkid(inputTO, 'airports', 'airport_id');
    let k = await checkid(inputPLANE_ID, 'planes', 'plane_id');
    let j = true;
    if (inputDEPARTURED > inputARRIVALD) {
        j = false;
    }
    if (x == false && 99999 < inputID && inputID < 1000000) {
        if (y && z && k && j) {
            try {
                const body = { flight_id: inputID, departured: inputDEPARTURED, departure: inputDEPARTURE, arrivald: inputARRIVALD, arrival: inputARRIVAL, from_airport: inputFROM, to_airport: inputTO, plane_id: inputPLANE_ID };

                const response = await fetch("http://localhost:5000/flights_table", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(body)
                });
                const newRow = await response.json();
                flights_table.push(newRow);
                displayFlight();
                inputID.value = '';
                inputDEPARTURED.value = '';
                inputDEPARTURE.value = '';
                inputARRIVALD.value = '';
                inputARRIVAL.value = '';
                inputFROM.value = '';
                inputTO.value = '';
                inputPLANE_ID.value = '';
            } catch (err) {
                console.log(err.message);
            }
        } else if (j == false) {
            alert('departured date cannot be ahead of arrival date');
        } else if (y == false) {
            alert(inputFROM + ' is not a proper airport code,\n refer to the airports table for the codes');
        } else if (z == false) {
            alert(inputTO + ' is not a proper airport code,\n refer to the airports table for the codes');
        } else {
            alert(inputPLANE_ID + ' is not an available model plane,\n refer to the planes table for available aircraft');
        }
    } else if (x) {
        alert(inputID + ' is already flight\n try another 6 digit #');
    } else {
        alert(inputID + ' is not a 6 digit #, \ntry again');
    }   
}

async function deleteFlight(id) {
    try {
        const deletedROW = await fetch(`http://localhost:5000/flights_table/${id}`, {
            method: "DELETE"
        })
        const deleteROW = await deletedROW.json();
        flights_table = flights_table.filter(flights => flights.flight_id != deleteROW.flight_id);
        displayFlight();
    } catch (err) {
        console.log(err.message);
    }
}

const editFlight = (id) => {
    const depard = flights_table.filter(flights => flights.flight_id === id)[0].departured.split('T')[0];
    const depar = flights_table.filter(flights => flights.flight_id === id)[0].departure;
    const arrd = flights_table.filter(flights => flights.flight_id === id)[0].arrivald.split('T')[0];
    const arr = flights_table.filter(flights => flights.flight_id === id)[0].arrival;
    const from = flights_table.filter(flights => flights.flight_id === id)[0].from_airport;
    const to = flights_table.filter(flights => flights.flight_id === id)[0].to_airport;
    const plane = flights_table.filter(flights => flights.flight_id === id)[0].plane_id;

    document.querySelector('#edited-a1').value = depard;
    document.querySelector('#edited-b1').value = depar;
    document.querySelector('#edited-c1').value = arrd;
    document.querySelector('#edited-d1').value = arr;
    document.querySelector('#edited-e1').value = from;
    document.querySelector('#edited-f1').value = to;
    document.querySelector('#edited-g1').value = plane;
    document.querySelector('#save-edit-flights').addEventListener("click", function () { updateFlight(id) });
}
async function updateFlight(id) {

    await setCurrT('flights');

    const deparrD = document.querySelector('#edited-a1').value;
    const deparr = document.querySelector('#edited-b1').value;
    const arrD = document.querySelector('#edited-c1').value;
    const arr = document.querySelector('#edited-d1').value;
    const from = document.querySelector('#edited-e1').value;
    const to = document.querySelector('#edited-f1').value;
    const plane = document.querySelector('#edited-g1').value;

    // want y, z, and k to be true
    let y = await checkid(from, 'airports', 'airport_id');
    let z = await checkid(to, 'airports', 'airport_id');
    let k = await checkid(plane, 'planes', 'plane_id');
    let j = true;
    if (deparrD > arrD) {
        j = false;
    }
        if (y && z && k && j) {
            try {
                const body = { departured: deparrD, departure: deparr, arrivald: arrD, arrival: arr, from_airport: from, to_airport: to, plane_id: plane };
                const response = await fetch(`http://localhost:5000/flights_table/${id}`, {
                    method: "PUT",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(body)
                })

                let flights = flights_table.find(t => t.flight_id === id);
                flights.departured = deparrD;
                flights.departure = deparr;
                flights.arrivald = arrD;
                flights.arrival = arr;
                flights.from_airport = from;
                flights.to_airport = to;
                flights.plane_id = plane;
                displayFlight();

                location.reload();
                // bug was fixed
                /* alert('you have updated flight ' + id + ' successfully,' +
                    '\nSorry for the inconvenience but you will be redirected to a different tab\n' +
                    'we are currently working on a on going bug, head back to flights tab to see updated result for:\n' +
                    '(' + id + ')'); */

            } catch (err) {
                console.log(err.message);
            }
        } else if (j == false) {
            alert('departured date cannot be ahead of arrival date.' +
                '\nTry to edit flight'+id+' again if you wish');
        } else if (y == false) {
            alert(from + ' is not a proper airport code,\n refer to the airports table for the codes' +
                '\nTry to edit flight' + id + ' again if you wish');
        } else if (z == false) {
            alert(to + ' is not a proper airport code,\n refer to the airports table for the codes' +
                '\nTry to edit flight' + id + ' again if you wish');
        } else {
            alert(plane + ' is not an available model plane,\n refer to the planes table for available aircraft' +
                '\nTry to edit flight' + id + ' again if you wish');
        }
}
// end of flights management ------------------------------

// plane support management ------------------------------
let support_table = []
const setSupport = (data) => {
    support_table = data;
}

const displaySupport = () => {
    support_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#support-table');
    let tableHTML = "";
    support_table.map(support => {
        tableHTML +=
            `<tr key=${support.support_no}>
    <th>${support.support_no}</th>
    <th>${support.plane_id}</th>
    <th>${support.flight_id}</th>
    <th>${support.refueling}</th>
    <th>${support.maintenance}</th>
    <th>${support.cleaning}</th>
    <th>${support.baggage}</th>
    <th><button class="btn btn-warning" type="button" data-toggle="modal" data-target="#edit-modal-support" onclick="editSupport(${support.support_no})">Edit</button></th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}
selectSupport();
async function selectSupport() {
    try {
        // GET all records from "http://localhost:5000/support_table"
        const response = await fetch("http://localhost:5000/support_table")
        const jsonData = await response.json();
        setSupport(jsonData);
        displaySupport();
    } catch (err) {
        console.log(err.message);
    }
}

const editSupport = (id) => {
    const Sid = support_table.filter(support => support.support_no === id)[0].support_no;
    const pID = support_table.filter(support => support.support_no === id)[0].plane_id;
    const id2 = support_table.filter(support => support.support_no === id)[0].flight_id;
    const fuel = support_table.filter(support => support.support_no === id)[0].refueling;
    const maint = support_table.filter(support => support.support_no === id)[0].maintenance;
    const cleaning = support_table.filter(support => support.support_no === id)[0].cleaning;
    const baggage = support_table.filter(support => support.support_no === id)[0].baggage;

    document.querySelector('#edited-aS').value = pID;
    document.querySelector('#edited-bS').value = fuel;
    document.querySelector('#edited-cS').value = maint;
    document.querySelector('#edited-dS').value = cleaning;
    document.querySelector('#edited-eS').value = baggage;
    document.querySelector('#save-edit-support').addEventListener("click", function () { updateSupport(id, Sid, id2) });
}
async function updateSupport(id, support_no, flight_id) {

    await setCurrT('support');

    const plane_id = document.querySelector('#edited-aS').value;
    const refueling = document.querySelector('#edited-bS').value;
    const maintenance = document.querySelector('#edited-cS').value;
    const cleaning = document.querySelector('#edited-dS').value;
    const baggage = document.querySelector('#edited-eS').value;
    let x = await checkid(plane_id, 'planes', 'plane_id');
    if (x) {
        try {
            const body = { support_no: support_no, plane_id: plane_id, flight_id: flight_id, refueling: refueling, maintenance: maintenance, cleaning: cleaning, baggage: baggage };
            const response = await fetch(`http://localhost:5000/support_table/${id}`, {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            })

            let support = support_table.find(t => t.support_no === id);
            support.support_no = support_no;
            support.plane_id = plane_id;
            support.flight_id = flight_id;
            support.refueling = refueling;
            support.maintenance = maintenance;
            support.cleaning = cleaning;
            support.baggage = baggage;
            displaySupport();

            location.reload();
            //bug was fixed
            /*alert('you have updated support no. ' + support_no + ' successfully,' +
                '\nSorry for the inconvenience but you will be redirected to a different tab\n' +
                'we are currently working on a on going bug, head back to support tab to see updated results for:\n' +
                '(' + support_no + ', ' + plane_id + ', ' + flight_id + ')'); */

        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert('ID ' + pID + ' does not refer to a proper plane model,\n please see planes tab to see models');
    }
}
// support management end ------------------------------

// flight extras table ------------------------------

let extras_table = []
const setExtras = (data) => {
    extras_table = data;
}

const displayExtras = () => {
    extras_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#extras-table');
    let tableHTML = "";
    extras_table.map(extras => {
        tableHTML +=
            `<tr key=${extras.flight_id}>
    <th>${extras.flight_id}</th>
    <th>${extras.food_and_bev}</th>
    <th>${extras.movies}</th>
    <th>${extras.wifi}</th>
    <th><button class="btn btn-warning" type="button" data-toggle="modal" data-target="#edit-modal-extras" onclick="editExtras(${extras.flight_id})">Edit</button></th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}
selectExtras();
async function selectExtras() {
    try {
        // GET all records from "http://localhost:5000/extras_table"
        const response = await fetch("http://localhost:5000/extras_table")
        const jsonData = await response.json();
        setExtras(jsonData);
        displayExtras();
    } catch (err) {
        console.log(err.message);
    }
}

const editExtras = (id) => {
    const food = extras_table.filter(extras => extras.flight_id === id)[0].food_and_bev;
    const movies = extras_table.filter(extras => extras.flight_id === id)[0].movies;
    const wifi = extras_table.filter(extras => extras.flight_id === id)[0].wifi;
    
    document.querySelector('#edited-aE').value = food;
    document.querySelector('#edited-bE').value = movies;
    document.querySelector('#edited-cE').value = wifi;
    document.querySelector('#save-edit-extras').addEventListener("click", function () { updateExtras(id) });
}

async function updateExtras(id) {

    await setCurrT('extras');

    const food = document.querySelector('#edited-aE').value;
    const movies = document.querySelector('#edited-bE').value;
    const wifi = document.querySelector('#edited-cE').value;
    try {
        const body = { food_and_bev: food, movies: movies, wifi: wifi };
        const response = await fetch(`http://localhost:5000/extras_table/${id}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body)
        })
        let extras = extras_table.find(t => t.flight_id === id);
        extras.food_and_bev = food;
        extras.movies = movies;
        extras.wifi = wifi;

        displayExtras();
        location.reload();

        //bug was fixed
        /*alert('you have updated flight ' + id + ' available extras successfully,' +
            '\nSorry for the inconvenience but you will be redirected to a different tab\n' +
            'we are currently working on a on going bug, head back to extras tab to see updated result for:\n' +
            '(' + id + ')'); */
    } catch (err) {
        console.log(err.message);
    }
}

// flight extras end ------------------------------

// boarding information for passengers and crew ------------------------------

let boarding_table = []
const setBoarding = (data) => {
    boarding_table = data;
}

const displayBoarding = () => {
    boarding_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#board-table');
    let tableHTML = "";
    boarding_table.map(board_pass => {
        tableHTML +=
            `<tr key=${board_pass.boarding_table}>
    <th>${board_pass.board_id}</th>
    <th>${board_pass.identification_id}</th>
    <th>${board_pass.flight_id}</th>
    <th>${board_pass.checkin_time}</th>
    <th>${board_pass.gate}</th>
    <th>${board_pass.first_name}</th>
    <th>${board_pass.last_name}</th>
    <th>${board_pass.phone}</th>
    <th>${board_pass.email}</th>
    <th>${board_pass.descr}</th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}
selectBoarding();
async function selectBoarding() {
    try {
        const response = await fetch("http://localhost:5000/boarding_table")
        const jsonData = await response.json();
        setBoarding(jsonData);
        displayBoarding();
    } catch (err) {
        console.log(err.message);
    }
}

// boarding information for passengers and crew END ------------------------------

// display plane types  ------------------------------

let planes_table = []
const setPlanes = (data) => {
    planes_table = data;
}

const displayPlanes = () => {
    planes_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#planes-table');
    let tableHTML = "";
    planes_table.map(planes => {
        tableHTML +=
            `<tr key=${planes.plane_id}>
    <th>${planes.plane_id}</th>
    <th>${planes.model}</th>
    <th>${planes.total_seats}</th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}
selectPlanes();
async function selectPlanes() {
    try {
        // GET all records from "http://localhost:5000/planes_table"
        const response = await fetch("http://localhost:5000/planes_table")
        const jsonData = await response.json();
        setPlanes(jsonData);
        displayPlanes();
    } catch (err) {
        console.log(err.message);
    }
}

async function insertPlanes() {
    // read data from input
    const inputID = document.querySelector('#kP').value;
    const inputMODEL = document.querySelector('#aP').value;
    const inputSEATS = document.querySelector('#bP').value;
    let x = await checkid(inputID, 'planes', 'plane_id');
    if (x == false) {
        try {
            const body = { plane_id: inputID, model: inputMODEL, total_seats: inputSEATS };

            const response = await fetch("http://localhost:5000/planes_table", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });
            const newRow = await response.json();
            planes_table.push(newRow);
            displayPlanes();
            inputID.value = '';
            inputMODEL.value = '';
            inputSEATS.value = '';
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert('There is already a plane model with ' + inputID +' as an ID');
    }

}
// display plane types ends ------------------------------

// search for flight 

let searchF_table = []
const setsearchF = (data) => {
    searchF_table = data;
}

const displaySflight = () => {
    searchF_table.sort((a, b) => {
        return a.key - b.key;
    });
    const dispTable = document.querySelector('#display-flight');
    let tableHTML = "";
    searchF_table.map(searchF => {
        tableHTML +=
            `<tr id = "tr-passenger" key=${searchF.flight_id}>
    <th id="aaout">${searchF.flight_id}</th>
    <th id="ddout">${searchF.departured}</th>
    <th id="ccout">${searchF.departure}</th>
    <th id="ggout">${searchF.arrivald}</th>
    <th id="ffout">${searchF.arrival}</th>
    <th id="eeout">${searchF.from_airport}</th>
    <th id="hhout">${searchF.to_airport}</th>
    <th id="bbout">${searchF.plane_id}</th>
    <th id="iiout">${searchF.food_and_bev}</th>
    <th id="jjout">${searchF.movies}</th>
    <th id="kkout">${searchF.wifi}</th>
    <th id="llout">${searchF.support_no}</th>
    <th id="mmout">${searchF.refueling}</th>
    <th id="nnout">${searchF.maintenance}</th>
    <th id="ooout">${searchF.cleaning}</th>
    <th id="ppout">${searchF.baggage}</th>
    </tr>`;
    })
    dispTable.innerHTML = tableHTML;
}

selectCrew();
async function selectSearchF() {
    try {
        // GET all records from "http://localhost:5000/searchF_table"
        const response = await fetch("http://localhost:5000/searchF_table")
        const jsonData = await response.json();
        setsearchF(jsonData);
        displaySflight();
    } catch (err) {
        console.log(err.message);
    }
}

async function getFlight() {

    // read data from input
    const inputID = document.querySelector('#f_id').value;
    const x = await checkid(inputID, 'flights', 'flight_id');
    if (x) {
        try {
            const body = { flight_id: inputID };

            const response = await fetch("http://localhost:5000/searchF_table", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(body)
            });
            const newRow = await response.json();
            searchF_table.pop();
            searchF_table.push(newRow);
            displaySflight();
            searchF_table.pop();
            inputID.value = '';
        } catch (err) {
            console.log(err.message);
        }
    } else {
        alert('Flight ' + inputID + ' does not exist\nplease make sure you are inputting the correct 6 digit #' +
            '\nto create a new flight head over to the flights tab');
    }
}

// displays the last ran query
async function getSQLT() {
    const response = await fetch("http://localhost:5000/lastSQL", {
        method: "GET"
    });
    const text = await response.json();
    alert(text);
}

async function getlastTab() {
    const response = await fetch("http://localhost:5000/lastTAB", {
        method: "GET"
    });
    return await response.json();
}

async function setCurrT(TN) {
    bod = { table_name: TN };
    const response = await fetch("http://localhost:5000/currTAB", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(bod)
    });
}
async function checkid (id, tname, idname) {
    bod = { identification_id: id, table_name: tname, id_type: idname };
    const checkID = await fetch("http://localhost:5000/IDcheck", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(bod)
    });
    return await checkID.json();
}