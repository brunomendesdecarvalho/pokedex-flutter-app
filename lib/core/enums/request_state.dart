enum RequestState {
  IDLE,
  LOADING,
  SUCCESS,
  FAIL,
  EXPIRED_SECTION,
  TIMEOUT,
  NO_CONNECTION,
  NO_CONNECTION_WITH_SERVER
}

extension RequestStateExtension on RequestState {
  bool get isError {
    switch (this) {
      case RequestState.NO_CONNECTION_WITH_SERVER:
      case RequestState.NO_CONNECTION:
      case RequestState.TIMEOUT:
      case RequestState.EXPIRED_SECTION:
      case RequestState.FAIL:
        return true;
      default:
        return false;
    }
  }
}