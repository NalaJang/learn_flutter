import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  static Soundpool pool =
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  int selectedImageIndex = -1;
  bool _isLoading = true;
  List<int> _soundIds = [];
  List<double> heightPaddings = [10, 20, 32, 40, 46, 54, 60, 69];
  List<String> soundFileNames = [
    'do1',
    're',
    'mi',
    'fa',
    'sol',
    'la',
    'si',
    'do2'
  ];
  List<String> syllableNames = ['도', '레', '미', '파', '솔', '라', '시', '도'];
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.amberAccent,
    Colors.blue,
    Colors.deepOrange,
  ];

  Future<void> initSoundPool() async {
    int soundId;
    for (String fileName in soundFileNames) {
      soundId = await rootBundle
          .load('assets/xylophone_sounds/$fileName.wav')
          .then((soundData) => pool.load(soundData));
      _soundIds.add(soundId);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initSoundPool();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initSoundPool();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < syllableNames.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: heightPaddings[i]),
                    child: gunban(syllableNames[i], colors[i], _soundIds[i]),
                  ),
              ],
            ),
    );
  }

  Widget gunban(String text, Color color, int soundId) {

    return GestureDetector(
      onTap: () {
        print(soundId);
        pool.play(soundId);
        setState(() {
          selectedImageIndex = soundId;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: selectedImageIndex == soundId
            ? Image.asset(
                'assets/xylophone_images/${soundFileNames[soundId - 1]}.png',
                width: 100,
              )
            : Image.asset(
                'assets/xylophone_images/${soundFileNames[0]}.png',
                width: 100,
              ),
      ),
    );
  }
}
