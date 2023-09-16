import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.exception.freezed.dart';

@freezed
class RequestException with _$RequestException implements Exception {
  factory RequestException.badRequest() = _RequestExceptionBadRequest;
  factory RequestException.unAuthorized() = _RequestExceptionUnAuthorized;
  factory RequestException.forbidden() = _RequestExceptionBadForbidden;
  factory RequestException.notFound() = _RequestExceptionNotFound;
  factory RequestException.serverError() = _RequestExceptionServerError;
  factory RequestException.unknown() = _RequestExceptionUnknown;
}
