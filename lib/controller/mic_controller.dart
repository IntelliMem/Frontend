
import 'package:speech_to_text/speech_to_text.dart';

class MicController {
  static final MicController _instance = MicController._privateConstructor();
  final SpeechToText _speechToText = SpeechToText();
  bool _isInitialized = false;
  bool _isListening = false;
  String _recognizedText = "";

  factory MicController() {
    return _instance;
  }

  MicController._privateConstructor();

  Future<void> initializeTts() async {
    if (!_isInitialized) {
      _isInitialized = await _speechToText.initialize();
    }
  }

  void startListening() {
    if (_isInitialized && !_isListening){
      _isListening=true;
      _recognizedText="";
      _speechToText.listen(
        onResult: (result) {
          _recognizedText+=result.recognizedWords;
        },
      );
    }
  }

  String stopListening() {
    if (_isInitialized && _isListening) {
      _isListening = false;
      _speechToText.stop();
      print("final: "+_recognizedText);
      return _recognizedText;
    }
    return "";
  }

  bool get isListening => _isListening;

}

