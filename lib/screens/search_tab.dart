import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String searchQuery = '';
  List<Map<String, dynamic>> searchResults = [];

  void _searchPosts(String query) async {
    if (query.isNotEmpty) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('content', isGreaterThanOrEqualTo: query)
          .get();

      setState(() {
        searchResults = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      });
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
                _searchPosts(value);
              },
            ),
          ),
          Expanded(
            child: searchResults.isEmpty
                ? Center(child: Text('No results found'))
                : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final post = searchResults[index];
                return ListTile(
                  title: Text(post['location']['name']),
                  subtitle: Text(post['content']),
                  onTap: () {
                    // You can add navigation to post details if needed
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
