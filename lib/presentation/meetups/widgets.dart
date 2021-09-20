import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:meetups/presentation/core/fade_in_page_builder.dart';
import 'package:meetups/presentation/meetup/meetup_page.dart';
import 'package:transparent_image/transparent_image.dart';

class NoResultsPage extends StatelessWidget {
  const NoResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInPagebuilder(
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Image.asset('assets/no_results.png', fit: BoxFit.cover),
      ),
    );
  }
}

class MeetupsList extends StatelessWidget {
  final List<Meetup> meetupsList;
  const MeetupsList({Key? key, required this.meetupsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInPagebuilder(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: meetupsList.length,
          itemBuilder: (context, index) {
            final meetup = meetupsList[index];
            return _MeetupListItem(meetup: meetup);
          },
        ),
      ),
    );
  }
}

class _MeetupListItem extends StatelessWidget {
  final Meetup meetup;
  const _MeetupListItem({Key? key, required this.meetup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).primaryColor, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 0,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MeetupPage(meetupID: meetup.uid!)),
          );
        },
        child: _MeetupListItemDetails(meetup: meetup),
      ),
    );
  }
}

class _MeetupListItemDetails extends StatelessWidget {
  final Meetup meetup;
  const _MeetupListItemDetails({Key? key, required this.meetup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
          child: meetup.photoUrl != null
              ? Hero(
                  tag: meetup.uid!,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: meetup.photoUrl!,
                    height: 140,
                    width: 120,
                    fit: BoxFit.fitHeight,
                  ),
                )
              : Hero(
                  tag: meetup.uid!,
                  child: Image.asset(
                    meetup.category.assetPicturePath(),
                    height: 140,
                    width: 120,
                    fit: BoxFit.fitHeight,
                  ),
                ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                meetup.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline5!.copyWith(letterSpacing: 1),
              ),
              const SizedBox(height: 4),
              Text(DateFormat('EEEE, d MMMM, yyyy').format(meetup.dateAndTime)),
              const SizedBox(height: 10),
              Wrap(spacing: 2, children: [
                Chip(
                  label: Text(DateFormat('h:mm a').format(meetup.dateAndTime)),
                  labelStyle: const TextStyle(color: Colors.white),
                  avatar: const Icon(
                    CupertinoIcons.clock,
                    color: Colors.white70,
                    size: 18,
                  ),
                  visualDensity: VisualDensity.compact,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                Chip(
                  label: Text(meetup.location),
                  labelStyle: const TextStyle(color: Colors.white),
                  avatar: const Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.white70,
                    size: 18,
                  ),
                  visualDensity: VisualDensity.compact,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ]),
            ]),
          ),
        ),
      ],
    );
  }
}
