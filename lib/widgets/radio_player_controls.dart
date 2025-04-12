import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../model/radios_response.dart';

class RadioPlayerControls extends StatefulWidget {
  final List<RadioStation> radios;

  const RadioPlayerControls({super.key, required this.radios});

  @override
  State<RadioPlayerControls> createState() => _RadioPlayerControlsState();
}

class _RadioPlayerControlsState extends State<RadioPlayerControls> {
  final AudioPlayer player = AudioPlayer();
  String currentState = 'pause';
  int currentIndex = 0;

  void playRadio(int index) async {
    await player.stop();
    setState(() {
      currentIndex = index;
      currentState = 'play';
    });
    await player.play(UrlSource(widget.radios[currentIndex].url!));
  }

  void togglePlayPause() async {
    if (currentState == 'pause') {
      await player.play(UrlSource(widget.radios[currentIndex].url!));
      setState(() {
        currentState = 'play';
      });
    } else {
      await player.stop();
      setState(() {
        currentState = 'pause';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/quran_icon.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade200,
                      blurRadius: 8,
                    )
                  ],
                ),
              ),
              Text(
                widget.radios[currentIndex].name ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: 'Amiri',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      int newIndex = (currentIndex == 0)
                          ? widget.radios.length - 1
                          : currentIndex - 1;
                      playRadio(newIndex);
                    },
                    icon: const Icon(Icons.skip_previous_rounded, size: 36),
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: togglePlayPause,
                    icon: Icon(
                      currentState == 'pause'
                          ? Icons.play_arrow_rounded
                          : Icons.pause_rounded,
                      size: 40,
                    ),
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      int newIndex = (currentIndex == widget.radios.length - 1)
                          ? 0
                          : currentIndex + 1;
                      playRadio(newIndex);
                    },
                    icon: const Icon(Icons.skip_next_rounded, size: 36),
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
