import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinPriceIndex extends StatefulWidget {
  @override
  _BitcoinPriceIndexState createState() => _BitcoinPriceIndexState();
}

class _BitcoinPriceIndexState extends State<BitcoinPriceIndex> {
  String _price = 'Fetching...';

  @override
  void initState() {
    super.initState();
    _fetchPrice();
  }

  Future<void> _fetchPrice() async {
    try {
      final response = await http.get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _price = data['bpi']['USD']['rate'];
        });
      } else {
        setState(() {
          _price = 'Failed to fetch price';
        });
      }
    } catch (e) {
      setState(() {
        _price = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Price Index'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bitcoin Price (USD):',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              _price,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
