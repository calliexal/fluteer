import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; 
import 'package:myapp/pages/home_page.dart';

void main() {
  testWidgets('HomePage displays albums', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the HomePage displays the search bar and list of albums.
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Navigate to AlbumDetailPage', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tap on the first album in the list
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    // Verify that AlbumDetailPage is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Checkout'), findsOneWidget);
  });

  testWidgets('Add to cart and navigate to CartPage', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Tap on the first album in the list
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();

    // Tap the 'Checkout' button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that CartPage is displayed
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Pay Now'), findsOneWidget);
  });
}
