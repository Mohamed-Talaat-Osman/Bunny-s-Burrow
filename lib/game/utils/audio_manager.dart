import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

// This class is responsible for playing all the sound effects
// and background music in this game.
class AudioManager {
  static final sfx = ValueNotifier(true);
  static final bgm = ValueNotifier(true);

  static Future<void> init() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      '8BitPlatformerLoop.wav',
      'hurt7.wav',
      'jump14.wav',
    ]);
  }

  static void playSfx(String file) {
    if (sfx.value) {
      FlameAudio.play(file);
    }
  }

  static void playBgm(String file) {
    if (bgm.value) {
      FlameAudio.bgm.play(file);
    }
  }

  static void pauseBgm() {
    FlameAudio.bgm.pause();
  }

  static void resumeBgm() {
    if (bgm.value) {
      FlameAudio.bgm.resume();
    }
  }

  static void stopBgm() {
    FlameAudio.bgm.stop();
  }
}
