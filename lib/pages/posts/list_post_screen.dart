// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/services/post_service.dart';

void main() {
  runApp(ListPostScreen());
}

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Fetch Data')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: FutureBuilder<List<PostModel>>(
            future: PostService.ListPost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              final dataPost = snapshot.data ?? [];
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: dataPost.length,
                itemBuilder: (context, items) {
                  final data = dataPost[items];
                  return GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (_) => PostDetailScreen(
                    //         id: data.id.toString(),
                    //         title: data.title,
                    //         userId: data.userId.toString(),
                    //       ),
                    //     ),
                    //   );
                    // },
                    child: ListTile(
                      leading: Text(data.id.toString()),
                      title: Text(data.title),
                      subtitle: Text('User ID: ${data.userId}'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}