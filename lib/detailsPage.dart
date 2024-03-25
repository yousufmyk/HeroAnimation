import 'package:flutter/material.dart';
import 'package:hero_animation/heroAnimation.dart';

class DetailsPgae extends StatelessWidget {
  const DetailsPgae({super.key, required this.person});
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                      scale: animation
                          .drive(Tween<double>(begin: 0.0, end: 1.0).chain(
                        CurveTween(curve: Curves.fastOutSlowIn),
                      )),
                      child: toHeroContext.widget,
                    ),
                  );

                case HeroFlightDirection.pop:
                  return Material(
                    color: Colors.transparent,
                    child: fromHeroContext.widget,
                  );
              }
            },
            tag: person.name,
            child: Text(
              person.person,
              style: TextStyle(fontSize: 50),
            )),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              person.name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${person.age} years old',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
