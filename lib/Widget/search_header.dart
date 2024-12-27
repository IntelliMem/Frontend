import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Widget/search_bar_with_voice_widget.dart';
import '../controller/mic_controller.dart';
import 'listening_visualizer_widget.dart';

class SearchHeadWidget extends StatefulWidget {
  const SearchHeadWidget({super.key});

  @override
  State<SearchHeadWidget> createState() => _SearchHeadWidgetState();
}

class _SearchHeadWidgetState extends State<SearchHeadWidget> {
  bool _isMicActive = false;
  String _text = "";

  @override
  void initState() {
    super.initState();
    _initializeMicController();
  }
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initializeMicController() async {
    await MicController().initializeTts();
  }

  void _toggleMic() {
    setState(() {
      _isMicActive = !_isMicActive;
    });

    if (_isMicActive) {
      _startListening();
    } else {
      _stopListening();
    }
  }

  void _startListening() {
    MicController().startListening();
  }

  void _stopListening() {
    _text = MicController().stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      margin: EdgeInsets.only(bottom: 20.h),
      color: const Color(0xff469D7B),
      child: Column(
        mainAxisSize: MainAxisSize.min, //overflow 방지
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.h, left: 20.w, bottom: 20.h),
                child: Text('Search',
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              )
            ],
          ),
          _isMicActive ?  ListeningVisualizerWidget(onStop: _toggleMic) : SearchBarWithVoiceWidget(onPressed: _toggleMic),
        ],
      ),
    );
  }
}
