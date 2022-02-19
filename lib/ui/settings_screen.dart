
import 'package:flutter/material.dart';
import 'package:werewulfs/ui/singleton.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);


  static Route route() {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return SettingsScreen();
      },
    );
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Postavka'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text('Kolko traje noć sekundi:'),
          TextField(controller: _controller),
          ElevatedButton(onPressed: () {
            Singleton.instance.time = int.tryParse(_controller.text) ?? 1;
          }, child: Text('Spremi'))
        ],),
      ),
    );
  }
}
