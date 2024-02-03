const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const Room = require("./models/room");
const io = require("socket.io")(server);

// Middleware
app.use(express.json());

const DB = "mongodb+srv://prakashved0702:ved1234@cluster0.rniuzud.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("connected");

    socket.on("createRoom", async ({ nickname }) => {
        console.log(nickname);

        //create Room
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname: nickname,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn = player;
            room = await room.save();
            const roomId = room._id.toString();
            socket.join(roomId);
            io.to(roomId).emit("createRoomSuccess",room);
        } catch (e) {
            console.log(e);
        }
        //player is stored in a room
        //player is taken to next screen
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
