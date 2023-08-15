import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/views/playerFavorite.dart';
import 'package:musicapp/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FavoritePage extends StatelessWidget {
  late final favorite = <SongModel>[].obs;
  final controller = Get.put(PlayerController());
  FavoritePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          final favoriteList = controller.favorite.toList();
          if (favoriteList.isEmpty) {
            return Center(
              child: Text("No Song Found!"),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: favoriteList.length,
              //the settings for each item in the listview
              itemBuilder: (BuildContext context, int index) {
                final song = favoriteList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 0.5),
                  child: Obx(() => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),

                        //the settings and styles of the artist an songs
                        title: Text(song.displayNameWOExt),
                        subtitle: Text("${song.artist}"),
                        //the icon and cover of music
                        leading: QueryArtworkWidget(
                          id: song.id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            size: 35,
                          ),
                        ),
                        //when you play a music and want to show which of the list is playing
                        trailing: controller.isPlaying.value &&
                                controller.playIndex.value == index
                            ? const Icon(
                                Icons.play_arrow,
                                size: 25,
                              )
                            : null,
                        // a music clicked...
                        onTap: () {
                          Get.to(
                              () => PlayerFavorite(
                                    data: favoriteList,
                                    selectedIndex: index,
                                  ),
                              transition: Transition.downToUp);
                        },
                      )),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
