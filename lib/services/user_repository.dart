import 'package:task_bloc/model/user.dart';
import 'package:task_bloc/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers()=> _userProvider.getUsers();
}