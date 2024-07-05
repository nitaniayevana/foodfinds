import 'package:flutter/material.dart';
import 'post.dart'; // Assuming you have a separate file for the Post class

class LoveTab extends StatelessWidget {
  final List<Post> likedPosts;

  LoveTab({required this.likedPosts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love'),
        backgroundColor: Colors.brown,
      ),
      body: likedPosts.isEmpty
          ? Center(child: Text('No liked posts'))
          : ListView.builder(
        itemCount: likedPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildLikedPostItem(likedPosts[index]);
        },
      ),
    );
  }

  Widget _buildLikedPostItem(Post post) {
    return Card(
      color: Colors.brown[50],
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown,
              backgroundImage: NetworkImage(post.userImage), // Use NetworkImage for network images
            ),
            title: Text(post.userName, style: TextStyle(color: Colors.brown[900])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              post.postImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rating: ${post.rating}', style: TextStyle(color: Colors.brown[700])),
                Text('Review: ${post.review}', style: TextStyle(color: Colors.brown[700])),
                SizedBox(height: 8),
                Text('Comments:',
                    style: TextStyle(
                        color: Colors.brown[700], fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                for (var comment in post.commentList)
                  Text(comment, style: TextStyle(color: Colors.brown[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
