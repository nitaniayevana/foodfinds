import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showPosts = false;
  bool _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Tambahkan fungsi untuk mengedit profil
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          CircleAvatar(
            radius: 50,
            // Ganti dengan gambar profil pengguna
            backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          SizedBox(height: 16),
          Text(
            'Nama Pengguna', // Ganti dengan nama pengguna
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.brown,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Deskripsi Pengguna', // Ganti dengan deskripsi pengguna
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.brown[700],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Tambahkan fungsi untuk mengedit profil
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
            ),
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.black, // Ubah warna teks menjadi hitam
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _showPosts = !_showPosts;
                    _showFavorites = false;
                  });
                },
                child: Text(
                  'Postingan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown, // Ubah warna teks menjadi cokelat
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _showFavorites = !_showFavorites;
                    _showPosts = false;
                  });
                },
                child: Text(
                  'Favorit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown, // Ubah warna teks menjadi cokelat
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (_showPosts)
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 9, // Ganti dengan jumlah postingan pengguna
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    'assets/post_$index.jpg', // Ganti dengan gambar postingan pengguna
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          if (_showFavorites)
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 6, // Ganti dengan jumlah postingan favorit pengguna
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    'assets/favorite_$index.jpg', // Ganti dengan gambar postingan favorit pengguna
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
        ],
      ),
      // bottomNavigationBar telah dihapus
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
    theme: ThemeData(
      primarySwatch: Colors.brown,
    ),
  ));
}