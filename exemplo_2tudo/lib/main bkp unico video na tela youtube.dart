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
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'hEVQch72TBo',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false, // Definido para false para não reproduzir automaticamente
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playVideo() {
    _controller.play(); // Inicia o vídeo ao ser chamado
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {},
        onEnded: (data) {
          _controller.load('hEVQch72TBo'); // Carrega o mesmo vídeo quando termina
        },
      ),
      builder: (context, player) {
        return Scaffold(
          body: GestureDetector(
            onTap: _playVideo, // Inicia o vídeo ao tocar na tela
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: player,
              ),
            ),
          ),
        );
      },
    );
  }
}
