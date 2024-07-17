import 'package:demopuzzle/infrastructure/cosntant/image_constant.dart';

class PuzzleListModel {
  String puzzleName;
  String image;

  PuzzleListModel({required this.puzzleName, required this.image});
}

List<PuzzleListModel> puzzleModel = [
  PuzzleListModel(puzzleName: "Puzzle Girl", image: ImageConstant.puzzle),
  PuzzleListModel(puzzleName: "Penguin", image: ImageConstant.penguin),
];
