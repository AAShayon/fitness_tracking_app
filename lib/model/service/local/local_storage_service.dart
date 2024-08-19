abstract class LocalStorageSystemService{
  Future<dynamic> read({required String key});
  Future<void> write({required String key,required dynamic value});
  Future<void> update({required String key,required dynamic value});
  Future<void> delete({required String key});
}