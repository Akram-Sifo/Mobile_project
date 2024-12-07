import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String userName = '';
  bool selectedQ1Option1 = false;
  bool selectedQ1Option2 = false;
  bool selectedQ1Option3 = false;
  bool selectedQ2Option1 = false;
  bool selectedQ2Option2 = false;
  bool selectedQ2Option3 = false;
  String dropdown1 = "Morning";
  String dropdown2 = "Rainy";
  final List<String> timeOfDayOptions = ["Morning", "Afternoon", "Night"];
  final List<String> weatherOptions = ["Rainy", "Sunny", "Snowy"];
  String personalityResult = '';

  void calculateResult() {
    String q1Answer = '';
    if (selectedQ1Option1) q1Answer += "Reading a book 📚, ";
    if (selectedQ1Option2) q1Answer += "Going out with friends 🎉, ";
    if (selectedQ1Option3) q1Answer += "Exploring nature 🏞️, ";

    String q2Answer = '';
    if (selectedQ2Option1) q2Answer += "Drama 🎭, ";
    if (selectedQ2Option2) q2Answer += "Comedy 😂, ";
    if (selectedQ2Option3) q2Answer += "Adventure 🌍, ";

    String personality = '';
    if (q1Answer.contains("Reading a book 📚") &&
        q2Answer.contains("Drama 🎭")) {
      personality =
          'You are an introspective and thoughtful individual. You enjoy deep thinking and reflection.';
    } else if (q1Answer.contains("Going out with friends 🎉") &&
        q2Answer.contains("Comedy 😂")) {
      personality =
          'You are social, lively, and love to have fun with others. You enjoy humor and light-hearted moments.';
    } else if (q1Answer.contains("Exploring nature 🏞️") &&
        q2Answer.contains("Adventure 🌍")) {
      personality =
          'You are an adventurous spirit who enjoys exploring the world and seeking new experiences.';
    } else {
      personality =
          'You have a balanced personality, combining different aspects from all over the spectrum.';
    }

    if (dropdown1 == 'Morning' && dropdown2 == 'Sunny') {
      personality +=
          '\nYou are an early riser and thrive in positive, sunny environments.';
    } else if (dropdown1 == 'Night' && dropdown2 == 'Rainy') {
      personality +=
          '\nYou are a night owl and find calm and peace during rainy days.';
    } else {
      personality +=
          '\nYou are adaptable to various situations, no matter the time or weather.';
    }

    setState(() {
      personalityResult =
          'Hello, $userName!\n\nHow you spend your weekends: $q1Answer\n\nYour favorite movie genres: $q2Answer\n\nFavorite time of day: $dropdown1\n\nFavorite weather: $dropdown2\n\nYour Personality Evaluation:\n$personality';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Personality Quiz'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration:
                      const InputDecoration(labelText: 'Enter your name'),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Question 1: How do you spend your weekends?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: const Text("Reading a book 📚"),
                  value: selectedQ1Option1,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedQ1Option1 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Going out with friends 🎉"),
                  value: selectedQ1Option2,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedQ1Option2 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Exploring nature 🏞️"),
                  value: selectedQ1Option3,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedQ1Option3 = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Question 2: What kind of movies do you like?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CheckboxListTile(
                  title: const Text("Drama 🎭"),
                  value: selectedQ2Option1,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedQ2Option1 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Comedy 😂"),
                  value: selectedQ2Option2,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedQ2Option2 = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Adventure 🌍"),
                  value: selectedQ2Option3,
                  onChanged: (bool? value) {
                    setState(() {
                      selectedQ2Option3 = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdown1,
                  items: timeOfDayOptions.map((String option) {
                    return DropdownMenuItem(value: option, child: Text(option));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdown1 = value!;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "What's your favorite time of day?"),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: dropdown2,
                  items: weatherOptions.map((String option) {
                    return DropdownMenuItem(value: option, child: Text(option));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropdown2 = value!;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "What's your favorite weather?"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateResult,
                  child: const Text('Submit'),
                ),
                if (personalityResult.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      personalityResult,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
