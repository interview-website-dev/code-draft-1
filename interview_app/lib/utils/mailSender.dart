import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

passwordChangeNotifier() async {
  String username = 'info@corpvela.com';
  String password = 'Reset@098123';
  String host = 'smtppro.zoho.in';
  int port = 465;
  bool ssl = true;

  final smtpServer = SmtpServer(host,
    ssl: ssl, port: port, username: username, password: password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.  
  
  // Create our message.
  final message = Message()
    ..from = Address(username, 'Your name')
    ..recipients.add('swetha05thiruvengadam@gmail.com')
    ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }}