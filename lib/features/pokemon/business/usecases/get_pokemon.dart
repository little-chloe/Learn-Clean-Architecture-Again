import 'package:dartz/dartz.dart';
import 'package:learn_clean_architecture_again/core/errors/failure.dart';
import 'package:learn_clean_architecture_again/core/params/params.dart';
import 'package:learn_clean_architecture_again/features/pokemon/business/entities/pokemon_entity.dart';
import 'package:learn_clean_architecture_again/features/pokemon/business/repositories/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository repository;

  GetPokemon(this.repository);

  Future<Either<Failure, PokemonEntity>> call(
      {required PokemonParams params}) async {
    return await repository.getPokemon(params: params);
  }
}
