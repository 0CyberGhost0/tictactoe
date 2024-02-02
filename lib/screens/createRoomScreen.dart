import 'package:flutter/material.dart';
import 'package:tictactoe/buttons/custom_button.dart';
import 'package:tictactoe/resource/socket_method.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/widgets/customTextField.dart';

import '../widgets/custom_text.dart';

class createRoomScreen extends StatefulWidget {
  static String routeName = "/create-room";
  const createRoomScreen({super.key});

  @override
  State<createRoomScreen> createState() => _createRoomScreenState();
}

class _createRoomScreenState extends State<createRoomScreen> {
  final TextEditingController _nameController = new TextEditingController();
  final SocketMethods _socketMethod = SocketMethods();
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
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
              shadows: [Shadow(blurRadius: 40, color: Colors.blue)],
              text: "Create Room",
              fontSize: 70,
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            CustomTextField(
              controller: _nameController,
              hintText: "Enter Your NickName",
            ),
            SizedBox(
              height: size.height * 0.045,
            ),
            CustomButton(
                onTap: () => _socketMethod.createRoom(_nameController.text),
                text: "Create")
          ],
        ),
      ),
    ));
  }
}
