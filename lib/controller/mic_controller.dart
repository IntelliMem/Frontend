
import 'package:speech_to_text/speech_to_text.dart';

class MicController {
  SpeechToText _speechToText = SpeechToText();

  MicController() {
    initializeTts();
  }

 void initializeTts() async {
    await _speechToText.initialize();
  }

  void startListening() {
    _speechToText.listen(
      onResult: (result) {
        print(result.recognizedWords);
      },
    );
  }
}

