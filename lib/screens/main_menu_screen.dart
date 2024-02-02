import 'package:flutter/material.dart';
import 'package:tictactoe/buttons/custom_button.dart';
import 'package:tictactoe/main.dart';
import 'package:tictactoe/screens/createRoomScreen.dart';

import 'joinRoomScreen.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main-Menu";
  const MainMenuScreen({super.key});
  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, createRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () => createRoom(context), text: "Create Room"),
          SizedBox(height: 20),
          CustomButton(onTap: () => joinRoom(context), text: "Join Room")
        ],
      ),
    );
  }
}
