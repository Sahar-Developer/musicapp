import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controllers/player_controller.dart';
import 'package:musicapp/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class RecentlyPlayedPage extends StatelessWidget {
  // final List<SongModel> recentlyPlayed;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recently Played',
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        // Return the recentlyPlayed list as the future value
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<SongModel> recentlyPlayedSongs = snapshot.data!;
            int itemCount = min(7, recentlyPlayedSongs.length);
            return ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                var song = recentlyPlayedSongs[index];
                return ListTile(
                  // tileColor: buttonColor,
                  title: Text(song.displayNameWOExt),
                  subtitle: Text(song.artist ?? ''), // Handle null artist
                  leading: QueryArtworkWidget(
                    id: song.id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: Icon(
                      Icons.music_note,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Get.to(Player(data: snapshot.data!));
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Recently Played Songs',
              ),
            );
          }
        },
      ),
    );
  }
}
