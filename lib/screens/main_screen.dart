import 'package:flutter/material.dart';
import '../myContainerClass/medetationList.dart';
import 'package:just_audio/just_audio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? _playingIndex;

  final AudioPlayer audioPlayer = AudioPlayer();

  List<Item> Items = [
    Item(
      name: 'Loaded - Asake',
      imagePath: 'meditation_images/asake_loaded.jpeg',
      audioPath: 'meditation_audios/asake-loaded.mp3',
    ),
    Item(
      name: 'Palazzo - Asake',
      imagePath: 'meditation_images/asake_palazzo.jpeg',
      audioPath: 'meditation_audios/asake-palazzo.mp3',
    ),
    Item(
      name: 'Bandana - FireBoy',
      imagePath: 'meditation_images/asake_bandana.jpeg',
      audioPath: 'meditation_audios/asake-bandana.mp3',
    ),
    Item(
      name: 'Infinity - Olamide',
      imagePath: 'meditation_images/olamide_infinity.jpeg',
      audioPath: 'meditation_audios/Olamide-Infinity.mp3',
    ),
    Item(
      name: 'Rock - Olamide',
      imagePath: 'meditation_images/olamide_rock.jpeg',
      audioPath: 'meditation_audios/olamide-rock.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(221, 19, 6, 163),
          title: Text(
            "Music Player",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: Items.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Items[index].imagePath),
                    ),
                  ),
                  child: Center(
                      // padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                    leading: Text(
                      Items[index].name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (_playingIndex == index) {
                          setState(() {
                            _playingIndex = null;
                          });

                          audioPlayer.stop();
                        } else {
                          audioPlayer.setAsset(Items[index].audioPath);

                          audioPlayer.play();

                          setState(() {
                            _playingIndex = index;
                          });
                        }
                      },
                      icon: _playingIndex == index
                          ? Icon(
                              Icons.stop_circle_outlined,
                              size: 45,
                            )
                          : Icon(
                              Icons.play_arrow_outlined,
                              size: 45,
                            ),
                    ),
                  )),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          color: Color.fromARGB(221, 19, 6, 163),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                size: 35,
              ),
              Icon(
                Icons.library_books,
                size: 35,
              ),
              Icon(
                Icons.home,
                size: 35,
              ),
            ],
          ),
        ));
  }
}
