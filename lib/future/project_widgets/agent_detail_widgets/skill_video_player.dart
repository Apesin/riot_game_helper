import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import '../../../core/widgets/colors/colors.dart';

class SkillVideoPlayer extends StatefulWidget {
  final String videoPath;
  const SkillVideoPlayer({Key? key, required this.videoPath}) : super(key: key);

  @override
  _SkillVideoPlayerState createState() => _SkillVideoPlayerState();
}

class _SkillVideoPlayerState extends State<SkillVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: 25.h,
      child: _controller.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: ProjectColor.riotWhite,
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
