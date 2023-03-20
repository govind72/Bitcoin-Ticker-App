import 'package:http/http.dart ' as http;
import 'dart:convert';

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = ' B9830147-711F-4019-B722-5A70B15D7E28';
// https://rest.coinapi.io/v1/exchangerate/BTC/<Currency>?apikey=YOUR_API_KEY
class NetworkHelper{
  final String currency;

  NetworkHelper({this.currency});

  Future<List>getData() async{
    http.Response response1 = await http.get(Uri.parse('$coinAPIURL/BTC/$currency?apikey=$apiKey'));
    http.Response response2 = await http.get(Uri.parse('$coinAPIURL/ETH/$currency?apikey=$apiKey'));
    http.Response response3 = await http.get(Uri.parse('$coinAPIURL/LTC/$currency?apikey=$apiKey'));
    List coinPrice =[];
    if(response1.statusCode==200) {
      var data = jsonDecode(response1.body);
      var price =data['rate'];
      coinPrice.add(price);
    }

    else{  coinPrice.add(-1);
    }    if(response2.statusCode==200) {
      var data = jsonDecode(response2.body);
      var price =data['rate'];
      coinPrice.add(price);
    }

    else{  coinPrice.add(-1);
    }    if(response3.statusCode==200) {
      var data = jsonDecode(response3.body);
      var price =data['rate'];
      coinPrice.add(price);
    }

    else{  coinPrice.add(-1);
    }
    return coinPrice;
  }


}




const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {}
