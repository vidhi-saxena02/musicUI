import 'package:flutter/cupertino.dart';
import 'package:music_practice/models/models.dart';

import 'dart:math';

import '../helper/images.dart';

final rand = Random();

final _playlist1 = Playlist(image: Images.guitar, playlistType: 'Best Rock Music ', songNumber: rand.nextInt(50));
final _playlist2 = Playlist(image: Images.radio, playlistType: 'Party Music ', songNumber: rand.nextInt(50));
final _playlist3 = Playlist(image: Images.guitar, playlistType: 'Romantic Music ', songNumber: rand.nextInt(50));
final _playlist4 = Playlist(image: Images.radio, playlistType: 'Sad Lofi Music ', songNumber: rand.nextInt(50));
final _playlist5 = Playlist(image: Images.guitar, playlistType: 'Pop Music ', songNumber: rand.nextInt(50));

final List<Playlist> playlists=[
  _playlist1,
  _playlist2,
  _playlist3,
  _playlist4,
  _playlist5,
];


final _popular1 =  Popular(imageUrl: Images.wet, singer: 'Wet Wet Wet', songTitle: 'Love is all around',song: 'toxic.mp3',color1:Color(0xFFFFFFFF),color2: Color(0xFF5D6B90));
final _popular2 =  Popular(imageUrl: Images.elton, singer: 'Elton John', songTitle: 'Believe',song: 'toxic.mp3',color1: Color(0xFFFFFFFF),color2: Color(0xFF4F4B4F));
final _popular3 =  Popular(imageUrl: Images.mercury, singer: 'Freddie Mercury', songTitle: 'Living on my own',song: 'mj.mp3',color1:Color(0xFFFFFFFF),color2: Color(0xFFDEEA31));
final _popular4 =  Popular(imageUrl: Images.mj, singer: 'Micheal Jackson', songTitle: 'Smooth Criminal',song: 'mj.mp3',color1:Color(0xFF241148),color2: Color(0xFFCBAFA6));
final _popular5 =  Popular(imageUrl: Images.toxic, singer: 'Britteny Spears', songTitle: 'Toxic',song: 'toxic.mp3',color1:Color(0xFFFFFFFF),color2: Color(0xFFB62957));

final List<Popular> populars = [
  _popular1,
  _popular2,
  _popular3,
  _popular4,
  _popular5,
];