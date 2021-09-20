// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meetup _$$_MeetupFromJson(Map<String, dynamic> json) => _$_Meetup(
      category: _$enumDecode(_$MeetupCategoryEnumMap, json['category']),
      creatorID: json['creatorID'] as String?,
      title: json['title'] as String,
      photoUrl: json['photoUrl'] as String?,
      description: json['description'] as String,
      location: json['location'] as String,
      dateAndTime: DateTime.parse(json['dateAndTime'] as String),
    );

Map<String, dynamic> _$$_MeetupToJson(_$_Meetup instance) => <String, dynamic>{
      'category': _$MeetupCategoryEnumMap[instance.category],
      'creatorID': instance.creatorID,
      'title': instance.title,
      'photoUrl': instance.photoUrl,
      'description': instance.description,
      'location': instance.location,
      'dateAndTime': instance.dateAndTime.toIso8601String(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$MeetupCategoryEnumMap = {
  MeetupCategory.general: 'general',
  MeetupCategory.academic: 'academic',
  MeetupCategory.beverage: 'beverage',
  MeetupCategory.business: 'business',
  MeetupCategory.chatting: 'chatting',
  MeetupCategory.coffee: 'coffee',
  MeetupCategory.drinks: 'drinks',
  MeetupCategory.food: 'food',
  MeetupCategory.online: 'online',
  MeetupCategory.sports: 'sports',
  MeetupCategory.travel: 'travel',
};
