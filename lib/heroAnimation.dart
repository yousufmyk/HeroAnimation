import 'package:flutter/material.dart';
import 'package:hero_animation/detailsPage.dart';



class Person {
  final String person;
  final String name;
  final String age;

  Person({required this.person, required this.name, required this.age});
}
// ignore: must_be_immutable
class HeroAnimationFirstPage extends StatelessWidget {
   HeroAnimationFirstPage({super.key});

  List<Person> persons = [
    Person(person: '👨🏻', name: 'Yousuf', age: '20'),
    Person(person: '👨🏾‍🦳', name: 'Ahmed', age: '50'),
    Person(person: '👮🏻‍♂️', name: 'Police', age: '25'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context,index){
          final person = persons[index];
          return ListTile(
            leading: Hero(
              tag: person.name,
              child: Text(
                persons[index].person,style: TextStyle(fontSize: 40)
              ),
            ),
            title: Text(
              persons[index].name,
            ),
            subtitle: Text(
              '${persons[index].age} years old'g
            ),
            trailing: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailsPgae(person: person,))
                );
            }, icon: const Icon(Icons.arrow_forward_ios_rounded)),

          );
        }),
    );
  }
}