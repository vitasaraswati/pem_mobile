import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Prak 1 - Langkah 4: Implementasi title row
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1 */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2 */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          /* soal 3 */
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );

    // Prak 2 - Langkah 2: widget buttonSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Prak 3 - Langkah 1: Implementasi textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Panderman merupakan salah satu gunung favorit di Kota Batu '
        'bagi para pendaki pemula. Dengan ketinggian sekitar 2.045 meter di atas permukaan laut, '
        'gunung ini menawarkan panorama alam yang indah serta pemandangan Kota Batu '
        'dan Malang dari puncaknya. Jalur pendakiannya relatif mudah dan hanya membutuhkan '
        'waktu sekitar 2–3 jam untuk mencapai puncak. '
        'Wisata ini sangat cocok bagi pecinta alam dan petualangan ringan. '
        '\n\nDibuat oleh: Vita Eka Saraswati (2341760082)',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Vita Eka Saraswati 2341760082',
      home: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              'images/panderman_1.jpg',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection, // Prak 2 - Langkah 3: button section ke body
            textSection, // Prak 3 - Langkah 2: text section ke body
          ],
        ),
      ),
    );
  }

  // Prak 2 - Langkah 1: Implementasi button row
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}