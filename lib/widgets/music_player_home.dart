

import 'package:flutter/material.dart';
import 'package:harmony_flow/themes/app_themes.dart';

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harmony Flow',
      debugShowCheckedModeBanner: false,
      theme:themeApp.light,
      darkTheme: themeApp.dark,
      themeMode: ThemeMode.light,
      home: const MusicPlayerHome(),
    );
  }
}

class MusicPlayerHome extends StatefulWidget {
  const MusicPlayerHome({Key? key}) : super(key: key);

  @override
  State<MusicPlayerHome> createState() => _MusicPlayerHomeState();
}

class _MusicPlayerHomeState extends State<MusicPlayerHome> {
  int _selectedIndex = 0;
  bool _isDarkMode = true;
  bool _isPlaying = false;
  double _currentPosition = 0.3;

  final List<Map<String, String>> _songs = [
    {'title': 'Summer Vibes', 'artist': 'Artist Name', 'duration': '3:45'},
    {'title': 'Midnight Dreams', 'artist': 'Another Artist', 'duration': '4:20'},
    {'title': 'Ocean Waves', 'artist': 'Wave Music', 'duration': '3:15'},
    {'title': 'Electric Soul', 'artist': 'DJ Master', 'duration': '5:00'},
    {'title': 'Urban Nights', 'artist': 'City Sounds', 'duration': '3:50'},
  ];

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryGreen = const Color(0xFF00FF7F);
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.grey[100];
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Harmony Flow',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: primaryGreen,
            ),
            onPressed: _toggleTheme,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _selectedIndex == 0 ? _buildHomeView(isDark, primaryGreen, cardColor, textColor)
          : _buildPlaylistView(isDark, primaryGreen, cardColor, textColor),
      bottomNavigationBar: _buildBottomBar(isDark, primaryGreen, textColor),
    );
  }

  Widget _buildHomeView(bool isDark, Color primaryGreen, Color? cardColor, Color textColor) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildNowPlaying(isDark, primaryGreen, cardColor, textColor),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Toutes les musiques',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: primaryGreen),
                    label: Text('Ajouter', style: TextStyle(color: primaryGreen)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ..._songs.map((song) => _buildSongTile(song, isDark, primaryGreen, cardColor, textColor)),
            ],
          ),
        ),
        _buildMiniPlayer(isDark, primaryGreen, cardColor, textColor),
      ],
    );
  }

  Widget _buildNowPlaying(bool isDark, Color primaryGreen, Color? cardColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryGreen.withOpacity(0.3), primaryGreen.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryGreen.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: primaryGreen.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(Icons.music_note, size: 80, color: primaryGreen),
          ),
          const SizedBox(height: 20),
          Text(
            'Summer Vibes',
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Artist Name',
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: primaryGreen,
              inactiveTrackColor: textColor.withOpacity(0.2),
              thumbColor: primaryGreen,
              overlayColor: primaryGreen.withOpacity(0.2),
            ),
            child: Slider(
              value: _currentPosition,
              onChanged: (value) {
                setState(() {
                  _currentPosition = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1:15', style: TextStyle(color: textColor.withOpacity(0.6))),
                Text('3:45', style: TextStyle(color: textColor.withOpacity(0.6))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous, color: textColor),
                iconSize: 36,
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              Container(
                decoration: BoxDecoration(
                  color: primaryGreen,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryGreen.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  color: Colors.black,
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.skip_next, color: textColor),
                iconSize: 36,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSongTile(Map<String, String> song, bool isDark, Color primaryGreen, Color? cardColor, Color textColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: primaryGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.music_note, color: primaryGreen),
        ),
        title: Text(
          song['title']!,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          song['artist']!,
          style: TextStyle(color: textColor.withOpacity(0.6)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              song['duration']!,
              style: TextStyle(color: textColor.withOpacity(0.6)),
            ),
            const SizedBox(width: 8),
            Icon(Icons.more_vert, color: textColor.withOpacity(0.6)),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildPlaylistView(bool isDark, Color primaryGreen, Color? cardColor, Color textColor) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mes Playlists',
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle, color: primaryGreen, size: 32),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildPlaylistCard('Favoris', '12 titres', isDark, primaryGreen, cardColor, textColor, Icons.favorite),
        _buildPlaylistCard('Workout', '8 titres', isDark, primaryGreen, cardColor, textColor, Icons.fitness_center),
        _buildPlaylistCard('Chill', '15 titres', isDark, primaryGreen, cardColor, textColor, Icons.beach_access),
        _buildPlaylistCard('Party', '20 titres', isDark, primaryGreen, cardColor, textColor, Icons.celebration),
      ],
    );
  }

  Widget _buildPlaylistCard(String title, String subtitle, bool isDark, Color primaryGreen, Color? cardColor, Color textColor, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryGreen.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryGreen, primaryGreen.withOpacity(0.6)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.black, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: textColor.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: textColor.withOpacity(0.4), size: 20),
        ],
      ),
    );
  }

  Widget _buildMiniPlayer(bool isDark, Color primaryGreen, Color? cardColor, Color textColor) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: primaryGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.music_note, color: primaryGreen),
        ),
        title: Text(
          'Summer Vibes',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Artist Name',
          style: TextStyle(color: textColor.withOpacity(0.6)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              color: primaryGreen,
              onPressed: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              color: textColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(bool isDark, Color primaryGreen, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: primaryGreen,
        unselectedItemColor: textColor.withOpacity(0.5),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Playlists',
          ),
        ],
      ),
    );
  }
}