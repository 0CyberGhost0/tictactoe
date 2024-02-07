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

    socket.on('createRoom', async ({ nickname }) => {
        console.log(nickname);

        //        create Room
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
            io.to(roomId).emit("createRoomSuccess", room);
        } catch (e) {
            console.log(e);
        }
        //        player is stored in a room
        //        player is taken to next screen
    });
    socket.on('joinRoom', async ({ nickname, roomId }) => {
        try {
            if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit('errorOccured', 'Please Enter Valid room ID');
                return;
            }
            let room = await Room.findById(roomId);
            if (room.isJoin) {
                let player = {
                    nickname,
                    socketID: socket.id,
                    playerType: 'O',
                }
                socket.join(roomId);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                io.to(roomId).emit("joinRoomSuccess", room);
                io.to(roomId).emit("updatePlayers", room.players);
                io.to(roomId).emit("updateRoom", room);
            }
            else {
                socket.emit('errorOccured', 'Game is in progress ,try again later');
            }
        } catch (e) {
            console.log(e);
        }
    });
    socket.on('tap', async ({ index, roomId }) => {
        try {
            let room=await Room.findById(roomId);
            let choice=room.turn.playerType;
            if(room.turnIndex==0){
                room.turn=room.players[1];
                room.turnIndex=1;
            }
            else{
                room.turn=room.players[0];
                room.turnIndex=0;
            }
            room=await room.save();
            io.to(roomId).emit('tapped',{
                index,
                choice,
                room,
            });

        } catch (e) {
            console.log(e);
        }
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
