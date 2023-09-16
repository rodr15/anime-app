import '../../domain/exceptions/request.exception.dart';

getException(int code) {
  switch (code) {
    case 400:
      throw RequestException.badRequest();
    case 401:
      throw RequestException.unAuthorized();
    case 403:
      throw RequestException.forbidden();
    case 404:
      throw RequestException.notFound();
    case 500:
      throw RequestException.serverError();
    default:
      throw RequestException.unknown();
  }
}
