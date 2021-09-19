import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets.dart';

const String _homePageText = """Join our awesome meetup community, 
participate in Meetups and organise your own event and meet amazing people.""";

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(children: const [
        HorizontalFeaturedMeetups(),
        SizedBox(height: 16),
        HorizontalCategories(),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            _homePageText,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
