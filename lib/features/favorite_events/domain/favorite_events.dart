class FavoriteEvents {
  FavoriteEvents({
    required idsList,
  }) {
    this.idsList = idsList;
  }

  List<String> _idsList = [];

  set idsList(List<String> ids) {
    _idsList = ids.toSet().toList();
  }

  List<String> get idsList => _idsList;

  bool checkIdInList(String id) {
    return _idsList.contains(id);
  }
}
