import 'package:chatter/screens/home.dart';
import 'package:chatter/screens/select_user_screen.dart';
import 'package:chatter/temas.dart';
import 'package:chatter/app.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client=StreamChatClient(StreamKey);
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,
  required this.client,
  }):super(key: key) ;

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
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

//video 2: min 1.6.45 