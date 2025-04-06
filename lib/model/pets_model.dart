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
    sex: "Femail ",
    color: const Color.fromARGB(255, 233, 132, 237),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Amila Marko',
    breed: 'LaPerm cats',
    image: 'assets/adoption/cat/cat2.png',
    age: "2",
    origin: "US",
    sex: "Femail ",
    color: const Color.fromARGB(255, 53, 174, 255),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Yon lee',
    breed: 'Persian cat',
    image: 'assets/adoption/cat/cat3.png',
    age: "3 ",
    origin: "Iran",
    sex: "Femail ",
    color: const Color.fromARGB(255, 134, 69, 255),
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
    sex: "Dog",
    color: const Color.fromARGB(255, 108, 253, 255),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Bella',
    breed: 'Golden Retriever',
    image: 'assets/adoption/dog/dog4.png',
    age: " 2",
    origin: "Italy",
    sex: "Dog",
    color: const Color.fromARGB(255, 205, 0, 164),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Charlie',
    breed: 'German Shepherd',
    image: 'assets/adoption/dog/dog5.png',
    age: " 2.5",
    origin: "India",
    sex: "Dog",
    color: const Color.fromARGB(255, 113, 98, 247),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Daisy',
    breed: 'Beagle',
    image: 'assets/adoption/dog/dog6.png',
    age: "2.5",
    origin: "India",
    sex: "Dog",
    color: const Color.fromARGB(255, 47, 216, 243),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Luna',
    breed: 'Siberian Husky',
    image: 'assets/adoption/dog/dog7.png',
    age: " 2.5",
    origin: "India",
    sex: "Dog",
    color: const Color.fromARGB(255, 216, 68, 162),
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
    sex: "bird",
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
    sex: "Bird",
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
    sex: "Bird",
    color: const Color.fromARGB(255, 180, 78, 243),
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
      color: const Color(0xffC1B7B1)),
  PetsModel(
      name: '',
      breed: '',
      image: '',
      age: "",
      origin: "",
      sex: "",
      description: "",
      color: const Color(0xffC1B7B1)),
];

List<String> categoryList = [
  'Cats',
  'Dogs',
  'Birds',
  'Other',
];