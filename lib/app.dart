import 'package:flutter/material.dart';
import 'package:logger/logger.dart'as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const StreamKey= 't78rkga93xpv';

var logger=log.Logger();

/// Las exteniones se pueden usar para agregar funcionalidades SNK
extension StreamChatContext on BuildContext {
  /// Fetches the current user image.
  String? get currentUserImage => currentUser!.image;

  /// Obtiene el usuario actual
  User? get currentUser => StreamChatCore.of(this).currentUser;
}
