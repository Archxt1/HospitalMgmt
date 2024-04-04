const mysql = require('mysql');
const express = require('express');
const app = express();

// Database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'admin1'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to the database');
});

// Update data in database
app.post('/update', (req, res) => {
    const id = req.body.id;
    const name = req.body.name;
    const email = req.body.email;
    const phone = req.body.phone;
    const message = req.body.message;

    const sql = `UPDATE contacts SET name='${name}', email='${email}', phone='${phone}', message='${message}' WHERE id=${id}`;

    db.query(sql, (err, result) => {
        if (err) throw err;
        res.send('Record updated successfully');
    });
});

// Insert data into database
app.post('/insert', (req, res) => {
    const name = req.body.name;
    const email = req.body.email;
    const phone = req.body.phone;
    const message = req.body.message;

    const sql = `INSERT INTO contacts (name, email, phone, message) VALUES ('${name}', '${email}', '${phone}', '${message}')`;

    db.query(sql, (err, result) => {
        if (err) throw err;
        res.send('New record created successfully');
    });
});

// Delete data from database
app.post('/delete', (req, res) => {
    const id = req.body.id;

    const sql = `DELETE FROM contacts WHERE id=${id}`;

    db.query(sql, (err, result) => {
        if (err) throw err;
        res.send('Record deleted successfully');
    });
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});