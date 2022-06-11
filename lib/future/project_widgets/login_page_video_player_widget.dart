import 'package:flutter/material.dart';
import 'package:riot_helper/core/widgets/constant_widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import '../../core/widgets/colors/colors.dart';
import '../project_constants/project_enums.dart';

class LoginPageVideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  final String logoPath;
  final Function onTapFunction;
  const LoginPageVideoPlayerWidget(
      {Key? key,
      required this.videoPath,
      required this.logoPath,
      required this.onTapFunction})
      : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<LoginPageVideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? _playVideoWidget()
        : _loadingVideoWidget();
  }

  Stack _playVideoWidget() {
    return Stack(
      children: [
        SizedBox(
          width: 100.w,
          height: 20.h,
          child: ClipRRect(
              borderRadius: ConstantsWidget.borderRadius_16,
              child: VideoPlayer(_controller)),
        ),
        _backgroundOpacity(),
        _openSelectedPageButton(),
        _logoWidget()
      ],
    );
  }

  Positioned _backgroundOpacity() {
    return Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: ConstantsWidget.borderRadius_16,
            color: ProjectColor.colorsBlack.withOpacity(0.4),
          ),
        ),
      );
  }

  Positioned _logoWidget() {
    return Positioned(
      left: 16,
      top: -10,
      child: SizedBox(
        height: 10.h,
        width: 10.h,
        child: Image.asset(widget.logoPath,fit: BoxFit.contain,),
      ),
    );
  }

  Positioned _openSelectedPageButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () async {
          await widget.onTapFunction();
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16), topLeft: Radius.circular(5)),
            color: ProjectColor.riotBackground.withOpacity(0.7),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            color: ProjectColor.riotWhite,
          ),
        ),
      ),
    );
  }

  SizedBox _loadingVideoWidget() {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: const Center(
        child: CircularProgressIndicator(
          color: ProjectColor.riotWhite,
        ),
      ),
    );
  }
}
