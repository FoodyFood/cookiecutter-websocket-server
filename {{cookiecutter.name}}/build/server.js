// Create server for web socket (socket.io)
// deepcode ignore HttpToHttps: https is handles at ingress
const wsserver = require('http').createServer();
const io = require('socket.io')(wsserver, {
    cors: { origin: "*" }
});


// WebSocket, on -> thing, means it is listerning for 'thing'
io.on('connection', (socket) => {
    console.log('Client with SocketID: ' + socket.id + ' connected');

    
    // Welcome message, sends on at 'connection'
    socket.emit("message", 'Hi, Welcome to {{ cookiecutter.name }} chat!');
    

    // If a message comes in, reflect it to the connected users
    socket.on('message', (message) =>     {
        console.log(socket.id + ": message: " + message);
        io.emit('message', `${message}`);
    });
});


// Start listener
wsserver.listen(8080, () => console.log('Socket.io listening on http://localhost:8080') );
