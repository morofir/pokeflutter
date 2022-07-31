import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SaveCancelBtns extends StatelessWidget {
  SaveCancelBtns({this.pokeId});
  final pokeId;

  void handleAddPokemon(String pokemon) {
    print('functions:' + pokemon);
  }

  final Mor controller = Get.put(Mor());

  @override
  Widget build(BuildContext context) {
    final counter = controller.readCount();
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            iconSize: 45,
            icon: Icon(Icons.cancel),
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () => handleAddPokemon(this.pokeId),
            iconSize: 45,
            icon: Icon(Icons.save),
          ),
          Obx(
            () => Text(
              '${controller.count}',
            ),
          ),
        ]),
        FloatingActionButton(
          onPressed: () {
            controller.increment();
            controller.writeCount(counter);
          },
          tooltip: 'Increment',
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class Mor extends GetxController {
  //TODO see storage working.
  final box = GetStorage();

  final count = 0.obs;
  increment() => count.value++;

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void writeCount(int c) {
    box.write('count', count.value);
  }

  int readCount() {
    int num = box.read('count') ?? 0;
    return num;
  }
}
