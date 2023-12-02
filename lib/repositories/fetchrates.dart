import 'dart:convert';

import 'package:convertisseur/utils/key.dart';
import 'package:http/http.dart' as http;

class RateRepository {
  Future fetchRates(String from, String to, double amount) async {
    final response = await http.get(Uri.parse(
        "https://api.currencyapi.com/v3/latest?apikey=$key&base_currency=$from&currencies=$to"));
    if (response.statusCode == 200) {
      final rate = jsonDecode(response.body)['data'][to]['value'];
      return (rate * amount);
    } else {
      throw Exception('Failed to load rate');
    }
  }
}
