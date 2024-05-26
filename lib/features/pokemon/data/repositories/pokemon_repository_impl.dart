import 'package:dartz/dartz.dart';
import 'package:learn_clean_architecture_again/core/connection/network_info.dart';
import 'package:learn_clean_architecture_again/core/errors/exceptions.dart';
import 'package:learn_clean_architecture_again/core/errors/failure.dart';
import 'package:learn_clean_architecture_again/core/params/params.dart';
import 'package:learn_clean_architecture_again/features/pokemon/business/repositories/pokemon_repository.dart';
import 'package:learn_clean_architecture_again/features/pokemon/data/datasources/pokemon_local_data.dart';
import 'package:learn_clean_architecture_again/features/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:learn_clean_architecture_again/features/pokemon/data/models/pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  final PokemonLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PokemonModel>> getPokemon(
      {required PokemonParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotePokemon = await remoteDataSource.getPokemon(params: params);

        localDataSource.cachePokemon(remotePokemon);

        return Right(remotePokemon);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      try {
        final localPokemon = await localDataSource.getLastPokemon();
        return Right(localPokemon);
      } on CacheException {
        return Left(CacheFailure(errorMessage: 'No local data found'));
      }
    }
  }
}
