import 'package:flutter/material.dart';

class PetsModel {
  String name;
  String breed;
  String image;
  String age;
  String sex;
  String origin;
  Color color;
  String description;

  PetsModel({
    required this.image,
    required this.name,
    required this.breed,
    required this.sex,
    required this.age,
    required this.origin,
    required this.color,
    required this.description,
  });
}

List<PetsModel> cats = [
  PetsModel(
    name: 'Mono LaMi',
    breed: 'British Shorthair cats',
    image: 'assets/adoption/cat/cat1.png',
    age: "1",
    origin: "US",
    sex: "Female ",
    color: const Color.fromARGB(255, 241, 160, 244),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Amila Marko',
    breed: 'LaPerm cats',
    image: 'assets/adoption/cat/cat2.png',
    age: "2",
    origin: "US",
    sex: "Female",
    color: const Color.fromARGB(255, 149, 210, 251),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Yon lee',
    breed: 'Persian cat',
    image: 'assets/adoption/cat/cat3.png',
    age: "3 ",
    origin: "Iran",
    sex: "Female ",
    color: const Color.fromARGB(255, 172, 127, 255),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
];
List<PetsModel> dogs = [
  PetsModel(
    name: 'Max',
    breed: 'Labrador Retriever',
    image: 'assets/adoption/dog/dog3.png',
    age: " 1",
    origin: "UK",
    sex: "Male",
    color: const Color.fromARGB(255, 153, 253, 255),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Bella',
    breed: 'Golden Retriever',
    image: 'assets/adoption/dog/dog4.png',
    age: " 2",
    origin: "Italy",
    sex: "Female",
    color: const Color.fromARGB(255, 255, 117, 227),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Charlie',
    breed: 'German Shepherd',
    image: 'assets/adoption/dog/dog5.png',
    age: " 2.5",
    origin: "India",
    sex: "Female",
    color: const Color.fromARGB(255, 114, 128, 254),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Daisy',
    breed: 'Beagle',
    image: 'assets/adoption/dog/dog6.png',
    age: "2.5",
    origin: "India",
    sex: "Male",
    color: const Color.fromARGB(255, 136, 239, 255),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Luna',
    breed: 'Siberian Husky',
    image: 'assets/adoption/dog/dog7.png',
    age: " 2.5",
    origin: "India",
    sex: "Female",
    color: const Color.fromARGB(255, 255, 120, 205),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
];
List<PetsModel> birds = [
  PetsModel(
    name: 'Charlie',
    breed: 'African Grey Parrot',
    image: 'assets/adoption/bird/bird1.png',
    age: " 1",
    origin: "Nepal",
    sex: "Male",
    color: const Color.fromARGB(255, 248, 171, 193),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Rio',
    breed: 'Scarlet Macaw',
    image: 'assets/adoption/bird/bird2.png',
    age: "1",
    origin: "Fra",
    sex: "Male",
    color: const Color.fromARGB(255, 107, 141, 226),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Sunny',
    breed: 'Cockatiel',
    image: 'assets/adoption/bird/bird3.png',
    age: " 1",
    origin: " UK",
    sex: "Female",
    color: const Color.fromARGB(255, 213, 145, 255),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
];
List<PetsModel> other = [
  PetsModel(
      name: '',
      breed: '',
      image: '',
      age: "",
      origin: "",
      sex: "",
      description: "",
      color: const Color.fromARGB(255, 224, 162, 255)),
  PetsModel(
      name: '',
      breed: '',
      image: '',
      age: "",
      origin: "",
      sex: "",
      description: "",
      color: const Color.fromARGB(255, 124, 207, 255)),
];

List<String> categoryList = [
  'Cats',
  'Dogs',
  'Birds',
  'Other',
];