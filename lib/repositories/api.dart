import 'dart:io';

class API {
  API();

  static final String host = Platform.isAndroid ? '10.0.2.2:1711' : '127.0.0.1:1711';


  Uri trainingsUri() => Uri.http(host, "/trainings");

  Uri trainingHighlightUri() => Uri.http(host, "/highlights");

}
