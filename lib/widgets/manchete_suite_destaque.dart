import 'package:flutter/material.dart';

class MancheteSuiteDestaque extends StatelessWidget {
  // final String chapeu;
  // final String header;
  // final String subheader;
  // final String secondSubheader;

  const MancheteSuiteDestaque({
    Key? key,
    // required this.chapeu,
    // required this.header,
    // required this.subheader,
    // required this.secondSubheader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 446,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/key-alves.jpg"),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2),
                ],
                stops: const [0.0, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            color: Colors.red,
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            child: const Text(
              "BBB 23",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                letterSpacing: 0.12,
                height: 1.3,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Key Alves revela amizade com ex de Bruna Griphao:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Prova do líder gera polêmica:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.14,
                      height: 1.2),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Quem você quer que seja o campeão do BBB23? Vote já!:",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.14,
                      height: 1.2),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
