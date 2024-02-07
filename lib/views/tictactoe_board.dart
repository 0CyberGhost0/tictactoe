import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resource/socket_method.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.tappedListener(context);
  }

  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(
      index,
      roomDataProvider.roomData['_id'],
      roomDataProvider.displayElements,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.7, maxWidth: 500),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['socketID'] !=
            _socketMethods.socketClient.id,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () => tapped(index, roomDataProvider),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    child: Text(
                      roomDataProvider.displayElements[index],
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 40,
                            color:
                                roomDataProvider.displayElements[index] == 'O'
                                    ? Colors.blue
                                    : Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
