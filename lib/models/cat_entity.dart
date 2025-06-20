class CatEntity {
  final Weight weight; // Rango de peso
  final String id; // Identificador único
  final String name; // Nombre de la raza
  final String temperament; // Adjetivos de carácter (coma‑separados)
  final String origin; // País o región de origen
  final String description; // Descripción general
  final String lifeSpan; // Esperanza de vida ("12 - 15")
  final int adaptability; // 1–5
  final int affectionLevel; // 1–5
  final int childFriendly; // 1–5
  final int dogFriendly; // 1–5
  final int energyLevel; // 1–5
  final int grooming; // 1–5
  final int healthIssues; // 1–5
  final int intelligence; // 1–5
  final int sheddingLevel; // 1–5
  final int socialNeeds; // 1–5
  final int strangerFriendly; // 1–5
  final int hypoallergenic; // 1–5
  final CatImage? image; // Metadata de la imagen (opcional)

  CatEntity({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.hypoallergenic,
    this.image,
  });

  factory CatEntity.fromJson(Map<String, dynamic> json) => CatEntity(
    weight: Weight.fromJson(json['weight']),
    id: json['id'] as String,
    name: json['name'] as String,
    temperament: json['temperament'] as String,
    origin: json['origin'] as String,
    description: json['description'] as String,
    lifeSpan: json['life_span'] as String,
    adaptability: json['adaptability'] as int,
    affectionLevel: json['affection_level'] as int,
    childFriendly: json['child_friendly'] as int,
    dogFriendly: json['dog_friendly'] as int,
    energyLevel: json['energy_level'] as int,
    grooming: json['grooming'] as int,
    healthIssues: json['health_issues'] as int,
    intelligence: json['intelligence'] as int,
    sheddingLevel: json['shedding_level'] as int,
    socialNeeds: json['social_needs'] as int,
    strangerFriendly: json['stranger_friendly'] as int,
    hypoallergenic: json['hypoallergenic'] as int,
    image: json['image'] != null ? CatImage.fromJson(json['image']) : null,
  );

  Map<String, dynamic> toJson() => {
    'weight': weight.toJson(),
    'id': id,
    'name': name,
    'temperament': temperament,
    'origin': origin,
    'description': description,
    'life_span': lifeSpan,
    'adaptability': adaptability,
    'affection_level': affectionLevel,
    'child_friendly': childFriendly,
    'dog_friendly': dogFriendly,
    'energy_level': energyLevel,
    'grooming': grooming,
    'health_issues': healthIssues,
    'intelligence': intelligence,
    'shedding_level': sheddingLevel,
    'social_needs': socialNeeds,
    'stranger_friendly': strangerFriendly,
    'hypoallergenic': hypoallergenic,
    'image': image?.toJson(),
  };
}

class Weight {
  final String imperial;
  final String metric;

  Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    imperial: json['imperial'] as String,
    metric: json['metric'] as String,
  );

  Map<String, dynamic> toJson() => {'imperial': imperial, 'metric': metric};
}

class CatImage {
  final String id;
  final int width;
  final int height;
  final String url;

  CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) => CatImage(
    id: json['id'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    url: json['url'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'width': width,
    'height': height,
    'url': url,
  };
}
