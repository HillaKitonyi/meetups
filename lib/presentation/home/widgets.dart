import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HorizontalFeaturedMeetups extends StatelessWidget {
  const HorizontalFeaturedMeetups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            itemCount: 8,
            itemBuilder: (context, index) {
              return const _FeaturedMeetup();
            },
          ),
        ),
      ],
    );
  }
}

class _FeaturedMeetup extends StatelessWidget {
  const _FeaturedMeetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            width: 250,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            child: Stack(alignment: Alignment.topCenter, children: [
              SvgPicture.asset(
                'assets/undraw_eating_together.svg',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Icon(Icons.date_range_rounded, size: 12),
                        SizedBox(width: 4),
                        Text('08 Dec'),
                      ],
                    ),
                  ),
                ),
              )
            ]),
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
            itemCount: 8,
            itemBuilder: (context, index) {
              return const _CategoryItem();
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            width: 150,
            height: 150,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            child: Stack(alignment: Alignment.topCenter, children: [
              SvgPicture.asset(
                'assets/undraw_eating_together.svg',
                fit: BoxFit.cover,
                height: 150,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Icon(Icons.date_range_rounded, size: 12),
                        SizedBox(width: 4),
                        Text('08 Dec'),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
