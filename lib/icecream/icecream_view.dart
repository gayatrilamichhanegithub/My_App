import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class IcecreamView extends StatelessWidget {
  IcecreamView({super.key});

  Map<String, dynamic>? decodedIcecreams;

  Future<void> loadIcecreams() async {
    final rawIcecreams = await rootBundle.loadString("assets/icecream.json");
    decodedIcecreams = jsonDecode(rawIcecreams);
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    // This condition won't work as expected because loadIcecreams() is async
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Icecream",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "We have something yummy for you",
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (decodedIcecreams != null)
                    const Text("Icecreams loaded")
                  else
                    const CircularProgressIndicator.adaptive(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
