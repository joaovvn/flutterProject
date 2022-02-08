import 'package:project1/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
