class FavoriteEvents {
  FavoriteEvents({
    required List<String> idsList,
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

  toggleIds(String id) {
    if (_idsList.contains(id)) {
      _idsList = _idsList.where((existingId) => existingId != id).toList();
    } else {
      _idsList.add(id);
    }
  }
}
