class Campsite {
  final String id;
  final String label;
  final String photo;
  final double pricePerNight;
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final List<String> hostLanguages;
  final List<String> suitableFor;
  final DateTime createdAt;
  final GeoLocation geoLocation;

  Campsite({
    required this.id,
    required this.label,
    required this.photo,
    required this.pricePerNight,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.hostLanguages,
    required this.suitableFor,
    required this.createdAt,
    required this.geoLocation,
  });

  factory Campsite.fromJson(Map<String, dynamic> json) {
    return Campsite(
      id: json['id'] as String,
      label: json['label'] as String,
      photo: json['photo'] as String,
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      isCloseToWater: json['isCloseToWater'] ?? false,
      isCampFireAllowed: json['isCampFireAllowed'] ?? false,
      hostLanguages: List<String>.from(json['hostLanguages'] ?? []),
      suitableFor: List<String>.from(json['suitableFor'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] as String),
      geoLocation: GeoLocation.fromJson(
        json['geoLocation'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'photo': photo,
      'pricePerNight': pricePerNight,
      'isCloseToWater': isCloseToWater,
      'isCampFireAllowed': isCampFireAllowed,
      'hostLanguages': hostLanguages,
      'suitableFor': suitableFor,
      'createdAt': createdAt.toIso8601String(),
      'geoLocation': geoLocation.toJson(),
    };
  }
}

class GeoLocation {
  final double lat;
  final double long;

  GeoLocation({required this.lat, required this.long});

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'long': long};
  }
}
