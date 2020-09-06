const express = require('express');
const app = express();
const port = process.env.PORT || 80;
app.use(express.static('static'));

app.get('/', (req, res) => {
    res.sendFile('index.html');
});

app.listen(port, () => {
    console.log('Server is started on port: ' + port);
});
