import 'package:dartz/dartz.dart';
import 'package:learn_clean_architecture_again/core/errors/failure.dart';
import 'package:learn_clean_architecture_again/core/params/params.dart';
import 'package:learn_clean_architecture_again/features/pokemon/business/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemon(
      {required PokemonParams params});
}
