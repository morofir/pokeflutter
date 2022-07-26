import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    //    Provider.of<??>(context, listen: false). ?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = [];
    return const Text('homepage');
  }
}
