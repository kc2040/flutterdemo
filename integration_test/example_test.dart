import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutterdemo/main.dart' as app;

void main(){

  group('app test', (){

    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("failing test example", (WidgetTester tester) async{
      app.main();
      await tester.pumpAndSettle();

      expect(2+2, equals(4));
    });
  });


}