import 'package:insta_app/app/helps/network.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Socket {
  static IO.Socket _instance;
  static String user;

  static IO.Socket getInstace() {
    if (_instance == null) {
      _instance = IO.io(
        Network.socket,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .setQuery({'user': user}) // optional
            .build(),
      );
    }
    return _instance;
  }
}
