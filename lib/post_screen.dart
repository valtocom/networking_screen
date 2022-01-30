import 'package:flutter/material.dart';
import 'package:networking_screen/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networking Screen',
          style: TextStyle(fontSize: 30, color: Colors.black87),),
        backgroundColor: Colors.white70,
      ),
      body: FutureBuilder<Post>(
          future: fetchPost(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return PostItem(post: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              post.title,
              style: const TextStyle(fontSize: 36, color: Colors.black45),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              post.body,
              style: const TextStyle(fontSize: 18, color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}
