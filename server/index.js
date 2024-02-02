const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const io = require("socket.io")(server);

// Middleware
app.use(express.json());

const DB = "mongodb+srv://prakashved0702:ved1234@cluster0.rniuzud.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("connected");

    socket.on("createRoom", ({ nickname }) => {
        console.log(nickname);
    });
});

mongoose.connect(DB)
    .then(() => {
        console.log("Connection Successful");
    })
    .catch((e) => {
        console.log(e);
    });

server.listen(port, "0.0.0.0", () => {
    console.log(`Server started and running on Port ${port}`);
});
