import 'package:flutter/material.dart';
import 'package:my_app/components/image_holder.dart';
import 'package:my_app/screens/post/components/button_section.dart';
import 'package:my_app/screens/post/components/text_section.dart';
import 'package:my_app/screens/post/components/title_section.dart';



  class PostScreen extends StatefulWidget {
    const PostScreen({Key? key}) : super(key: key);
  static String routeName = "/post";
    @override
    // ignore: library_private_types_in_public_api
    _PostScreenState createState() => _PostScreenState();
  }

  class _PostScreenState extends State<PostScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
        ),
        body:Column(children: const [Imageholder(imageUrl: 'images/lake.jpg'),TitleSection(),BuildButtomColumn(),TextSection(), ]) ,
      );
    }
  }