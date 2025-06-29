import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

// class CheckoutRemoteDatasource {
//   Map<String, dynamic>? paymentIntent;
//   Future<void> makePayment(BuildContext context) async {
//     try {
//       // Create payment intent data
//       paymentIntent = await createPaymentIntent('100', 'INR');
//       // initialise the payment sheet setup
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           // Client secret key from payment data
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           googlePay: const PaymentSheetGooglePay(
//               // Currency and country code is accourding to India
//               testEnv: true,
//               currencyCode: "INR",
//               merchantCountryCode: "IN"),
//           // Merchant Name
//           merchantDisplayName: 'Flutterwings',
//           // return URl if you want to add
//           // returnURL: 'flutterstripe://redirect',
//         ),
//       );
//       // Display payment sheet
//       displayPaymentSheet(context);
//     } catch (e) {
//       print("exception $e");

//       if (e is StripeConfigException) {
//         print("Stripe exception ${e.message}");
//       } else {
//         print("exception $e");
//       }
//     }
//   }

//   displayPaymentSheet(BuildContext context) async {
//     try {
//       // "Display payment sheet";
//       final data = await Stripe.instance.presentPaymentSheet();
//       // Show when payment is done
//       print(data.toString());
//       // Displaying snackbar for it
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Paid successfully")),
//       );
//       paymentIntent = null;
//     } on StripeException catch (e) {
//       // If any error comes during payment
//       // so payment will be cancelled
//       print('Error: $e');

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text(" Payment Cancelled")),
//       );
//     } catch (e) {
//       print("Error in displaying");
//       print('$e');
//     }
//   }

//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': ((int.parse(amount)) * 100).toString(),
//         'currency': currency,
//         'payment_method_types[]': 'card',
//       };

//       var secretKey = dotenv.env['secretKey'] ?? '';
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer $secretKey',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       print('Payment Intent Body: ${response.body.toString()}');
//       return jsonDecode(response.body.toString());
//     } catch (err) {
//       print('Error charging user: ${err.toString()}');
//     }
//   }
// }
abstract class CheckoutRemoteDatasource {
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency);
}

class CheckoutRemoteDatasourceImpl extends CheckoutRemoteDatasource {
  @override
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': ((int.parse(amount))).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var secretKey = dotenv.env['secretKey'] ?? '';
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body.toString());
    } catch (e) {
      rethrow;
    }
  }
}
