import 'package:chatter/screens/select_user_screen.dart';
import 'package:chatter/temas.dart';
import 'package:chatter/app.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client=StreamChatClient(StreamKey);
  runApp(MyApp(
    client: client,
    appTheme: AppTheme(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
    required this.appTheme,
  }) : super(key: key);

  final StreamChatClient client;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.dark,
      title: "Messenger",
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(
            child: UsersBloc(child: child!,)
            )
          );
      },
      home: const SelectUserScreen(),
    );
  }
}

//video 3: min 14.00 
//video 3: min 22.51