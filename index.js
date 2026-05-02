const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// 'public' folder se static files serve karne ke liye
app.use(express.static(path.join(__dirname, 'public')));

// Jab koi root URL (/) par aaye toh index.html dikhayein
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(port, () => {
    console.log(`Security Dashboard running at http://localhost:${port}`);
});