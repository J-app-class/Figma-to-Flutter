import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const AppHeader({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Row(
        children: [
          SvgPicture.asset(
          'assets/icons/home/pumpkin_title_icon.svg',
          width: 48,
          height: 48,
          ),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );

  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


