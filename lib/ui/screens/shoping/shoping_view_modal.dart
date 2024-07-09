import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:http/http.dart' as http;

import 'package:e_commerece_clon/provider/card_item_provider.dart';

class ShapingViewModel extends ChangeNotifier {
  final CFPaymentGatewayService cfPaymentGatewayService =
      CFPaymentGatewayService();
  CFEnvironment environment = CFEnvironment.SANDBOX;
  String cf_order_id = '';
  BuildContext? _context;

  ShapingViewModel() {
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  void verifyPayment(String orderId) {
    print("Payment Successful");
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(content: Text("Payment Successful for order: $orderId")),
      );
    }
    // Additional logic for successful payment
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    print("Error while making payment $orderId: ${errorResponse.getMessage()}");
    if (_context != null) {
      ScaffoldMessenger.of(_context!).showSnackBar(
        SnackBar(content: Text("Payment Failed for order: $orderId")),
      );
    }
    // Additional logic for payment error
  }

  Future<void> pay(CartProvider cartProvider) async {
    final payableAmount = cartProvider.total;
    final orderId = Random().nextInt(1000).toString();

    try {
      var sessionId = await getAccessToken(payableAmount, orderId);
      if (sessionId.isEmpty) {
        ScaffoldMessenger.of(_context!).showSnackBar(
          SnackBar(content: Text("Payment Failed error: 400, Bad Request")),
        );
        print("Failed to get access token");

        return;
      }

      var session = CFSessionBuilder()
          .setEnvironment(environment)
          .setOrderId(orderId)
          .setPaymentSessionId(sessionId)
          .build();

      List<CFPaymentModes> components = <CFPaymentModes>[
        CFPaymentModes.UPI,
        CFPaymentModes.CARD,
        CFPaymentModes.NETBANKING,
        CFPaymentModes.WALLET,
        CFPaymentModes.EMI,
        CFPaymentModes.PAYLATER,
      ];

      var paymentComponent =
          CFPaymentComponentBuilder().setComponents(components).build();

      var theme = CFThemeBuilder()
          .setNavigationBarBackgroundColorColor("#FF0000")
          .setPrimaryFont("Menlo")
          .setSecondaryFont("Futura")
          .build();

      var cfDropCheckoutPayment = CFDropCheckoutPaymentBuilder()
          .setSession(session)
          .setPaymentComponent(paymentComponent)
          .setTheme(theme)
          .build();

      cfPaymentGatewayService.doPayment(cfDropCheckoutPayment);
    } on CFException catch (e) {
      print("Error: ${e.message}");
    }
  }

  Future<String> getAccessToken(num amount, String orderId) async {
    try {
      final uri = Uri.parse("https://sandbox.cashfree.com/pg/orders");
      final headers = {
        'Content-Type': 'application/json',
        'x-client-id': "TEST1021250856bb0392d3bff379012680521201",
        'x-api-version': '2023-08-01',
        'x-client-secret':
            "cfsk_ma_test_71238110f8ebb6a9c8ee711560da0f42_7255766c",
      };
      final body = jsonEncode({
        "order_amount": amount,
        "order_currency": "INR",
        'order_id': orderId,
        "customer_details": {
          "customer_id": "USER123",
          "customer_name": "joe",
          "customer_email": "joe.s@cashfree.com",
          "customer_phone": "+919876543210"
        },
        "order_meta": {
          "return_url": "https://b8af79f41056.eu.ngrok.io?order_id=$orderId",
        }
      });

      final res = await http.post(uri, headers: headers, body: body);

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);
        if (jsonResponse['order_status'] == 'ACTIVE') {
          cf_order_id = jsonResponse['cf_order_id'];
          return jsonResponse['payment_session_id'];
        } else {
          print("Error response: ${jsonResponse.toString()}");
        }
      } else {
        print("HTTP error: ${res.statusCode}, ${res.reasonPhrase}");
      }
    } catch (e) {
      print("Exception: $e");
    }

    return '';
  }

  Future<String> getAccessTokenPro(num amount, String orderId) async {
    try {
      final uri = Uri.parse("https://api.cashfree.com/pg/orders");
      final headers = {
        'Content-Type': 'application/json',
        'x-client-id': "66800004b8615ebd012c1fba70000866",
        'x-api-version': '2023-08-01',
        'x-client-secret':
            "cfsk_ma_prod_09423c61449b22ca2750debc94640c58_25da1987",
      };
      final body = jsonEncode({
        "order_amount": amount,
        "order_currency": "INR",
        'order_id': orderId,
        "customer_details": {
          "customer_id": "USER123",
          "customer_name": "joe",
          "customer_email": "joe.s@cashfree.com",
          "customer_phone": "+919876543210"
        },
        "order_meta": {
          "return_url": "https://b8af79f41056.eu.ngrok.io?order_id=$orderId",
        }
      });

      final res = await http.post(uri, headers: headers, body: body);

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);
        if (jsonResponse['order_status'] == 'ACTIVE') {
          return jsonResponse['payment_session_id'];
        } else {
          print("Error response: ${jsonResponse.toString()}");
        }
      } else {
        print("HTTP error: ${res.statusCode}, ${res.reasonPhrase}");
      }
    } catch (e) {
      print("Exception: $e");
    }

    return '';
  }
}
