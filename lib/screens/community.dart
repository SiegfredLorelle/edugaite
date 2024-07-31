import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Community'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'Newsfeed'),
            Tab(text: 'Q&A Forum'),
            Tab(text: 'Community Groups'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/profile.jpg'), // replace with your image asset
              ),
              title: Text('John Smith'),
              subtitle: Text('Just posted a new article'),
              trailing: Text('3h'),
            ),
            Text(
              'New to teaching? Here are some tips for creating a great learning environment.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10),
            Image.asset(
                'assets/images/classroom.jpg'), // replace with your image asset
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
                Text('12'),
                SizedBox(width: 20),
                IconButton(icon: Icon(Icons.comment), onPressed: () {}),
                Text('5'),
                SizedBox(width: 20),
                IconButton(icon: Icon(Icons.share), onPressed: () {}),
                Text('3'),
                Spacer(),
                IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
