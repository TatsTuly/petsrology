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
    name: 'Milo',
    breed: 'Mixed',
    image: 'assets/adoption/cat/cat1.png',
    age: "1 years",
    origin: "Bangladesh",
    sex: "Female ",
    color: const Color.fromARGB(255, 233, 132, 237),
    description:
        "This cat exudes a confident, observant personality. Her intense golden eyes give her a wise, watchful look, while her thick fur and bold stripes add to a majestic, almost wild aesthetic. She looks both cuddly and clever .",
  ),
  PetsModel(
    name: 'Sir Whiskerlot',
    breed: 'Maine Coon',
    image: 'assets/adoption/cat/cat2.png',
    age: "2 years",
    origin: "USA",
    sex: "Female ",
    color: const Color.fromARGB(255, 53, 174, 255),
    description:
        "Regal in demeanor and incredibly fluffy. Enjoys long naps on velvet cushions and chasing laser dots with unexpected energy.",
  ),
  PetsModel(
    name: 'Mochi',
    breed: 'Persian cat',
    image: 'assets/adoption/cat/cat3.png',
    age: "3 years",
    origin: "Iran",
    sex: "Male",
    color: const Color.fromARGB(255, 134, 69, 255),
    description:
        "A gentle lap cat with a floppy, cuddly body. He melts into your arms like his namesake dessert.",
  ),
];
List<PetsModel> dogs = [
  PetsModel(
    name: 'Max',
    breed: 'Labrador Retriever',
    image: 'assets/adoption/dog/dog3.png',
    age: "2 years",
    origin: "Japan",
    sex: "Male",
    color: const Color.fromARGB(255, 108, 253, 255),
    description:
        "A cheeky, independent little guy with a heart full of loyalty. Max loves chasing butterflies and acting like a ninja in the garden. He can be dramatic at times, but one look into those almond eyes and you’ll forgive anything.",
  ),
  PetsModel(
    name: 'Nova',
    breed: 'Border Collie',
    image: 'assets/adoption/dog/dog4.png',
    age: "2 years",
    origin: "England",
    sex: "Female",
    color: const Color.fromARGB(255, 205, 0, 164),
    description:
        "A brilliant herder with energy that never quits. Nova is always up for a game of fetch and can even recognize over 50 words. She's quick, loyal, and a little bit of a show-off (in the best way).",
  ),
  PetsModel(
    name: 'Charlie',
    breed: 'German Shepherd',
    image: 'assets/adoption/dog/dog5.png',
    age: "3 years",
    origin: "India",
    sex: "Female",
    color: const Color.fromARGB(255, 113, 98, 247),
    description:
        "Pure sunshine in a fluffy package. Charlie is patient, nurturing, and always ready to comfort you with a paw on your lap. She’s the dog that every child dreams of growing up with.",
  ),
  PetsModel(
    name: 'Bruno',
    breed: 'French Bulldog',
    image: 'assets/adoption/dog/dog6.png',
    age: "4 years",
    origin: "France",
    sex: "Male",
    color: const Color.fromARGB(255, 47, 216, 243),
    description:
        "A laid-back gentleman who prefers cuddles over cardio. Bruno loves naps, snacks, and stealing hearts wherever he waddles. His tiny snores are strangely therapeutic.",
  ),
  PetsModel(
    name: 'Luna',
    breed: 'Siberian Husky',
    image: 'assets/adoption/dog/dog7.png',
    age: "2.5 years",
    origin: "USA",
    sex: "Male",
    color: const Color.fromARGB(255, 216, 68, 162),
    description:
        "A spirited explorer who howls at the moon. Luna loves the snow, chasing his tail, and pulling you toward new adventures. Mischievous but lovable.",
  ),
];
List<PetsModel> birds = [
  PetsModel(
    name: 'Kiwi',
    breed: 'Budgerigar (Budgie)',
    image: 'assets/adoption/bird/bird1.png',
    age: "1 years",
    origin: "Australia",
    sex: "Female",
    color: const Color.fromARGB(255, 248, 171, 193),
    description:
        "A cheerful chatterbox who loves to sing along with phone ringtones. Kiwi is playful, social, and always curious about what you’re doing.",
  ),
  PetsModel(
    name: 'Rio',
    breed: 'Scarlet Macaw',
    image: 'assets/adoption/bird/bird2.png',
    age: "3 years",
    origin: "Brazil",
    sex: "Male",
    color: const Color.fromARGB(255, 107, 141, 226),
    description:
        "Loud, proud, and impossible to ignore. Rio loves attention, belly rubs, and nibbling on fruit. He can be a bit mischievous but is endlessly entertaining.",
  ),
  PetsModel(
    name: 'Tiki',
    breed: 'Rainbow Lorikeet',
    image: 'assets/adoption/bird/bird3.png',
    age: "2 years",
    origin: "Canary Islands",
    sex: "Female",
    color: const Color.fromARGB(255, 180, 78, 243),
    description:
        "A hyperactive little featherball who loves fruit juice and upside-down tricks. Tiki is bold, bright, and always zooming around like a feathered rocket.",
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
    color: const Color(0xffC1B7B1),
  ),
  PetsModel(
    name: '',
    breed: '',
    image: '',
    age: "",
    origin: "",
    sex: "",
    description: "",
    color: const Color(0xffC1B7B1),
  ),
];

List<String> categoryList = ['Cats', 'Dogs', 'Birds', 'Other'];
