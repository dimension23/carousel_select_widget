import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum InitialPosition {start, center, end}
enum ScrollDirection {horizontal, vertical}
int _listRotation;
int _listItemRotation;

class CarouselSelect extends StatefulWidget {
  // properties
  final Function(String) onChanged;
  final InitialPosition initialPosition;
  final ScrollDirection scrollDirection;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final double activeItemFontSize;
  final double passiveItemFontSize;
  final List<String> valueList;
  final double height;

  // contructor
  CarouselSelect(
      {@required this.valueList,
        @required this.onChanged,
        this.initialPosition = InitialPosition.center,
        @required this.scrollDirection,
        this.backgroundColor = Colors.white,
        this.showCursor = true,
        this.cursorColor = Colors.red,
        this.activeItemTextColor = Colors.blue,
        this.passiveItemsTextColor = Colors.grey,
        this.activeItemFontSize = 20.0,
        this.passiveItemFontSize = 20.0,
        this.height = 100.0})
      : assert(onChanged != null);

  @override
  _CarouselSelectState createState() => _CarouselSelectState();
}

class _CarouselSelectState extends State<CarouselSelect> {
  // similar to scrollcontroller but with added mechanism to stop and read the given indices
  FixedExtentScrollController _scrollController;

  // to store value, fontsize, and color of the text in the picker
  List<Map> valueMap = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i <= widget.valueList.length - 1; i++) {
      valueMap.add({
        "value": widget.valueList[i],
        "fontSize": widget.passiveItemFontSize,
        "color": widget.passiveItemsTextColor,
      });
    }
    setScrollController();
  }

  setScrollController() {
    //sets initial scroll positon - start, end, or center

    int initialItem;
    switch (widget.initialPosition) {
      case InitialPosition.start:
        initialItem = 0;
        break;
      case InitialPosition.center:
        initialItem = (valueMap.length ~/ 2);
        break;
      case InitialPosition.end:
        initialItem = valueMap.length - 1;
        break;
    }

    // sets the selector to initial posti
    _scrollController = FixedExtentScrollController(initialItem: initialItem);

    // applies active style to initial selected item
    valueMap[initialItem]["color"] = widget.activeItemTextColor;
    valueMap[initialItem]["fontSize"] = widget.activeItemFontSize;
  }


  @override
  Widget build(BuildContext context) {
    int curItem;

    switch (widget.scrollDirection) {
      case ScrollDirection.horizontal:
        _listRotation = 3;
        _listItemRotation = 1;
        break;
      case ScrollDirection.vertical:
        _listRotation = 2;
        _listItemRotation = 2;
        break;
    }

    return Container(
      height: widget.height,
      width: double.infinity,
      alignment: Alignment.center,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: RotatedBox(
          quarterTurns: _listRotation,
          child: ListWheelScrollView(
              controller: _scrollController,
              itemExtent: 60,
              onSelectedItemChanged: (item) {
                curItem = item;
                setState(() {
                  widget.onChanged(valueMap[curItem]["value"]);
                  for (var i = 0; i < valueMap.length; i++) {
                    if (i == curItem) {
                      valueMap[curItem]["color"] = widget.activeItemTextColor;
                      valueMap[curItem]["fontSize"] = widget.activeItemFontSize;
                    } else {
                      valueMap[i]["color"] = widget.passiveItemsTextColor;
                      valueMap[i]["fontSize"] = widget.passiveItemFontSize;
                    }
                  }
                });
              },
              children: valueMap.map((Map curValue) {
                return ItemWidget(
                  curValue,
                  widget.backgroundColor,
                );
              }).toList()),
        ),
      ),
    );
  }
}

class ItemWidget extends StatefulWidget {

  final Map curItem;
  final Color backgroundColor;
  ItemWidget(this.curItem, this.backgroundColor);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  String textParts;
  @override
  void initState() {
    super.initState();
    var mtext = widget.curItem["value"];
    textParts = mtext;
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: _listItemRotation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            textParts,
            style: TextStyle(
                fontSize: widget.curItem["fontSize"],
                color: widget.curItem["color"]),
            textAlign: TextAlign.center,
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
