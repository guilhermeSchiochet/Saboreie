import 'package:flutter/material.dart';
import 'package:saboreie/src/data/model/slide_item.model.dart';

class SlideItem extends StatelessWidget {
  final SlideItemModel item;

  SlideItem({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 3.0,
        child: Column(
          children: [
            _buildImageSection(context),
            const SizedBox(height: 7.0),
            _buildPaddingLeft()
          ],
        ),
      ),
    );
  }

  Widget _buildPaddingLeft() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            _buildTitle(),
            const SizedBox(height: 7.0),
            _buildDescription(),
            const SizedBox(height: 10.0),
          ]
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3.7,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              item.img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        _buildRatingCard(),
        _buildOpenLabel(),
      ],
    );
  }

  Widget _buildRatingCard() {
    return Positioned(
      top: 6.0,
      right: 6.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              const Icon(Icons.star, size: 10),
              Text(
                ' ${item.rating} ',
                style: const TextStyle(fontSize: 10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpenLabel() {
    return Positioned(
      top: 6.0,
      left: 6.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            ' OPEN ',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        item.title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Expanded(
      child: Text(
        item.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
