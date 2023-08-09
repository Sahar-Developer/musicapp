// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();

  var playIndex = 0.obs;
  var isPlaying = false.obs;

  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  final favorite = <SongModel>[].obs;
  final recentlyPlayed = <SongModel>[].obs;
  final int maxRecentlyPlayedSongs = 10;

  void addToFavorite(SongModel song) {
    if (!favorite.contains(song)) {
      favorite.add(song);
      print('${song.displayNameWOExt} added to favorites.');
    } else {
      favorite.remove(song);
      print('${song.displayNameWOExt} removed from favorites.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkPermission();
    // loadSongs();
  }

  void setCurrentSong(SongModel song, String? uri, int index) {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
      isPlaying(true);
      updatePosition();

      // Add the played song to the recently played list
      addToRecentlyPlayed(song);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void addToRecentlyPlayed(SongModel song) {
    // Check if the song is already in the list
    if (!recentlyPlayed.contains(song)) {
      // If the list size exceeds the maximum, remove the last song
      if (recentlyPlayed.length >= maxRecentlyPlayedSongs) {
        recentlyPlayed.removeLast();
      }
      // Add the song to the beginning of the list
      recentlyPlayed.insert(0, song);
    }
  }

  updatePosition() {
    audioPlayer.durationStream.listen((d) {
      if (d != null) {
        duration.value = d.toString().split(".")[0];
        max.value = d.inSeconds.toDouble();
      }
    });
    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  changeDurationToSeconds(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  playSong(String? uri, index) {
    playIndex.value = index;
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
      isPlaying(true);

      updatePosition();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  checkPermission() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
    } else {
      checkPermission();
    }
  }

  // Method to change the current song index
  void changeSongIndex(int newIndex) {
    if (favorite.isNotEmpty) {
      // Use Future.delayed to schedule the state change outside the build phase
      Future.delayed(Duration.zero, () {
        playIndex.value = newIndex.clamp(0, favorite.length - 1);
      });
    } else {
      // Handle the case where the favorite list is empty, for example, you can do nothing or show a message.
      print("Favorite list is empty.");
    }
  }
}
