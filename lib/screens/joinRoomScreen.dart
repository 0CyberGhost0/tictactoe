import 'package:flutter/material.dart';
import 'package:tictactoe/buttons/custom_button.dart';
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _nameController = new TextEditingController();
    final TextEditingController _gameIDController = new TextEditingController();
    void dispose() {
      super.dispose();
      _nameController.dispose();
      _gameIDController.dispose();
    }

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
              CustomText(shadows: [
                BoxShadow(color: Colors.blue, spreadRadius: 2, blurRadius: 40)
              ], text: "Join Room", fontSize: 70),
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
              CustomButton(onTap: () {}, text: "Join"),
            ],
          ),
        ),
      ),
    );
  }
}
