import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/attraction.dart';

class SpookyMap extends StatelessWidget {
   const SpookyMap({
    super.key,
    this.attractions = const [],
    this.userLocation,
  });


  final List<Attraction> attractions;
    final LatLng? userLocation;

  static const LatLng homeBase = LatLng(39.608910, -105.017779);
  
  IconData _iconFor(AttractionType type) {
    return switch (type) {
      AttractionType.hauntedHouse => Icons.cottage,
      AttractionType.pumpkinPatch => Icons.agriculture,
      AttractionType.cornMaze => Icons.grass,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final LatLng center = userLocation ?? homeBase;
    return Container(
      height: 300,
      width: double.infinity,
      clipBehavior: Clip.antiAlias, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: colorScheme.outline,
        ),
      ),
      child: FlutterMap(
        key: ValueKey(center),
        options: MapOptions(
          initialCenter: center,
          initialZoom: 13,
          minZoom: 3,
          maxZoom: 18,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.spooky_finder',
            tileBuilder: isDark ? darkModeTileBuilder : null,
          ),          
          MarkerLayer(
            markers: [
              for (final attraction in attractions)
                Marker(
                  point: attraction.location,
                  width: 40,
                  height: 40,
                  child: Tooltip(
                    message: attraction.name, // Shown on hover or long-press, and read by screen readers
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: colorScheme.surface),
                      ),
                      child: Icon(
                        _iconFor(attraction.type),
                        color: colorScheme.onPrimary,
                        size: 22,
                      ),
                    ),
                  ),
                ),
            ],
          ),
           if (userLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  point: userLocation!,
                  width: 32,
                  height: 32,
                  child: Tooltip(
                    message: 'You are here',
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.tertiary, // A different color from the haunt pins
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: colorScheme.surface),
                      ),
                      child: Icon(
                        Icons.person,
                        color: colorScheme.onTertiary,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          const SimpleAttributionWidget(
            source: Text('OpenStreetMap contributors'),
          ),
        ],
      ),
    );
  }
}
