import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/controllers/player_controller.dart';
import 'package:musicapp/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
      onPressed: () {},
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
            } else {
              return Center(
                child: Text('No Results Found'),
              );
            }
          },
        ));
  }

  void openPlayer(SongModel song) {
    int index = controller.playIndex.value;
    controller.setCurrentSong(song, song.uri, index);
    Get.to(Player(
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
            child: Text('No Results Found'),
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
      String artist = songInfo.artist ?? '';
      if (songInfo.title.toLowerCase().contains(query.toLowerCase()) ||
          artist.toLowerCase().contains(query.toLowerCase())) {
        songs.add(songInfo);
      }
    }
    return songs;
  }
}
