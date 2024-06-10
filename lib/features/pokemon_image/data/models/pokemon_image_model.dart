import 'package:learn_clean_architecture_again/features/pokemon_image/business/entities/pokemon_image_entity.dart';

import '../../../../../core/constants/constants.dart';

class PokemonImageModel extends PokemonImageEntity {
  const PokemonImageModel({
    required super.path,
  });

  factory PokemonImageModel.fromJson({required Map<String, dynamic> json}) {
    return PokemonImageModel(
      path: json[kPath],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kPath: path,
    };
  }
}
