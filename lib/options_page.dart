import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';
import 'package:math_quiz_game/configs/globals.dart';

class OptionsPage extends StatefulWidget {
  final AssetsAudioPlayer advancePlayer;
  const OptionsPage({Key? key, required this.advancePlayer}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  // playAndPauseMusic() {
  //   try {
  //     assetsAudioPlayer.playOrPause();
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background3.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            height: h * 0.3,
            width: w * 0.8,
            //padding: EdgeInsets.all(15.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Turn On/Off Music: ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    InkWell(
                      onTap: () {
                        // playAndPauseMusic();
                        setState(() {
                          isMusicOn = !isMusicOn;
                        });
                        isMusicOn
                            ? widget.advancePlayer.play()
                            : widget.advancePlayer.pause();
                      },
                      child: Container(
                        child: isMusicOn
                            ? Icon(
                                Icons.volume_up,
                                size: 100,
                                color: Colors.pink,
                              )
                            : Icon(
                                Icons.volume_off,
                                size: 100,
                                color: Colors.black54,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
