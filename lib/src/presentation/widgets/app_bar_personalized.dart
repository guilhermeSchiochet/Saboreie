import 'package:flutter/material.dart';
import 'package:saboreie/src/presentation/widgets/container_background_default.dart';
import 'package:saboreie/src/presentation/widgets/text_form_field_builder.dart';

class AppBarPersonalized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPersonalized({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, double.maxFinite);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 65.0,
        bottom: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Row(
        children: [
          ContainerBackgroundDefault(
            child: Image.asset('assets/imgs/icons8-hamburger 1.png'),
          ),
          _builderSearchBar(),
          ContainerBackgroundDefault(
            child: Image.asset('assets/imgs/icons8-slider 1.png')
          )
        ],
      ),
    );
  }

  Widget _builderSearchBar() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0
        ),
        child:  TextFormFieldBuilder(
          filled: true,
          textStyle: const TextStyle(fontSize: 12),
          hintText: 'Search Foods',
          maxLines: 1,
          fillColor: const Color.fromRGBO(80, 117, 138, 0.1),
          hintStyle: const TextStyle(fontSize: 12),
          prefix: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0
            ),
            child: Image.asset('assets/imgs/Group.png'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
        )
      ),
    );
  }
}