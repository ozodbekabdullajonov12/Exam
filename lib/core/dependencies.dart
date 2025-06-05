import 'package:ayol_uchun_exam/data/repositories/auth_repository.dart';
import 'package:ayol_uchun_exam/data/repositories/course_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => CourseRepository(client: context.read())),
];
