import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart ' as http;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency =currenciesList[0];
  var price1;
  var price2;
  var price3;


  String currency= 'AUD';
  @override
  void initState() {

    super.initState();
    getPrice();
  }
  

  void getPrice()async {

    var data = await NetworkHelper(currency: currency).getData();
    setState((){
      price1=data[0].toStringAsFixed(3);
      price2=data[1].toStringAsFixed(3);
      price3=data[2].toStringAsFixed(3);
    });
    //print(price);
  }

  List<Text> getDropDownItems(){
    List<Text> dropDownItem=[];

    for(String currency in currenciesList){
      dropDownItem.add(Text(currency));
    }
    return dropDownItem;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              cards(price: price1, currency: currency,coin: cryptoList[0],),
              cards(price: price2, currency: currency, coin: cryptoList[1]),
              cards(price: price3, currency: currency, coin: cryptoList[2]),
            ],
          ),


          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 33,
              children: getDropDownItems(),
              onSelectedItemChanged: (selectedIndex) {
                 setState(() {
                   currency=currenciesList[selectedIndex];
                   getPrice();
                   print(currency);
                 });
              },
            )
          ),
        ],
      ),
    );
  }
}

class cards extends StatelessWidget {
  const cards({
    Key key,
    @required this.price,
    @required this.currency,
    @required this.coin,
  }) : super(key: key);

  final price;
  final String currency;
  final String coin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(

            '1 $coin = $price $currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// DropdownButton<String>(
// value: currentCurrency,
// items: getDropDownItems(),
// onChanged:(value){
// setState(() {
// currentCurrency=value;
// });
//
// },
// //value: currentCurrency,
// ),