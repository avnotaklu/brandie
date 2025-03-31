import 'package:flutter/material.dart';

Color greenAccent = Color(0xffc72bf98);
// Color greenAccent = Colors.red;
Color grey = Color(0xff595959);
Color black = Color(0xff313131);

final List<String> contentImages = [
  'assets/images/content/1.png',
  'assets/images/content/2.png',
  'assets/images/content/3.png',
];

final List<String> contentBody = [
  '''💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy lipstick doesn't just promise rich pigments but brings you the benefits of hyaluronic acid and collagen-boosting peptides too. Pamper your lips with care while enjoying a long-lasting, luminous matte colour. 💋 ✨ #Oriflame #GiordaniGold #LipCareGoals 
Use my referral code: UK-AMANDA3012
Use my referral link: www.oriflame.com/giordani/amada3012''',
  '''✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance
Use my referral code: UK-AMANDA3012
Use my referral link: www.oriflame.com/giordani/amada3012''',
  '''Unlock the power of bold, beautiful lashes! With WonderLash Mascara, get ultimate length, volume, and definition for a stunning, eye-catching look. One swipe is all it takes! 💖 #WonderLash #LashesForDays
Use my referral code: UK-AMANDA3012
Use my referral link: www.oriflame.com/giordani/amada3012''',
];

class SongAndArtist {
  final String song;
  final String artist;

  SongAndArtist({required this.song, required this.artist});
}

List<SongAndArtist> songAndArtist = [
  SongAndArtist(song: "Bad Habits", artist: "Ed Sheeran"),
  SongAndArtist(song: "Unstoppable", artist: "Sia"),
  SongAndArtist(song: "Vogue", artist: "Madonna"),
];
