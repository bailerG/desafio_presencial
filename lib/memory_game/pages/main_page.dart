import 'package:desafio_academy/memory_game/controllers/tile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:desafio_academy/memory_game/controllers/memory_game_controller.dart';

class MemoryGameApp extends StatelessWidget {
  const MemoryGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MemoryGameProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jogo da Memória'),
        ),
        body: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoryGameProvider>(
      builder: (context, tile, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  30,
                  0,
                  100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        tile.init();
                      },
                      child: const Text('Iniciar'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Reiniciar'),
                    )
                  ],
                ),
              ),
              tile.initialized
                  ? const GridTiles()
                  : const Center(
                      child: Text(
                        'Inicie seu jogo',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridTiles extends StatelessWidget {
  const GridTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoryGameProvider>(builder: (context, tile, child) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 4,
        ),
        shrinkWrap: true,
        itemCount: tile.letters.length,
        itemBuilder: (context, index) => MemoryTile(
          letter: tile.letters[index],
        ),
      );
    });
  }
}

class MemoryTile extends StatelessWidget {
  const MemoryTile({
    required this.letter,
    super.key,
  });

  final String letter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TileController(),
      child: Consumer<TileController>(
        builder: (context, tile, child) {
          return InkWell(
            onTap: () {
              tile.isClicked();

            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: tile.show ? Text(letter) : const Text('?'),
              ),
            ),
          );
        },
      ),
    );
  }
}
