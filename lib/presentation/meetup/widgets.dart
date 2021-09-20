import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageAppBar extends StatelessWidget {
  final Meetup meetup;
  const ImageAppBar({Key? key, required this.meetup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: false,
      expandedHeight: 0.4 * screenSize.height,
      flexibleSpace: Hero(
        tag: meetup.uid!,
        child: SafeArea(
          child: FlexibleSpaceBar(
            title: Text(
              meetup.title,
              style: TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black45.withOpacity(0.6),
                    offset: const Offset(1, 1),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
            background: meetup.photoUrl == null
                ? Image.asset(
                    meetup.category.assetPicturePath(),
                    fit: BoxFit.cover,
                  )
                : FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: meetup.photoUrl!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
          ),
          child: IconButton(
            splashColor: Colors.black12,
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.favorite_outline_rounded, color: Colors.black54),
            onPressed: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
          ),
          child: IconButton(
            splashColor: Colors.black12,
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.edit, color: Colors.black54, size: 18),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class CardTitle extends StatelessWidget {
  final String meetupTitle;
  const CardTitle({Key? key, required this.meetupTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            meetupTitle,
            style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white, shadows: [
              Shadow(
                color: Colors.black45.withOpacity(0.6),
                offset: const Offset(1, 1),
                blurRadius: 5,
              ),
            ]),
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            iconSize: 20,
            icon: const Icon(Icons.edit_rounded, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
