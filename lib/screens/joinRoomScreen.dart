import 'package:flutter/material.dart';
import 'package:tictactoe/buttons/custom_button.dart';
import 'package:tictactoe/resource/socket_method.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/customTextField.dart';
import 'package:tictactoe/widgets/custom_text.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = "/join-room";
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIDController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIDController.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                shadows: [
                  BoxShadow(color: Colors.blue, spreadRadius: 2, blurRadius: 40)
                ],
                text: "Join Room",
                fontSize: 70,
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                  controller: _nameController, hintText: "Enter Your NickName"),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: _gameIDController, hintText: "Enter Game ID"),
              SizedBox(
                height: size.height * 0.045,
              ),
              CustomButton(
                onTap: () => _socketMethods.joinRoom(
                    _nameController.text, _gameIDController.text),
                text: "Join",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
