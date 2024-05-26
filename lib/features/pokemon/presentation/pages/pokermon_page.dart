import 'package:flutter/material.dart';
import 'package:learn_clean_architecture_again/features/pokemon/presentation/widgets/pokemon_widget.dart';
import 'package:learn_clean_architecture_again/features/pokemon/presentation/widgets/search_pokemon_widget.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PokemonWidget(),
          SearchPokemonWidget(),
        ],
      ),
    );
  }
}
