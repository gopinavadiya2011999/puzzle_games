# Puzzle Game

The **Puzzle Game** is a Flutter-based interactive game where users can challenge themselves with fun and engaging puzzles. 
This game is designed to test cognitive skills while offering an enjoyable and relaxing experience.

https://github.com/user-attachments/assets/63388787-752c-4b76-9a5d-19d00dd94e33

## Features

- **Interactive Gameplay**: Solve various puzzles with intuitive controls.
- **Customizable Images**: Change puzzle images using the provided options.
- **Smooth Animations**: Seamless transitions for an enhanced user experience.
- **Multiplatform Support**: Available for both iOS and Android devices.
- **Dynamic Layouts**: Adaptive design for all screen sizes and orientations.

# How to Play
- Launch the app and select a puzzle from the home screen.
- Drag and drop puzzle pieces to complete the image.
- Tap the "Reset" button to start over if needed.
- Complete the puzzle to view the final image.

## Puzzle Game View

![download-compresskaru com (3)](https://github.com/user-attachments/assets/8b7e1e19-3928-4d3e-b4c2-a266d18decbf)
![download-compresskaru com (2)](https://github.com/user-attachments/assets/17773215-76a2-43c4-9d3e-f725dbbc1e0f)


```dart
GestureDetector(
 onTap: () => controller.moveTile(index),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      image: controller.tiles[index] == 15
                          ? null
                          : DecorationImage(
                        image: controller.imagePieces![controller.tiles[index]].image,
                        fit: BoxFit.cover,
                      ),
                      color: controller.tiles[index] == 15 ? ColorConstant.white.withOpacity(0.2) : null,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                );
```

## Puzzle Control Buttons

![download-compresskaru com (4)](https://github.com/user-attachments/assets/cd85c8b6-0ab1-469d-98e7-23ee41a7bfec)
![download-compresskaru com (1)](https://github.com/user-attachments/assets/5fda7815-e461-48ad-a32b-25e782918da1)


```dart
 Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    controller.startGame=true;
                    controller.update();
                    controller.resetGame();
                  },
                  text: 'Start / Restart',
                ),
                const SizedBox(width: 10),
                CustomButton(
                  onTap: () {

                    controller.stopTimer();
                  },
                  text: 'Stop',
                ),
              ],
            ),
```


### Folder Structure

```plain-text
puzzle_game-main/
├── assets/
│   ├── penguin.png
│   ├── puzzle.png
├── lib/
│   ├── main.dart
│   ├── infrastructure/
│   │   ├── constant/
│   │   │   ├── app_pages.dart
│   │   │   ├── color_constant.dart
│   │   │   ├── image_constant.dart
│   │   │   ├── route_constant.dart
│   │   ├── models/
│   │       ├── puzzle_list_model.dart
│   ├── ui/
│       ├── common_widgets/
│       │   ├── change_image.dart
│       │   ├── common_inkwell.dart
│       │   ├── common_toast.dart
│       ├── screens/
│           ├── home_screen.dart
│           ├── home_bindings.dart
│           ├── home_controller.dart
│           ├── widgets/
│               ├── bottom_buttons_view.dart
│               ├── custom_button.dart
│               ├── middle_page_view.dart
│               ├── top_row_list_view.dart
├── pubspec.yaml
├── README.md
```

