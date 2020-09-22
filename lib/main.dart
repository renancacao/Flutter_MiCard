import 'package:flutter/material.dart';
import 'package:mi_card/my_icons_icons.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double horizontalButtonMargin = 20.0;
    final double verticalButtonMargin = 5.0;
    final double dividerIndent = 120;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent[200],
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage("images/perfil.jpg"),
            ),
            Text(
              "Renan Souza",
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Mobile Developer",
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontFamily: 'OpenSansCondensed',
                letterSpacing: 5,
              ),
            ),
            Divider(
              height: 30,
              color: Colors.white,
              indent: dividerIndent,
              endIndent: dividerIndent,
            ),
            Card(
              margin: EdgeInsets.fromLTRB(horizontalButtonMargin, 15,
                  horizontalButtonMargin, verticalButtonMargin),
              child: ListTile(
                  onTap: _launchEmail,
                  leading: Icon(
                    Icons.email,
                    color: Colors.blueAccent[200],
                  ),
                  title: Text(
                    "rcacao10@gmail.com",
                    style: TextStyle(
                        color: Colors.blueAccent[200],
                        fontSize: 16,
                        fontFamily: 'OpenSansCondensed',
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(
                  horizontalButtonMargin,
                  verticalButtonMargin,
                  horizontalButtonMargin,
                  verticalButtonMargin),
              child: ListTile(
                onTap: () => _launchGithub(),
                leading: Icon(
                  MyIcons.github_circled,
                  color: Colors.blueAccent[200],
                ),
                title: Text(
                  "github.com/renancacao",
                  style: TextStyle(
                      color: Colors.blueAccent[200],
                      fontSize: 16,
                      fontFamily: 'OpenSansCondensed',
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(
                  horizontalButtonMargin,
                  verticalButtonMargin,
                  horizontalButtonMargin,
                  verticalButtonMargin),
              child: ListTile(
                onTap: () => _launchLinkedIn(),
                leading: Icon(
                  MyIcons.linkedin_squared,
                  color: Colors.blueAccent[200],
                ),
                title: Text(
                  "linkedin.com/in/renancacao",
                  style: TextStyle(
                      color: Colors.blueAccent[200],
                      fontSize: 16,
                      fontFamily: 'OpenSansCondensed',
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _launchEmail() {
    launchUrl('mailto:rcacao10@gmail.com');
  }

  _launchGithub() {
    launchUrl('https://github.com/renancacao/');
  }

  _launchLinkedIn() {
    launchUrl('https://www.linkedin.com/in/renancacao/');
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      SnackBar(
        content: Text('Could not launch $url'),
      );
    }
  }
}
