import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:notes/app/core/errors/failures.dart';
import 'package:notes/app/core/utils/network_helper.dart';
import 'package:notes/app/data/model/note.dart';
import 'package:notes/app/data/model/note_response.dart';
import 'package:notes/app/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef LoginOrRegister = Future<Response> Function();

class ApiProvider {
  final Dio http;
  final SharedPreferences prefs;

  ApiProvider({required this.http, required this.prefs});

  Future<Either<Failure, User>> login(
    String identifier,
    String password,
  ) async {
    final body = jsonEncode({
      'identifier': identifier,
      'password': password,
    });

    return await _loginOrRegister(() => http.post('/auth/local', data: body));
  }

  Future<Either<Failure, User>> register(Map<String, dynamic> data) async {
    final body = jsonEncode(data);

    return await _loginOrRegister(
      () => http.post('/auth/local/register', data: body),
    );
  }

  Future<Either<Failure, NoteResponse>> getMyNotes(int page) async {
    if (await NetworkHelper.isConnected) {
      final user = User.fromJson(jsonDecode(prefs.getString('user')!));
      final uri =
          '/notes?filters[user][id][\$eq]=${user.id}&pagination[page]=$page';

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final noteResponse = NoteResponse.fromJson(response.data);
        return Right(noteResponse);
      }

      return const Left(
        ServerFailure('Error al obtener tus notas, inténtalo más tarde'),
      );
    }

    return const Left(ConnectionFailure('Revisa tu conexión a internet'));
  }

  Future<Either<Failure, User>> _loginOrRegister(
    LoginOrRegister loginOrRegister,
  ) async {
    if (await NetworkHelper.isConnected) {
      final response = await loginOrRegister();

      if (response.statusCode == 200) {
        final jwt = response.data['jwt'];
        final user = User.fromJson(response.data['user']);

        await prefs.setString('token', jwt);
        await prefs.setString('user', jsonEncode(response.data['user']));

        return Right(user);
      }

      return const Left(
        ServerFailure('Revisa los datos introducidos e inténtalo nuevamente'),
      );
    }

    return const Left(ConnectionFailure('Revisa tu conexión a internet'));
  }
}
