import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

const Widget _sizeBox = SizedBox();
const Color _color = Color.fromRGBO(133, 133, 133, .1);
const Color _auxiliaryColor = Color.fromRGBO(133, 133, 133, .1);
enum Angle {
  minusThirtyDegrees,
  minusFortyFiveDegrees,
  minusSixtyDegrees,
  thirtyDegrees,
  fortyFiveDegrees,
  sixtyDegrees,
  zero,
}

class Watermark extends StatefulWidget {
  final Widget child; //要包裹的区域
  final double top; //定位
  final double left; //定位
  final double right; //定位
  final double bottom; //定位
  final int number; //水印数量
  final String text; //水印文字1
  final String auxiliaryText; //水印文字2
  final double fontSize; //字体大小
  final bool bold; //水印字体加粗
  final Color color; //水印文字1颜色
  final Color auxiliaryColor; //水印文字2颜色
  final Angle angle; //水印角度
  final bool randomSize; //随机大小
  final bool randomAngle; //随机颜色
  final double margin; //边距，控制水印疏密
  final bool overlapping; //交叉排列，默认矩阵排列

  Watermark(
      {Key key,
      this.child = _sizeBox,
      this.top = 0.0,
      this.left = 0.0,
      this.right = 0.0,
      this.bottom = 0.0,
      this.number = 300,
      this.text = '',
      this.auxiliaryText = '',
      this.fontSize = 12.0,
      this.color = _color,
      this.auxiliaryColor = _auxiliaryColor,
      this.bold = true,
      this.angle = Angle.minusThirtyDegrees,
      this.randomSize = false,
      this.randomAngle = false,
      this.margin = 0.0,
      this.overlapping = false
      })
      : super(key: key);
  @override
  _WatermarkState createState() => _WatermarkState();
}

class _WatermarkState extends State<Watermark> {
  double _angle;
  List _fontSize = [10.0, 12.0, 14.0, 16.0, 8.0, 10.0, 12.0, 14.0, 16.0, 8.0];

  @override
  void initState() {
    super.initState();
    _initAngle();
    
  }

  void _initAngle(){
    switch (widget.angle) {
      case Angle.minusThirtyDegrees:
        _angle = -math.pi / 6;
        break;
      case Angle.fortyFiveDegrees:
        _angle = -math.pi / 4;
        break;
      case Angle.minusSixtyDegrees:
        _angle = -math.pi / 3;
        break;
      case Angle.thirtyDegrees:
        _angle = math.pi / 6;
        break;
      case Angle.fortyFiveDegrees:
        _angle = math.pi / 4;
        break;
      case Angle.sixtyDegrees:
        _angle = math.pi / 3;
        break;
        case Angle.zero:
        _angle = 0;
        break;
      default:
        _angle = -math.pi / 6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Positioned(
          top: widget.top,
          left: widget.left,
          right: widget.right,
          bottom: widget.bottom,
          child: IgnorePointer(
            child: Container(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < widget.number; i++)
                    Transform.rotate(
                      angle: widget.randomAngle?(Random().nextBool()? -math.pi / (Random().nextBool() ? 6 : 20): math.pi / (Random().nextBool() ? 6 : 20)):_angle,
                      child: widget.overlapping?
                      Container(
                        width: MediaQuery.of(context).size.width/5,
                        margin: EdgeInsets.all(widget.margin),
                        padding: const EdgeInsets.fromLTRB(10, 12, 10, 45),
                        color: Colors.transparent,
                        child: Text(
                          
                          i % 2 == 0 ? widget.text : (widget.auxiliaryText.isEmpty?widget.text:widget.auxiliaryText),
                          style: TextStyle(
                              fontWeight: widget.bold
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.randomSize?_fontSize[Random().nextInt(10)]:widget.fontSize,
                              color: widget.overlapping?(i%2==1?widget.color:Colors.transparent) :( i % 2 == 0
                                  ? widget.color
                                  : (widget.auxiliaryColor ==_auxiliaryColor?widget.color:widget.auxiliaryColor)),
                              decoration: TextDecoration.none),
                        ),
                      )
                      : Container(
                        
                        margin: EdgeInsets.all(widget.margin),
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 45),
                        color: Colors.transparent,
                        child: Text(
                          i % 2 == 0 ? widget.text : (widget.auxiliaryText.isEmpty?widget.text:widget.auxiliaryText),
                          style: TextStyle(
                              fontWeight: widget.bold
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: widget.randomSize?_fontSize[Random().nextInt(10)]:widget.fontSize,
                              color: i % 2 == 0
                                  ? widget.color
                                  : (widget.auxiliaryColor ==_auxiliaryColor?widget.color:widget.auxiliaryColor),
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
