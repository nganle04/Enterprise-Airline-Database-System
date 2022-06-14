const express = require('express');
const app = express();
const cors = require('cors');
const pool = require('./creds');

app.use(express.static('dbs081'));

// middleware
app.use(cors());
app.use(express.json());

// function to wrtie to a file
var fs = require('fs');
const { table } = require('console');
var tranText = fs.readFileSync('transaction.sql', 'utf8');
var sqlText = fs.readFileSync('query.sql', 'utf8');
let Stran = 'BEGIN TRANSACTION;\n';
let Ctran = 'COMMIT;';
// update text
async function getTran() {
    tranText = fs.readFileSync('transaction.sql', 'utf8');
}

function getSql() {
    sqlText = fs.readFileSync('query.sql', 'utf8');
}
function lastSQL(sqltext) {
    fs.writeFileSync('lastSQL.txt', sqltext)
}
function writeSQL(sqltxt) {
    getSql()
    fs.writeFileSync('query.sql', sqlText + sqltxt + '\n' )
}

function writeTran(trantxt) {
    getTran()
    fs.writeFileSync('transaction.sql', tranText + trantxt + '\n')
}
// display airports

app.get('/airports_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM airports ORDER BY state, airport_id;\n';
        const allRows = await pool.query(sql);
        writeSQL(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});

// display airports end 

// search crew or passenger
app.get('/passenger_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM hold;\n';
        const allRows = await pool.query(sql);
        writeSQL(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});

app.post('/passenger_table', async (req, res) => {
    try {
        const { identification_id } = req.body;
        let sql = 'SELECT personal.identification_id, first_name, last_name, phone, email, descr, ' +
            'board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate ' +
            '\nFROM personal \nJOIN passenger ON personal.identification_id = passenger.identification_id' +
            '\nJOIN board_pass ON personal.identification_id = board_pass.identification_id' +
            ' \nWHERE personal.identification_id = ' + identification_id + ';\n';
        let delCurr = 'DELETE FROM hold;\n'
        let addCurr = 'INSERT INTO hold\n' + sql;
        await pool.query(Stran);
        const newROW = await pool.query(sql);
        await pool.query(delCurr);
        await pool.query(addCurr);
        await pool.query(delCurr);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        writeSQL(sql);
        let x = '' + Stran + delCurr + addCurr + delCurr + Ctran;
        writeTran(x); lastSQL(x);
        res.json(newROW.rows[0]);
    } catch (err) {
        console.log(err.message);
    }
});
app.get('/crew_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM hold2;';
        const allRows = await pool.query(sql);
        writeSQL(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});

app.post('/crew_table', async (req, res) => {
    try {
        const { identification_id } = req.body;
        let sql = 'SELECT personal.identification_id, first_name, last_name, phone, email, descr, ' +
            'board_pass.flight_id, board_pass.board_id, board_pass.checkin_time, board_pass.gate ' +
            '\nFROM personal \nJOIN crew ON personal.identification_id = crew.identification_id' +
            '\nJOIN board_pass ON personal.identification_id = board_pass.identification_id' +
            ' \nWHERE personal.identification_id = ' + identification_id + ';\n';
        let delCurr = 'DELETE FROM hold2;\n'
        let addCurr = 'INSERT INTO hold2\n' + sql;

        await pool.query(Stran);
        const newROW = await pool.query(sql);
        await pool.query(delCurr);
        await pool.query(addCurr);
        await pool.query(delCurr);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        writeSQL(sql);
        let x = '' + Stran + delCurr + addCurr + delCurr + Ctran;
        writeTran(x); lastSQL(x);
        res.json(newROW.rows[0]);
    } catch (err) {
        console.log(err.message);
    }
});
// search crew or passenger end

//flight management

app.post('/flights_table', async (req, res) => {
    try {
        const { flight_id, departured, departure, arrivald, arrival, from_airport, to_airport, plane_id } = req.body;
        let tran = 'INSERT INTO flights\n' +
            'VALUES(' + flight_id + ',\'' + departured + '\',\'' + departure + '\',\'' + arrivald + '\',\n\'' + arrival + '\',\'' + from_airport + '\',\'' + to_airport + '\',\'' + plane_id + '\');\n';
        let newST = 'INSERT INTO support VALUES (' + (flight_id - 77777) + ',\'' + plane_id + '\',' + flight_id + ',\n\'UNKNOWN\', \'NEEDS TO BE CHECKED\', \'UNKOWN\', \'UNKOWN\');\n';
        let flightExtr = 'INSERT INTO extras VALUES ('+flight_id+', \'UNKNOWN\',\'UNKNOWN\',\'UNKOWN\');\n'
        let select = 'SELECT * FROM flights WHERE flight_id = ' + flight_id + ';\n';
        await pool.query(Stran);
        await pool.query(tran);
        await pool.query(newST);
        await pool.query(flightExtr);
        const newROW = await pool.query(select);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        let x = '' + Stran + tran + newST + flightExtr + select + Ctran;
        writeTran(x); lastSQL(x);
        res.json(newROW.rows[0]);
    } catch (err) {
        console.log(err.message);
    }
});
app.get('/flights_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM flights ORDER BY flight_id;\n';
        const allRows = await pool.query(sql);
        writeSQL(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.get('/flights_table/:id', async (req, res) => {
    try {
        const { id } = req.params;
        let sql = 'SELECT * FROM flights WHERE flight_id = $1;\n';
        const Table = await pool.query(sql, [id]);
        writeSQL(sql); lastSQL(sql);
        res.json(Table.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.put("/flights_table/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { departured, departure, arrivald, arrival, from_airport, to_airport, plane_id } = req.body;
        let tran = 'UPDATE flights SET departured = \'' + departured + '\',\ndeparture= \'' + departure + '\',' +
            '\narrivald = \'' + arrivald + '\',\narrival = \'' + arrival + '\',\nfrom_airport = \'' + from_airport + '\',\nto_airport = \'' + to_airport + '\',\nplane_id = \''+ plane_id +
            '\'\nWHERE flight_id = '+id+';\n';
        await pool.query(Stran);
        const updateTable = await pool.query(tran);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        let x = '' + Stran + tran + Ctran;
        writeTran(x); lastSQL(x);
        res.json({ departured, departure, arrivald, arrival, from_airport, to_airport, plane_id })
    } catch (err) {
        console.error(err.message);
    }
});
app.delete("/flights_table/:id", async (req, res) => {
    try {
        const { id } = req.params;
        let select = 'SELECT * FROM flights WHERE flight_id = $1;';
        let tran = `DELETE FROM flights WHERE flight_id = $1;`;
        let delEx = 'DELETE FROM extras WHERE flight_id = $1;';
        let delSupT = 'DELETE FROM support WHERE flight_id = $1;';
        await pool.query(Stran);
        const deleteROW = await pool.query(select, [id]);
        await pool.query(tran, [id]);
        await pool.query(delEx, [id]);
        await pool.query(delSupT,[id]);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        let x = '' + Stran + select + tran + delEx + delSupT + Ctran;
        writeTran(x); lastSQL(x);
        res.json(deleteROW.rows[0]);
    } catch (err) {
        console.log(err.message);
    }
});

// flight management end

// plane support

app.get('/support_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM support ORDER BY flight_id;\n';
        writeSQL(sql);
        const allRows = await pool.query(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.get('/support_table/:id', async (req, res) => {
    try {
        const { id } = req.params;
        let sql = 'SELECT * FROM support WHERE support_no = $1;\n';
        const Table = await pool.query(sql, [id]);
        writeSQL(sql); lastSQL(sql);
        res.json(Table.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.put("/support_table/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { plane_id, flight_id, refueling, maintenance, cleaning, baggage } = req.body;
        let tran = 'UPDATE support SET plane_id = \'' + plane_id + '\',\nflight_id= ' + flight_id + ',' +
            '\nrefueling = \'' + refueling + '\',\nmaintenance = \'' + maintenance + '\',\ncleaning = \'' + cleaning + '\',\nbaggage = \'' + baggage + '\'' +
            '\nWHERE support_no = ' + id + ';\n';
        let updateF = 'UPDATE flights SET plane_id = \'' + plane_id + '\'\nWHERE flight_id = ' + flight_id+';\n';
        await pool.query(Stran);
        const updateTable = await pool.query(tran);
        await pool.query(updateF);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        let x = '' + Stran + tran + updateF + Ctran;
        writeTran(x); lastSQL(x);
        res.json({ id, plane_id, flight_id, refueling, maintenance, cleaning, baggage })
    } catch (err) {
        console.error(err.message);
    }
});

// plane support end

//extras table start 

app.get('/extras_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM extras ORDER BY flight_id\n'; 
        const allRows = await pool.query(sql);
        writeSQL(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.get('/extras_table/:id', async (req, res) => {
    try {
        const { id } = req.params;
        let sql = 'SELECT * FROM extras WHERE flight_id = $1\n';
        const Table = await pool.query(sql, [id]);
        writeSQL(sql); lastSQL(sql);
        res.json(Table.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.put("/extras_table/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const { food_and_bev, movies, wifi } = req.body;
        let tran = 'UPDATE extras SET food_and_bev = \'' + food_and_bev +
            '\',\nmovies = \'' + movies + '\',\nwifi = \'' + wifi + '\'' +
            '\nWHERE flight_id = ' + id + ';\n';
        // perform transaction
        await pool.query(Stran);
        const updateTable = await pool.query(tran);
        await pool.query(Ctran);
        // if transaction successful send to transaction file
        let x = '' + Stran + tran + Ctran;
        writeTran(x); lastSQL(x);
        res.json({ food_and_bev, movies, wifi })
    } catch (err) {
        console.error(err.message);
    }
});

// extras table end

// boarding pass info
app.get('/boarding_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM board_pass\nJOIN personal ON board_pass.identification_id = personal.identification_id\n'+
        'JOIN passenger ON personal.identification_id = passenger.identification_id\n'+
        'UNION\n'+
        'SELECT * FROM board_pass JOIN personal ON board_pass.identification_id = personal.identification_id\n'+
        'JOIN crew ON personal.identification_id = crew.identification_id\n' +
        'ORDER BY board_id;';
        const allRows = await pool.query(sql);
        writeSQL(sql); lastSQL(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});
// boarding pass info end
// planes info

app.get('/planes_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM planes ORDER BY plane_id;';
        writeSQL(sql); lastSQL(sql);
        const allRows = await pool.query(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});
app.post('/planes_table', async (req, res) => {
    try {
        const { plane_id, model, total_seats } = req.body;
        let tran = 'INSERT INTO planes\n' +
            'VALUES(\'' + plane_id + '\',\'' + model + '\',' + total_seats + ');\n';
        let select = 'SELECT * FROM planes WHERE plane_id = \'' + plane_id+'\';\n';
        
        await pool.query(Stran);
        await pool.query(tran);
        const newROW = await pool.query(select);
        await pool.query(Ctran);
        // if transaction successfull send it to tansaction sql file
        let x = '' + Stran + tran + select + Ctran;
        writeTran(x); lastSQL(x);

        res.json(newROW.rows[0]);
    } catch (err) {
        console.log(err.message);
    }
});
//planes info ends

// search for flight

app.get('/searchF_table', async (req, res) => {
    try {
        let sql = 'SELECT * FROM hold3;';
        writeSQL(sql); 
        const allRows = await pool.query(sql);
        res.json(allRows.rows);
    } catch (err) {
        console.log(err.message);
    }
});

app.post('/searchF_table', async (req, res) => {
    try {
        const { flight_id } = req.body;
        let sql = 'SELECT flights.flight_id, departured, departure, arrivald, arrival, from_airport, to_airport,\n' +
            'flights.plane_id, food_and_bev, movies, wifi, support_no, refueling, maintenance, cleaning, baggage' +
            '\nFROM flights \nJOIN extras ON flights.flight_id = extras.flight_id' +
            '\nJOIN support ON flights.flight_id = support.flight_id' +
            ' \nWHERE flights.flight_id = ' + flight_id + ';\n';
        let delCurr = 'DELETE FROM hold3;\n'
        let addCurr = 'INSERT INTO hold3\n' + sql;
        let getCurr = 'SELECT * FROM hold3;\n';
        await pool.query(Stran);
        await pool.query(delCurr);
        await pool.query(addCurr);
        const newRow = await pool.query(getCurr);
        await pool.query(delCurr);
        await pool.query(Ctran);
        // if transaction successful type to transaction file
        writeSQL(sql);
        let x = '' + Stran + delCurr + addCurr + getCurr + delCurr + Ctran;
        writeTran(x); lastSQL(x);
        res.json(newRow.rows[0]);
    } catch (err) {
        console.log(err.message);
    }
});

app.get('/lastSQL', async (req, res) => {
    let T = fs.readFileSync('lastSQL.txt', 'utf8');
    res.json(T);
});

app.get('/lastTAB', async (req, res) => {
    let T = fs.readFileSync('lasttab.txt', 'utf8');
    res.json(T);
});

app.post('/currTAB', async (req, res) => {
    const { table_name } = req.body;
    fs.writeFileSync('lasttab.txt', table_name);
    res.json();
});
// search for flight ends 

app.post('/IDcheck', async (req, res) => {
    try {
        const { identification_id, table_name, id_type } = req.body;
        let sql = 'SELECT * FROM ' + table_name + ' WHERE ' + id_type + " = " + identification_id + ';';
        if (table_name == 'airports' || table_name == 'planes') {
            sql = 'SELECT * FROM ' + table_name + ' WHERE ' + id_type + " = \'" + identification_id + '\';';
        }
        writeSQL(sql);
        const Row = await pool.query(sql);
        let x = true;
        if (Row.rows[0] == undefined) {
            x = false;
        }
    res.json(x);
    } catch (err) {
        console.log(err.message);
    }
});


app.get('*', function (req, res) {
    res.sendFile(path.join(__dirname + '/public/index.html'));
});

//-------------

// set up the server listening at port 5000 (the port number can be changed)
const port = process.env.PORT || 5000;
app.listen(port, () => {
    console.log(`server has started on port ${port}`);
});


