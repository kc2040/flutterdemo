import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


void main()
{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Login info is required to proceed.", (WidgetTester tester) async {
    //app.main();
    //await tester.pumpAndSettle();
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byType(ElevatedButton)); //using find by type because page has one button only
    await tester.pumpAndSettle(); //wait for animation to complete

    //home page it should find at least one widget and detail page no widget
    expect(find.byType(Homepage), findsOneWidget);
    expect(find.byType(DetailPage), findsNothing);
    expect(find.text('Login failed.'), findsOneWidget);
  },);

  testWidgets("description",
          (WidgetTester tester) async {
        //app.main();
        //await tester.pumpAndSettle();
        await tester.pumpWidget(MyApp());

        final usernameText = "demo";
        final passwordText = "demo";

        await tester.enterText(find.byKey(Key('_username')), usernameText);
        await tester.enterText(find.byKey(Key('_password')), passwordText);

        await tester.tap(find.byType(ElevatedButton)); //using find by type because page has one button only
        await tester.pumpAndSettle(); //wait for animation to complete

        //home page it should find no widget and detail page at least one widget
        expect(find.byType(Homepage), findsNothing);
        expect(find.byType(DetailPage), findsOneWidget);
        expect(find.text('Log in success.'), findsOneWidget);

        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();

        //home page it should find at least one widget and detail page no widget
        expect(find.byType(Homepage), findsOneWidget);
        expect(find.byType(DetailPage), findsNothing);

        //login fail message should not be there
        expect(find.text('Login failed.'), findsNothing);

      }

  );
}