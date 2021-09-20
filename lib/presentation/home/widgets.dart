import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:meetups/logic/home/home_page_model.dart';
import 'package:meetups/logic/navigation/nav_model.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';
import 'package:meetups/presentation/meetup/meetup_page.dart';
import 'package:transparent_image/transparent_image.dart';

class HorizontalFeaturedMeetups extends ConsumerWidget {
  const HorizontalFeaturedMeetups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredMeetups = ref.watch(
      homePageModelProvider.select((state) => state.featuredMeetups),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Featured Meetups',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 28,
              letterSpacing: 1,
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: featuredMeetups.length,
            itemBuilder: (context, index) {
              final meetup = featuredMeetups[index];
              return _FeaturedMeetup(meetup: meetup);
            },
          ),
        ),
      ],
    );
  }
}

class _FeaturedMeetup extends StatelessWidget {
  final Meetup meetup;
  const _FeaturedMeetup({Key? key, required this.meetup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MeetupPage(meetupID: meetup.uid!)),
            );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: IntrinsicHeight(
              child: Container(
                width: 250,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                child: Column(children: [
                  meetup.photoUrl == null
                      ? Hero(
                          tag: meetup.uid!,
                          child: Image.asset(
                            meetup.category.assetPicturePath(),
                            fit: BoxFit.fitHeight,
                            height: 180,
                            width: 250,
                          ),
                        )
                      : Hero(
                          tag: meetup.uid!,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: meetup.photoUrl!,
                            fit: BoxFit.cover,
                            height: 180,
                            width: 250,
                          ),
                        ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const Icon(Icons.date_range_rounded, size: 12),
                                const SizedBox(width: 4),
                                Text(DateFormat('d MMM').format(meetup.dateAndTime)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(200),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const Icon(Icons.location_pin, size: 12),
                                const SizedBox(width: 4),
                                Text(meetup.location, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalCategories extends StatelessWidget {
  const HorizontalCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Categories',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 28,
              letterSpacing: 1,
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: MeetupCategory.values.length,
            itemBuilder: (context, index) {
              final category = MeetupCategory.values[index];
              return _CategoryItem(category: category);
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends ConsumerWidget {
  final MeetupCategory category;
  const _CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
        ),
        child: GestureDetector(
          onTap: () {
            ref.read(navModelProvider.notifier).onNavigate(context, DrawerItem.viewMeetups);
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(12),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.info_outline_rounded, size: 14),
                    const SizedBox(width: 4),
                    Text(category.asString()),
                  ],
                ),
                Image.asset(
                  category.assetPicturePath(),
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
