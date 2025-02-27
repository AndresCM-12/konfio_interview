abstract class DogsRemoteEvent {
  const DogsRemoteEvent();
}

class GetDogs extends DogsRemoteEvent {
  final bool forceRefresh;
  const GetDogs({this.forceRefresh = false});
}
