import 'package:app_fm/last_fm_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('FM Api Test', () async {
    // LastFmApi lastFmApi = LastFmApi();
    print(await LastFmApi.searchAlbums());
  });
}
