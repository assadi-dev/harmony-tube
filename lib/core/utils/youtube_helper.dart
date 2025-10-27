
import 'package:harmony_tube/core/utils/files_system.dart';

String? extractYoutubeIdFromUrl(String url) {
  RegExp regExp = RegExp(
      r'(?:youtube(?:-nocookie)?\.com/(?:.*[?&]v=|(?:embed|v|shorts|live)/)|youtu\.be/)([a-zA-Z0-9_-]{11})'  );
  Match? match = regExp.firstMatch(url);
  return match?.group(1);
}


String? safeExtractYoutubeId(String value){
  if(isHttpUrl(value)){
    return extractYoutubeIdFromUrl(value);
  }
  return value;

}

