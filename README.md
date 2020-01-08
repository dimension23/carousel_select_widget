# Carousel Select Widget

An iOS style alternative to dropdown value picker with horizontal and vertical scroll mode.

## Getting Started

To use this package, add `carousel_select_widget` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

## Example

Import the library.

```
import 'package:carousel_select_widget/carousel_select_widget.dart';
```

Then invoke the `CarouselSelect` constructor with appropriate properties to display the widget.

## Sample Code

```
import 'package:flutter/material.dart';
import 'package:carousel_select_widget/carousel_select_widget.dart';

void main() => runApp(CarouselSelectWidgetSample());

const List<String> kCurrenciesList = ['AUD', 'BRL', 'CAD', 'CNY', 'EUR', 'GBP', 'HKD', 'IDR', 'ILS', 'INR'];
const int kInitialPositionIndex = 0;
const Color kDarkBackgroundColor = Color(0xFF111428);
const Color kTurquoiseColor = Color(0xFF1abc9c);
const Color kMidnightBlue = Color(0xFF2c3e50);
const Color kActiveItemTextColor = Color(0xFF9b59b6);
const double kActiveItemFontSize = 20;
const double kPassiveItemFontSize = 20;
const double kHorizontalWidgetSize = 100.0;
const double kVerticalWidgetSize = 200.0;

class CarouselSelectWidgetSample extends StatefulWidget {
  @override
  _CarouselSelectWidgetSampleState createState() => _CarouselSelectWidgetSampleState();
}

class _CarouselSelectWidgetSampleState extends State<CarouselSelectWidgetSample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kDarkBackgroundColor,
        appBar: AppBar(
          title: Center(
            child: Text('Carousel Select Widget Example',)
            ),
          backgroundColor: kDarkBackgroundColor,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            child: CarouselSelect(
              onChanged: (selectedValue) {print(selectedValue);},
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
            ),
          ),
        ),
      );
    }
}
```

## Sample App

Refer to example folder.

## Known Issue

* Using both horizontal and vertical scroll direction on the same page causes glitch in horizontal widget.

## Credits

This minimal version of widget is inspired from beautifully designed 'horizontal_picker' widget by [kaiserleka](https://pub.dev/packages/horizontal_picker)