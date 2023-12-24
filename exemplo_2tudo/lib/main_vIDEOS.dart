import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  runApp(YoutubePlayerDemoApp());
}

class YoutubePlayerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<YoutubePlayerController> _controllers;
  late List<String> _videoIds;

  @override
  void initState() {
    super.initState();
    _videoIds = ['hEVQch72TBo', 'N0lUBVYl1hI']; // IDs dos vídeos

    _controllers = _videoIds.map((videoId) {
      return YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Vídeos'),
      ),
      body: ListView.builder(
        itemCount: _videoIds.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controllers[index],
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  onReady: () {},
                  onEnded: (data) {
                    // Carrega o próximo vídeo quando termina
                    _controllers[index].load(_videoIds[(index + 1) % _videoIds.length]);
                  },
                ),
                builder: (context, player) {
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: player,
                  );
                },
              ),
              const SizedBox(height: 20), // Espaço entre os vídeos
            ],
          );
        },
      ),
    );
  }
}
