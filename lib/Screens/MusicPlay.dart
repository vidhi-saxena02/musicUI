import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_practice/helper/helpers.dart';
import 'package:music_practice/models/models.dart';
import 'package:flutter/cupertino.dart';

class MusicPlay extends StatefulWidget {
  final Popular popular;
  const MusicPlay({required this.popular});

  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    final player = AudioCache(prefix: 'assets/');

    final url = await player.load(widget.popular.song);

    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [widget.popular.color1, widget.popular.color2],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: widget.popular.imageUrl,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 3),borderRadius: BorderRadius.circular(12.0),),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        widget.popular.imageUrl,
                        fit: BoxFit.cover,
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.popular.songTitle,
                style: AppStyle.songbig,
              ),
              Text(
                widget.popular.singer,
                style: AppStyle.singerbig,
              ),
              Slider(
                activeColor: AppStyle.sliderActiveColor,
                inactiveColor: Colors.grey,
                thumbColor: AppStyle.sliderThumbColor,
                value: position.inSeconds.toDouble(),
                min: 0,
                max: duration.inSeconds.toDouble() + 1.0,
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 35,
                child: InkWell(
                  onTap: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.resume();
                    }
                  },
                  child: Icon(
                    isPlaying ? CupertinoIcons.pause_solid : CupertinoIcons.play_arrow_solid,
                    size: 60,
                    color: AppStyle.sliderThumbColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
