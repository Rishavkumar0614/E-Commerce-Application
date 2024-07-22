// imports from node modules
const express = require('express');
const mongoose = require('mongoose');
const cred = require('./MongoDB Cred');
// imports from other files
const authRouter = require('./routes/auth');

const PORT = 3000;
const app = express();
const DB = `mongodb+srv://${cred.username}:${cred.password}@cluster0.s1hd4pw.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`;

app.use(express.json());
app.use(authRouter);

mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
});

app.listen(PORT, "0.0.0.0", () => { });