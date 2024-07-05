import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'post.dart'; // Assuming you have a separate file for the Post class

class HomeTab extends StatelessWidget {
  final List<Post> posts = [
    Post(
      userName: 'John Doe',
      userImage: 'https://example.com/images/user1.png', // URL to network image
      postImage: 'images/restaurant_6.jpg',
      likes: 10,
      comments: 5,
      isLiked: false,
      rating: 4.5,
      location: 'Restaurant ABC',
      latitude: 0.0,
      longitude: 0.0,
      review: 'This place is amazing!',
    ),
    Post(
      userName: 'Jane Smith',
      userImage: 'https://example.com/images/user2.png', // URL to network image
      postImage: 'images/restaurant_3.jpg',
      likes: 20,
      comments: 15,
      isLiked: false,
      rating: 4.2,
      location: 'Cafe XYZ',
      latitude: 0.0,
      longitude: 0.0,
      review: 'Great food and ambiance!',
    ),
    // Add more posts here
  ];

  final Function(Post) toggleLike;
  final Function(Post, String) addComment;

  HomeTab({required this.toggleLike, required this.addComment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPostItem(posts[index], context);
        },
      ),
    );
  }

  Widget _buildPostItem(Post post, BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: post.isLiked ? Colors.red : Colors.brown[700],
                    ),
                    onPressed: () {
                      toggleLike(post);
                    },
                  ),
                  Text('${post.likes} Likes', style: TextStyle(color: Colors.brown[700])),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.comment, color: Colors.brown[700]),
                    onPressed: () {
                      _showAddCommentDialog(context, post);
                    },
                  ),
                  Text('${post.comments} Comments', style: TextStyle(color: Colors.brown[700])),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _openMap(post.latitude, post.longitude);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Text('Location', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rating: ${post.rating}', style: TextStyle(color: Colors.brown[700])),
                Text('Review: ${post.review}', style: TextStyle(color: Colors.brown[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openMap(double latitude, double longitude) async {
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map';
    }
  }

  void _showAddCommentDialog(BuildContext context, Post post) {
    final TextEditingController commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: 'Enter your comment here'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  addComment(post, commentController.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
