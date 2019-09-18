import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  final colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green,
    Colors.teal, Colors.blue];

  void playSound(int noteNumber){
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  List<Widget> createExpandedFlatButtons(){
    List<Widget> listOfWidgets = new List<Widget>();
    for(var i = 0; i < colors.length; i++){
      listOfWidgets.add(
          Expanded(
            child: FlatButton(
                onPressed: (){
                playSound(i+1);
              },
            color: colors[i],
          ),
        )
      );
    }
    return listOfWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createExpandedFlatButtons(),
            )
          ),
        ),
      ),
    );
  }
}
