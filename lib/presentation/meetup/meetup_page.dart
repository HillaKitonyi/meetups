import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/infrastructure/fire_store_service.dart';
import 'package:meetups/presentation/meetup/widgets.dart';

class MeetupPage extends ConsumerWidget {
  final String meetupID;
  const MeetupPage({required this.meetupID, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetupStream = ref.watch(meetupProvider(meetupID));
    final Meetup meetup = meetupStream.maybeWhen(
      data: (meetup) => meetup,
      orElse: () => Meetup.initial(),
    );

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ImageAppBar(meetup: meetup),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('EEEE, MMMM d, yyyy').format(meetup.dateAndTime),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: const Text('REGISTER'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  meetup.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600]!,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     centerTitle: true,
    //     elevation: 0,
    //     title: Text(
    //       meetup.title,
    //       style: const TextStyle(letterSpacing: 1, fontWeight: FontWeight.w400),
    //     ),
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.edit_rounded),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    //   body: Stack(children: [
    //     Container(
    //       height: 0.4 * screenSize.height,
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [
    //             Colors.black54,
    //             Colors.black45,
    //             Colors.black38,
    //             Colors.black26,
    //             Colors.black12
    //           ],
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           stops: [0.2, 0.3, 0.45, 0.6, 1],
    //         ),
    //       ),
    //     ),
    //   ]),
    // );
  }
}
