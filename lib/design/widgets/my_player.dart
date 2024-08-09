import 'package:flutter/material.dart';
import 'package:pilem/design/my_ds/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyPlayer extends StatefulWidget {
  const MyPlayer({
    super.key,
    required this.videoKey,
  });

  final String videoKey;

  @override
  State<MyPlayer> createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  late YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: widget.videoKey,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      ),
      showVideoProgressIndicator: true,
      progressIndicatorColor: MyDsColors.primaryBase,
      progressColors: const ProgressBarColors(
        playedColor: MyDsColors.primaryBase,
        handleColor: MyDsColors.primaryLight,
      ),
      // onReady: () => _youtubePlayerController.addListener(() {}),
    );
  }
}
