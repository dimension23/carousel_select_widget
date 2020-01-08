import 'package:flutter/material.dart';
import 'package:carousel_select_widget/carousel_select_widget.dart';

const List<String> kCurrenciesList = [
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

const List<String> kCryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const int kInitialPositionIndex = 0;
const Color kDarkBackgroundColor = Color(0xFF111428);
const Color kTurquoiseColor = Color(0xFF1abc9c);
const Color kMidnightBlue = Color(0xFF2c3e50);
const Color kActiveItemTextColor = Color(0xFF9b59b6);
const double kActiveItemFontSize = 20;
const double kPassiveItemFontSize = 20;
const double kHorizontalWidgetSize = 100.0;
const double kVerticalWidgetSize = 200.0;
const String kFontFamily = 'Montserrat';

void main() => runApp(CarouselSelectWidgetExample());

class CarouselSelectWidgetExample extends StatefulWidget {
  @override
  _CarouselSelectWidgetExampleState createState() =>
      _CarouselSelectWidgetExampleState();
}

class _CarouselSelectWidgetExampleState
    extends State<CarouselSelectWidgetExample> {
  
  String _hselectedCurrency = kCurrenciesList[kInitialPositionIndex];
  String _vselectedCurrency = kCryptoList[kInitialPositionIndex];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: kFontFamily),
      home: Scaffold(
        backgroundColor: kDarkBackgroundColor,
        appBar: AppBar(
          title: Center(child: Text('Carousel Select Widget Example',)),
          backgroundColor: kDarkBackgroundColor,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(_hselectedCurrency, style: TextStyle(fontSize: 50, color: kTurquoiseColor),),
                Text(_vselectedCurrency, style: TextStyle(fontSize: 50, color: kTurquoiseColor),),
              ],
            ),
            Divider(indent: 50.0, endIndent: 50.0, color: kMidnightBlue,),
            Text('HORIZONTAL CAROUSEL SELECT'),
            CarouselSelect(
              onChanged: (value) {
                setState(() {
                  _hselectedCurrency = value;
                });
              },
              valueList: kCurrenciesList,
              backgroundColor: kDarkBackgroundColor,
              activeItemTextColor: kActiveItemTextColor,
              passiveItemsTextColor: kActiveItemTextColor.withOpacity(0.3),
              initialPosition: kInitialPositionIndex,
              scrollDirection: ScrollDirection.horizontal,
              activeItemFontSize: kActiveItemFontSize,
              passiveItemFontSize: kPassiveItemFontSize,
              height: kHorizontalWidgetSize,
            ),
            Divider(indent: 50.0, endIndent: 50.0, color: kMidnightBlue,),
            Text('VERTICAL CAROUSEL SELECT'),
            CarouselSelect(
              onChanged: (value) {
                setState(() {
                  _vselectedCurrency = value;
                });
              },
              valueList: kCryptoList,
              backgroundColor: kDarkBackgroundColor,
              activeItemTextColor: kActiveItemTextColor,
              passiveItemsTextColor: kActiveItemTextColor.withOpacity(0.3),
              initialPosition: kInitialPositionIndex,
              scrollDirection: ScrollDirection.vertical,
              activeItemFontSize: kActiveItemFontSize,
              passiveItemFontSize: kPassiveItemFontSize,
              height: kVerticalWidgetSize,
            ),
            Text('CRAFTED WITH ❤️ IN FLUTTER', style: TextStyle(fontSize: 10.0), )            
          ],
        ),
      ),
    );
  }
}
