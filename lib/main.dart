import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/screens/createRoomScreen.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/joinRoomScreen.dart';
import 'package:tictactoe/screens/main_menu_screen.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        home: MainMenuScreen(),
        routes: {
          MainMenuScreen.routeName: (context) => MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => JoinRoomScreen(),
          createRoomScreen.routeName: (context) => createRoomScreen(),
          GameScreen.routeName: (context) => GameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
