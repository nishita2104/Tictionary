import 'dart:collection';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator/translator.dart';

class TranslateToEnglish {
  String text;
  TranslateToEnglish(this.text);
  late Future <String> translatedValue = operate(text);
}

Future<String> operate(String text) async {
  GoogleTranslator translator = GoogleTranslator();
  String rtn="";
  await translator.translate(text, from: 'fr', to: 'en').then((s) {
    rtn = s.text.toString();
  });
  return rtn;
}
