

import 'package:flutter/material.dart';
import 'package:music_practice/Screens/MusicPlay.dart';
import 'package:music_practice/helper/helpers.dart';
import 'package:music_practice/models/models.dart';
import 'package:music_practice/Widgets/widgets.dart';
import '../Data/data.dart';


class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  _buildPlaylist() {
    List<Widget> playlistList = [];
    playlists.forEach((Playlist playlist) {
      playlistList.add(Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.asset(
                playlist.image,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            Text(
              playlist.playlistType,
              style: AppStyle.playlisttype,
            ),
            Text(
              playlist.songNumber.toString() + ' ' + 'songs',
              style: AppStyle.playlistnum,
            )
          ],
        ),
      ));
    });
    return ListView(scrollDirection: Axis.horizontal, children: playlistList);
  }

  buildPopular() {
    List<Widget> popularList = [];
    populars.forEach((Popular popular) {
      popularList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MusicPlay(popular: popular),
            ),
          ),
          child: ListTile(
            leading: Hero(
              tag: popular.imageUrl,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    popular.imageUrl,
                    fit: BoxFit.cover,
                    height: 80,
                    width: 60,
                  )),
            ),
            title: Text(
              popular.songTitle,
              style: AppStyle.song,
            ),
            subtitle: Text(
              popular.singer,
              style: AppStyle.singer,
            ),
            trailing: Icon(
              Icons.play_arrow_sharp,
              size: 30.0,
              color: AppStyle.getStartedButtonColor,
            ),
          ),
        ),

      );
    });
    return Column(children: popularList);
  }



  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    orientation == Orientation.portrait
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Library',
                              style: AppStyle.library,
                            ),
                          )
                        : landscapeSearch(),
                    orientation == Orientation.portrait
                        ? potraitSearch()
                        : SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Playlists',
                        style: AppStyle.playlist,
                      ),
                    ),
                    Container(
                        height: 210,
                        width: double.infinity,
                        child: _buildPlaylist()),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Popular',
                        style: AppStyle.popular,
                      ),
                    ),
                    // songCard(),
                    // songCard(),
                    // songCard(),
                    // songCard(),
                    // songCard(),
                    Container(
                      width: double.infinity,
                      child:buildPopular()
                    )

                  ],
                );
              }),
        ),
      );
    });
  }
}

class songCard extends StatelessWidget {
  const songCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            Images.wet,
            fit: BoxFit.cover,
            height: 80,
            width: 60,
          )),
      title: Text(
        Strings.song1,
        style: AppStyle.song,
      ),
      subtitle: Text(
        Strings.singer1,
        style: AppStyle.singer,
      ),
      trailing: Icon(
        Icons.play_arrow_sharp,
        size: 30.0,
        color: AppStyle.getStartedButtonColor,
      ),
    );
  }
}
