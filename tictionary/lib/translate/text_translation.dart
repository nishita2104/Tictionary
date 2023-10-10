import 'package:translator/translator.dart';

class TranslateToEnglish {
  String text;
  TranslateToEnglish(this.text);
  late Future <String> translatedValue = operate(text);
}

Future<String> operate(String text) async {
  GoogleTranslator translator = GoogleTranslator();
  String rtn="";
  await translator.translate(text, from: 'en', to: 'it').then((s) {
    rtn = s.text.toString();
  });
  return rtn;
}
