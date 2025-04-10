import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String img;

  const CategoryItem({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    final double cardSizeHeight = 10;
    final double cardSizeWidth = MediaQuery.of(context).size.width / 2.5;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: SizedBox(
        width: cardSizeWidth,
        height: cardSizeHeight,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          clipBehavior: Clip.antiAlias, // importante para o borderRadius funcionar com a imagem
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                img,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.3), // leve escurecimento da imagem
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
