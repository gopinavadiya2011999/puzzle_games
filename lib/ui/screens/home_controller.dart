import 'dart:async';
import 'package:demopuzzle/infrastructure/cosntant/image_constant.dart';
import 'package:demopuzzle/infrastructure/models/puzzle_list_model.dart';
import 'package:demopuzzle/ui/common_widgets/common_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class HomeController extends GetxController {
  var tiles = List<int>.generate(16, (i) => i).obs;
  var emptyTileIndex = 15.obs;
  var moves = 0.obs;
  var time = 0.obs;
  Timer? timer;
  String? gameOverText;
  bool startGame = false;
  List<PuzzleListModel> puzzleListView = puzzleModel;
  List<Image>? imagePieces;
  PageController pageController = PageController();
  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    loadImage().then((image) async {
      imagePieces = await splitImage(image);
      update();
      shufflePuzzle();
    });
    super.onInit();
  }

  Future<ui.Image> loadImage({String? image}) async {
    final ByteData data = await rootBundle.load(image ?? ImageConstant.puzzle);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (image) {
      return completer.complete(image);
    });
    update();
    return completer.future;
  }

  Future<List<Image>> splitImage(ui.Image image) async {
    int width = image.width ~/ 4;
    int height = image.height ~/ 4;
    List<Image> pieces = [];
    for (int y = 0; y < 4; y++) {
      for (int x = 0; x < 4; x++) {
        ui.PictureRecorder recorder = ui.PictureRecorder();
        Canvas canvas = Canvas(recorder);
        canvas.drawImageRect(
          image,
          Rect.fromLTWH(x * width.toDouble(), y * height.toDouble(), width.toDouble(), height.toDouble()),
          Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
          Paint(),
        );
        ui.Image piece = await recorder.endRecording().toImage(width, height);
        pieces.add(Image(image: MemoryImage((await piece.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List())));
      }
    }
    update();
    return pieces;
  }

  void startTimer() {
    timer?.cancel();
    time.value = 0;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time.value++;
      if (time.value == 120) {
        gameOverText = 'Game Over';
        stopTimer();
      }
      update();
    });
  }

  void stopTimer() {
    moves = 0.obs;
    time = 0.obs;
    startGame = false;
    timer?.cancel();
    update();
  }

  void resetGame() {
    gameOverText = null;
    tiles.value = List<int>.generate(16, (i) => i);
    emptyTileIndex.value = 15;
    moves.value = 0;
    time.value = 0;
    update();
    shufflePuzzle();
    startTimer();
    update();
  }

  void shufflePuzzle() {
    if (startGame) {
      tiles.shuffle(Random());
    }else{
      tiles.sort();
    }
    if (tiles[15] != 15) {
      int emptyIndex = tiles.indexOf(15);
      tiles[emptyIndex] = tiles[15];
      tiles[15] = 15;
    }
    emptyTileIndex.value = 15;
    update();
  }

  void moveTile(int index) {
    if (startGame) {
      if ((index - 1 == emptyTileIndex.value && index % 4 != 0) ||
          (index + 1 == emptyTileIndex.value && (index + 1) % 4 != 0) ||
          index - 4 == emptyTileIndex.value ||
          index + 4 == emptyTileIndex.value) {
        tiles[emptyTileIndex.value] = tiles[index];
        tiles[index] = 15;
        emptyTileIndex.value = index;
        moves.value++;
      }
      update();
    } else {
      showTopToast(msg: 'Please press start button to play');
    }
  }

  bool isSolved() {
    for (int i = 0; i < 15; i++) {
      if (tiles[i] != i) return false;
    }
    return true;
  }
}
