import 'package:flutter/material.dart';
import 'package:musicapp/controllers/musicListForSearchPage.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Search',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'eg: Man koja Baran Koja',
                  prefixIcon: Icon(Icons.search),
                ),
                onTap: () => showSearch(
                  context: context,
                  delegate: MusicList(audioQuery: OnAudioQuery()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
