import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../views/playerScreen.dart';

class MusicList extends SearchDelegate<SongModel> {
  final OnAudioQuery audioQuery;
  final AudioPlayer audioPlayer = AudioPlayer();
  final controller = Get.put(PlayerController());

  MusicList({required this.audioQuery});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // close(
        //   context,
        // ); // Return null when pressing the back button
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Obx(() => FutureBuilder<List<SongModel>>(
          future: searchSongs(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //  else if (snapshot.hasData) {
            //   return ListView.builder(
            //     itemCount: snapshot.data!.length,
            //     itemBuilder: (context, index) {
            //       final song = snapshot.data![index];
            //       return ListTile(
            //         title: Text(song.title),
            //         subtitle: Text(song.artist ?? 'Unknown Artist'),
            //         onTap: () {
            //           close(context, song);
            //         },
            //       );
            //     },
            //   );
            // }
            else {
              return Center(
                child: Text(
                  'No Results Found',
                  // style: ourStyle(family: bold, size: 28, color: slideColor),
                ),
              );
            }
          },
        ));
  }

  void openPlayer(SongModel song) {
    int index = controller.playIndex.value;
    controller.setCurrentSong(song, song.uri, index);
    Get.to(PlayerScreen(
      data: [song],
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: searchSongs(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final List<SongModel> songs = snapshot.data!;
          return ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                title: Text(song.title),
                subtitle: Text(song.artist ?? 'Unknown Artist'),
                onTap: () => openPlayer(song),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'No Results Found',
              // style: ourStyle(family: bold, size: 28, color: slideColor),
            ),
          );
        }
      },
    );
  }

  Future<List<SongModel>> searchSongs(String query) async {
    List<SongModel> songs = [];
    List<SongModel> songInfoList = await audioQuery.querySongs(
      ignoreCase: true,
      uriType: UriType.EXTERNAL,
    );

    // Filter the songs based on the search query
    for (var songInfo in songInfoList) {
      String artist = songInfo.artist ?? ''; // Handle nullable value
      if (songInfo.title.toLowerCase().contains(query.toLowerCase()) ||
          artist.toLowerCase().contains(query.toLowerCase())) {
        songs.add(songInfo);
      }
    }

    return songs;
  }
}
