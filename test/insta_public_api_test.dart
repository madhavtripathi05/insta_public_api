import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insta_public_api/insta_public_api.dart';

void main() {
  const MethodChannel channel = MethodChannel('insta_public_api');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await InstaPublicApi.platformVersion, '42');
  });
}
