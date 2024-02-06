import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/widgets/customTextField.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIDController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    roomIDController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    roomIDController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Waiting for a Player to Join...'),
        SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: roomIDController,
          hintText: ' ',
          isReadOnly: true,
        ),
      ],
    );
  }
}
