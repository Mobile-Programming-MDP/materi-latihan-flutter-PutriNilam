import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;
  final bool isFavorite; // Variable to store favorite status
  bool isSignedIn; // Variable to store sign-in status

  DetailScreen({
    Key? key,
    required this.candi,
    required this.isFavorite,
    required this.isSignedIn,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isFavorite; // Change to late initialization

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
    _checkSignInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.candi.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await _toggleFavorite();
                  },
                  icon: Icon(
                    widget.isSignedIn && isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.isSignedIn && isFavorite ? Colors.red : null,
                  ),
                ),
              ],
            ),

            // ... existing code ...
          ],
        ),
      ),
    );
  }

  Future<void> _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    widget.isSignedIn = prefs.getBool('isSignedIn') ?? false;
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.candi.name}') ?? false;
    isFavorite = favorite;
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool newFavorite = !isFavorite;
    setState(() {
      isFavorite = newFavorite;
    });
    prefs.setBool('favorite_${widget.candi.name}', newFavorite);
  }
}
