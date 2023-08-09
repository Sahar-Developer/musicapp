import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
                data[controller.playIndex.value].displayNameWOExt,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  //the cover image of the music...
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: QueryArtworkWidget(
                      id: data[controller.playIndex.value].id,
                      type: ArtworkType.AUDIO,

                      artworkHeight: double.infinity,
                      artworkWidth: double.infinity,
                      //...if the cover image is empty...
                      nullArtworkWidget: const Icon(
                        Icons.music_note,
                        size: 98,
                      ),
                    ),
                  ),
                ),
              ),

              //the bottom section of the player...
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
                  decoration: const BoxDecoration(
                    // color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //artist and music name...
                        Text(
                          data[controller.playIndex.value].displayNameWOExt,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),

                        Text(
                          data[controller.playIndex.value].artist.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),

                        //three icons of like + shuffle + add to playlist
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.shuffle,
                              size: 30,
                              // color: buttonColor,
                            ),
                            IconButton(
                              onPressed: () {
                                // Add or remove the current song from the favorite list
                                var currentSong =
                                    data[controller.playIndex.value];
                                controller.addToFavorite(currentSong);
                              },
                              icon: Obx(() {
                                // Check if the current song is in the favorite list
                                var currentSong =
                                    data[controller.playIndex.value];
                                bool isFavorite =
                                    controller.favorite.contains(currentSong);
                                return isFavorite
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        size: 30,
                                      );
                              }),
                            ),
                            const Icon(
                              Icons.playlist_add,
                              size: 30,
                            ),
                          ],
                        ),

                        Obx(
                          () => Row(
                            children: [
                              //time duration((the left one!!!))...
                              Text(
                                controller.position.value,
                              ),

                              //the slider.....
                              Expanded(
                                  child: Slider(
                                      // thumbColor: bgColor,
                                      // inactiveColor: slideColor,
                                      // activeColor: bgColor,
                                      min: const Duration(seconds: 0)
                                          .inSeconds
                                          .toDouble(),
                                      max: controller.max.value,
                                      value: controller.value.value,
                                      onChanged: (newValue) {
                                        controller.changeDurationToSeconds(
                                            newValue.toInt());
                                        newValue = newValue;
                                      })),

                              //time duration ((the right one!!!))...
                              Text(
                                controller.duration.value,
                              )
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 12,
                        ),

                        //three icons of play / pause / next / previous signs...
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //what should happen if you press the previous button
                            IconButton(
                                onPressed: () {
                                  controller.playSong(
                                      data[controller.playIndex.value - 1].uri,
                                      controller.playIndex.value - 1);
                                },
                                icon: const Icon(
                                  Icons.skip_previous_rounded,
                                  size: 40,
                                )),

                            Obx(
                              () => CircleAvatar(
                                radius: 35,
                                child: Transform.scale(
                                  scale: 2.2,
                                  child: IconButton(
                                      //codes of when play/pause button pressed
                                      onPressed: () {
                                        if (controller.isPlaying.value) {
                                          controller.audioPlayer.play();
                                          controller.isPlaying(false);
                                        } else {
                                          controller.audioPlayer.pause();
                                          controller.isPlaying(true);
                                        }
                                      },
                                      icon: controller.isPlaying.value
                                          ? const Icon(
                                              Icons.play_arrow_rounded,
                                            )
                                          : const Icon(
                                              Icons.pause,
                                            )),
                                ),
                              ),
                            ),

                            IconButton(
                                //what should happen if you press the skip button
                                onPressed: () {
                                  controller.playSong(
                                      data[controller.playIndex.value + 1].uri,
                                      controller.playIndex.value + 1);
                                },
                                icon: const Icon(
                                  Icons.skip_next_rounded,
                                  size: 40,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
