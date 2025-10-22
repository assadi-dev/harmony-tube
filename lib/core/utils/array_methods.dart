List<dynamic> arrayShuffle(List<dynamic> array) {
  if (array.isNotEmpty) {
    List<dynamic> shuffledTracks = List.from(array);
    shuffledTracks.shuffle();
    return shuffledTracks;
  }
  return array;
}