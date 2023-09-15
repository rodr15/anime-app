import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_streaming.model.freezed.dart';

@freezed
class AnimeStreaming with _$AnimeStreaming {
  factory AnimeStreaming({
    required String name,
    required String url,
  }) = _AnimeStreaming;
}
