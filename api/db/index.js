const mysql = require('mysql')

const db = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: 'Qq1767927045',
    database: 'db_oa'
})


module.exports = db