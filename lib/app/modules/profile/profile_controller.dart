import 'package:get/get.dart';
import 'package:notes/app/data/model/user.dart';
import 'package:notes/app/data/provider/api_provider.dart';

class ProfileController extends GetxController {
  final ApiProvider api;
  final user = User(id: 0, name: '', email: '', username: '').obs;

  ProfileController({required this.api});
}
