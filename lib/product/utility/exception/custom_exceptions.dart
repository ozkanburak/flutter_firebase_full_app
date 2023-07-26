class FirebaseCustomExcepiton implements Exception {
  FirebaseCustomExcepiton(this.description);

  final String description;
  @override
  String toString(){
    return '$this $description';
  }
  
}
class VersionCustomExcepiton implements Exception {
  VersionCustomExcepiton(this.description);

  final String description;
  @override
  String toString(){
    return '$this $description';
  }
  
}