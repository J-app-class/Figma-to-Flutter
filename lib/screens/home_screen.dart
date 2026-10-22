import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spooky_find/widgets/scare_level_dropdown.dart';
import '../widgets/app_header.dart';
import '../widgets/map_placeholder.dart';




class HomeScreen extends StatelessWidget{
    const HomeScreen({super.key});

    final List<String>_scareLevels = const [
        'Mildly Haunted',
        'Zombies Ahead',
        'Absolute Terror'
    ];

    @override
    Widget build(BuildContext context){
        const selectedLevel = 'Mildly Haunted';

        return Scaffold(
            appBar: const AppHeader(
                title: 'Spooky Finder',
            ),
            body:SingleChildScrollView(
                padding:const EdgeInsets.symmetric(horizontal:20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        const SizedBox(height: 40),
                        ScareLevelDropdown(
                            selectedValue: selectedLevel,
                            items: _scareLevels,
                        ),
                        const SizedBox(height: 40),
                        const SpookyMap(),
                        const SizedBox(height: 24),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/home/camera_icon.svg'
                                      ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/home/camera_icon.svg'
                                      ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        );
    }
}
