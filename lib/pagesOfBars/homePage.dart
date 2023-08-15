// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controllers/player_controller.dart';
import 'package:musicapp/views/player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatelessWidget {
  final List<SongModel> data;
  HomePage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(

        //main codes for playing music is here
        body: FutureBuilder<List<SongModel>>(
      future: controller.audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      ),

      //checking if the storage has any music or not
      builder: (BuildContext context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data!.isEmpty) {
          return Center(
              child: Text(
            "No Song Found!",
          ));
        } else {
          print(snapshot.data);
          //listview of the main page of all music
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              //the settings for each item in the listview
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 1),
                  child: Obx(() => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Text(
                          snapshot.data![index].displayNameWOExt,
                        ),
                        subtitle: Text(
                          "${snapshot.data![index].artist}",
                        ),
                        //the icon and cover of music
                        leading: QueryArtworkWidget(
                          id: snapshot.data![index].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            size: 35,
                          ),
                        ),
                        //when you play a music and want to show which of the list is playing
                        trailing: controller.playIndex.value == index &&
                                controller.isPlaying.value
                            ? const Icon(
                                Icons.play_arrow,
                                size: 25,
                              )
                            : null,
                        // a music clicked...
                        onTap: () {
                          // Pass the selected index to the Player widget
                          Get.to(
                            () => Player(
                              data: snapshot.data!,
                            ),
                            transition: Transition.downToUp,
                          );
                        },
                      )),
                );
              },
            ),
          );
        }
      },
    ));
  }
}
