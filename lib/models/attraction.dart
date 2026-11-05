import 'package:latlong2/latlong.dart';


enum AttractionType { hauntedHouse, pumpkinPatch, cornMaze }

class Attraction {
  final String id;
  final String name;
  final AttractionType type;
  final int scareLevel; 
  final LatLng location;
  final String address;
  final String description;

  const Attraction({
    required this.id,
    required this.name,
    required this.type,
    required this.scareLevel,
    required this.location,
    required this.address,
    required this.description,
  });


  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'] as String,
      name: json['name'] as String,
      type: AttractionType.values.byName(json['type'] as String),
      scareLevel: json['scareLevel'] as int,
      
      location: LatLng(
        (json['latitude'] as num).toDouble(),
        (json['longitude'] as num).toDouble(),
      ),
      address: json['address'] as String,
      description: json['description'] as String,
    );
  }

  @override
  String toString() => '$name (${type.name}, scare level $scareLevel)';
}