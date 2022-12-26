import 'package:flutter/material.dart';

const users = [
  userYonil,
  userGordon,
  userSalvatore,
  userSacha,
  userDiego,
  userTiago,
  userRuben,
  userNash,
];
const userYonil = DemoUser(
  id: 'yonil',
  name: 'Yonil Mejia',
  image:
      'https://images.pexels.com/photos/14535941/pexels-photo-14535941.jpeg',
);

const userGordon = DemoUser(
  id: 'gordon',
  name: 'Gordon Hayes',
  image:
      'https://images.pexels.com/photos/9607264/pexels-photo-9607264.jpeg',
);

const userSalvatore = DemoUser(
  id: 'salvatore',
  name: 'Salvatore Giordano',
  image:
      'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSacha = DemoUser(
  id: 'sasha',
  name: 'Sasha Arbonel',
  image:
      'https://images.pexels.com/photos/9534338/pexels-photo-9534338.jpeg',
);

const userDiego= DemoUser(
  id: 'diego',
  name: 'Diego Martin',
  image:
      'https://images.pexels.com/photos/8867242/pexels-photo-8867242.jpeg',
);

const userTiago= DemoUser(
  id: 'tiago',
  name: 'Tiago Puma',
  image:
      'https://images.pexels.com/photos/8704612/pexels-photo-8704612.jpeg',
);

const userRuben = DemoUser(
  id: 'ruben',
  name: 'Ruben Turner',
  image:
      'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

const userNash = DemoUser(
  id: 'nash',
  name: 'Nash Ramdial',
  image:
      'https://images.pexels.com/photos/2416871/pexels-photo-2416871.jpeg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}