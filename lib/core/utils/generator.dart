import 'package:unique_id_generator/unique_id_generator.dart';

String generateId() {
  final randomId = UniqueIdGenerator.generateRandomId(length: 12);
  return randomId;
}
