// ignore_for_file: library_private_types_in_public_api
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:interviews_rian_asmara/detail_level.dart';
import 'package:interviews_rian_asmara/src/model/level.dart';
import 'package:game_levels_scrolling_map/game_levels_scrolling_map.dart';
import 'package:game_levels_scrolling_map/model/point_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LevelData? levelData;
  bool isLoading = false;
  List<PointModel> points = [];


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse(
        'https://www.random.org/integers/?num=2&min=0&max=50&col=1&base=10&format=plain&rnd=new',
      ),
    );

    if (response.statusCode == 200) {

      final data = response.body.split('\n');
      int totalLevels = int.tryParse(data[0]) ?? 0;
      int completedLevels = int.tryParse(data[1]) ?? 0;
      setState(() {
        levelData = LevelData(totalLevels, completedLevels);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Levels Map'),
      ),
      body: levelData == null || isLoading
          ? const Center(child: CircularProgressIndicator())
          : LevelsMap(levelData!),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: isLoading ? null : fetchData,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // TODO: FETCH LOCAL SERVER
            },
            child: const Icon(Icons.remove_from_queue_sharp),
          ),
        ],
      ),
    );
  }
}

class LevelsMap extends StatelessWidget {
  final LevelData levelData;
  const LevelsMap(this.levelData, {super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 900,
          child: CustomPaint(
            size: const Size(900, 600),
            painter: LevelMapPainter(levelData),
              child: Column(
                verticalDirection: VerticalDirection.up,
                children: List.generate(levelData.totalLevels, (index) {
                  bool isCompleted = index < levelData.completedLevels;
                  return LevelTile(
                    levelNumber: index + 1,
                    isCompleted: isCompleted,
                  );
                }),
              ),
          ),
        ),
      ),
    );
  }
}

class LevelMapPainter extends CustomPainter {
  final LevelData levelData;

  LevelMapPainter(this.levelData);

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LevelTile extends StatelessWidget {
  final int levelNumber;
  final bool isCompleted;

  const LevelTile({
    super.key,
    required this.levelNumber,
    required this.isCompleted,
  });

  void _onTileTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelDetailScreen(
          levelNumber: levelNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTileTap(context);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (!isCompleted)
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.grey,
                  ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted ? Colors.deepPurpleAccent : Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      '$levelNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // if (!isCompleted) const Divider(),
          ],
        ),
      ),
    );
  }
}
