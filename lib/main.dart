
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(ChatWithMeApp());
}

class ChatWithMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatWithMe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController telegramController = TextEditingController();

  List<Map<String, String>> nearbyUsers = [
    {
      'nickname': 'Viaggiatore42',
      'message': 'Amo viaggiare in treno e leggere',
      'whatsapp': '391234567890',
      'telegram': 'viaggiatore42'
    },
    {
      'nickname': 'Lettore83',
      'message': 'Leggo Calvino e bevo caffè',
      'whatsapp': '',
      'telegram': 'lettore83'
    },
  ];

  void openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChatWithMe')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nicknameController,
              decoration: InputDecoration(labelText: 'Nickname'),
            ),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: 'Messaggio di presentazione'),
            ),
            TextField(
              controller: whatsappController,
              decoration: InputDecoration(labelText: 'Numero WhatsApp (solo numeri)'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: telegramController,
              decoration: InputDecoration(labelText: 'Username Telegram'),
            ),
            SizedBox(height: 20),
            Divider(),
            Text('Persone vicine a te', style: TextStyle(fontWeight: FontWeight.bold)),
            ...nearbyUsers.map((user) {
              return Card(
                child: ListTile(
                  title: Text(user['nickname'] ?? ''),
                  subtitle: Text(user['message'] ?? ''),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      if (user['whatsapp']!.isNotEmpty)
                        IconButton(
                          icon: Icon(Icons.chat),
                          onPressed: () =>
                              openLink('https://wa.me/${user['whatsapp']}'),
                        ),
                      if (user['telegram']!.isNotEmpty)
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () =>
                              openLink('https://t.me/${user['telegram']}'),
                        ),
                    ],
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
