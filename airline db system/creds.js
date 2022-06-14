const { Pool } = require('pg');

const pool = new Pool({
    "host": "3380db.cs.uh.edu",
    "user": "dbs081",
    "password": "1771888N",
    "database": "COSC3380",
    "port": 5432
});

module.exports = pool;