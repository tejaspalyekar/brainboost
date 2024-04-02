class PlacementModal {
  PlacementModal({required this.placementdata});
  Map placementdata;

  factory PlacementModal.fromjson(Map json) {
    return PlacementModal(placementdata: json);
  }
}
