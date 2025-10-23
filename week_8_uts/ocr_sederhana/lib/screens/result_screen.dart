import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() async {
    flutterTts = FlutterTts();

    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setLanguage("id-ID");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);

    var result = await flutterTts.isLanguageAvailable("id-ID");
    debugPrint("Bahasa Indonesia tersedia: $result");
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  void _speakText() async {
    if (widget.ocrText.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 500));
      await flutterTts.speak(widget.ocrText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        actions: [
          IconButton(
            onPressed: _speakText,
            icon: const Icon(Icons.volume_up),
            tooltip: 'Baca Teks',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            widget.ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                : widget.ocrText.replaceAll('\n', ' '),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
