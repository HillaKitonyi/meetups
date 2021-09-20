import 'package:enum_to_string/enum_to_string.dart';

enum MeetupCategory {
  general,
  academic,
  beverage,
  business,
  chatting,
  coffee,
  drinks,
  food,
  online,
  sports,
  travel,
}

extension on String {
  String toTitleCase() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension MeetupCategoryX on MeetupCategory {
  String asString() => EnumToString.convertToString(this).toTitleCase();

  String assetPicturePath() {
    switch (this) {
      case MeetupCategory.academic:
        return 'assets/academic_meetup.png';
      case MeetupCategory.beverage:
        return 'assets/beverage_drinks.png';
      case MeetupCategory.business:
        return 'assets/business_meetup.png';
      case MeetupCategory.chatting:
        return 'assets/chatting_meetup.png';
      case MeetupCategory.coffee:
        return 'assets/coffee_sharing.png';
      case MeetupCategory.drinks:
        return 'assets/drinks_meetup.png';
      case MeetupCategory.food:
        return 'assets/food_meetup.png';
      case MeetupCategory.online:
        return 'assets/online_meetup.png';
      case MeetupCategory.sports:
        return 'assets/sports_meetup.png';
      case MeetupCategory.travel:
        return 'assets/travelling_meetup.png';
      default:
        return 'assets/chatting_meetup.png';
    }
  }
}
