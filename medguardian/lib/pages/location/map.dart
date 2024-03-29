import 'package:flutter/material.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';

import 'package:medguardian/widgets/Containers/pill_container.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

//This page displays a map of the zone
//As we're broke, it just displays an image of the marauders map

class MyMapPage extends StatelessWidget {
  const MyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
      body: DraggableBottomSheet(
        minExtent: 150,
        useSafeArea: false,
        curve: Curves.easeIn,
        previewWidget:
            _previewWidget(Provider.of<ThemeLoader>(context).actualTheme),
        expandedWidget:
            _expandedWidget(Provider.of<ThemeLoader>(context).actualTheme),
        backgroundWidget: _backgroundWidget(),
        maxExtent: MediaQuery.of(context).size.height * 0.8,
        onDragging: (pos) {},
      ),
    );
  }

  //################### MAP #######################
//We display the map on the background
  Widget _backgroundWidget() {
    return PhotoViewGallery.builder(
      itemCount: 1,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: const AssetImage('assets/map.jpg'),
          minScale: PhotoViewComputedScale.contained * 0.1,
          maxScale: PhotoViewComputedScale.contained * 2,
          heroAttributes: const PhotoViewHeroAttributes(tag: 'map_hero_tag'),
        );
      },
      scrollPhysics: const BouncingScrollPhysics(),
      backgroundDecoration: const BoxDecoration(
        color: Colors.black,
      ),
      pageController: PageController(),
    );
  }

  //this shit closed, SHEET
//######################## CLOSED SHEET ##########################
//The style for the sheet when it's closed
  Widget _previewWidget(ThemeData actualTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: actualTheme.colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          const Row(),
        ],
      ),
    );
  }

//##################### OPEN SHEET #####################
//The style when it's open
  Widget _expandedWidget(ThemeData actualTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: actualTheme.colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            //This button will find the quickest way home
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_down,
                    size: 30, color: Colors.white),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: actualTheme.colorScheme.onBackground),
                child: const Text('Bring me home'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            //And this list shows the closest drug stores
            'Closest drug stores',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                PirulasContainer(
                    title: "Pepito",
                    text: "C/Patata Frita",
                    hour: "A 1km",
                    icon: Icons.place),
                PirulasContainer(
                    title: "Pepito",
                    text: "C/Patata Frita",
                    hour: "A 1km",
                    icon: Icons.place),
                PirulasContainer(
                    title: "Pepito",
                    text: "C/Patata Frita",
                    hour: "A 1km",
                    icon: Icons.place),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
