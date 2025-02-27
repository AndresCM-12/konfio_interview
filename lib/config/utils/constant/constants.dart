import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';

class Constants {
  static const String appName = 'Dogs We Love';
  static const String appVersion = '0.1.0';
  static const String baseUrl = 'https://jsonblob.com';
  static const String dogsRoute = '/api/1151549092634943488';

  static const int primaryFontColor = 0xFF333333;
  static const int secondaryFontColor = 0xFF666666;
  static const int backgroundColor = 0xFFF8F8F8;

  static const List<DogEntity> mockedDogs = [
    DogEntity(
      dogName: 'Rex',
      image: 'https://placehold.jp/300x600.png',
      description:
          'He is much more passive and is the first to suggest to rescue and not eat The Little Pilot',
      age: 5,
    ),
    DogEntity(
      dogName: 'Chief',
      image: 'https://placehold.jp/300x600.png',
      description:
          'He is the leader of the pack and is the most aggressive of the dogs',
      age: 6,
    ),
    DogEntity(
      dogName: 'Duke',
      image: 'https://placehold.jp/300x600.png',
      description:
          'He is the leader of the pack and is the most aggressive of the dogs',
      age: 6,
    ),
    DogEntity(
      dogName: 'King',
      image: 'https://placehold.jp/300x600.png',
      description:
          'He is the leader of the pack and is the most aggressive of the dogs',
      age: 6,
    ),
    DogEntity(
      dogName: 'Rex',
      image: 'https://placehold.jp/300x600.png',
      description:
          'He is much more passive and is the first to suggest to rescue and not eat The Little Pilot',
      age: 5,
    ),
  ];
}
