import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waveform_flutter/waveform_flutter.dart';
import 'mic_widget.dart';

class ListeningVisualizerWidget extends StatefulWidget {
  final VoidCallback onStop;
  const ListeningVisualizerWidget({super.key, required this.onStop});

  @override
  _ListeningVisualizerWidgetState createState() => _ListeningVisualizerWidgetState();
}

class _ListeningVisualizerWidgetState extends State<ListeningVisualizerWidget> {
  late final Stream<Amplitude> _amplitudeStream;

  @override
  void initState() {
    super.initState();
    _amplitudeStream = createRandomAmplitudeStream().asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom:10.h, right: 5.w),
          height: 50.h,
          width: 50.w,
          child: ClipRect(
            child: AnimatedWaveList(
              stream: _amplitudeStream,
              barBuilder: (animation, amplitude) => WaveFormBar(
                animation: animation,
                amplitude: amplitude,
                color: Colors.white,
              ),
            ),
          ),
        ),
        MicWidget(
          onMicTap: widget.onStop,
          isListening: false,
        ),
        Container(
          padding: EdgeInsets.only(bottom:10.h,left: 5.w),
          height: 50.h,
          width: 50.w,
          child: ClipRect(
            child: AnimatedWaveList(
              stream: _amplitudeStream,
              barBuilder: (animation, amplitude) => WaveFormBar(
                animation: animation,
                amplitude: amplitude,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
