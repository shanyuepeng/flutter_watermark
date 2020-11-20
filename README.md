# flutter_watermark

A new Flutter package project.

## flutter自定义水印，可控制水印大小，区域，颜色，数量，角度，排列方式等

## 效果
更多效果可以根据实际情况传入不同参数进行自定义

![在这里插入图片描述](https://app-test.obs.cn-east-2.myhuaweicloud.com:443/_143886_1605884309774_panzi-1605884259784#pic_center)

![在这里插入图片描述](https://app-test.obs.cn-east-2.myhuaweicloud.com:443/_180418_1605884387162_panzi-1605884337171#pic_center)

![在这里插入图片描述](https://app-test.obs.cn-east-2.myhuaweicloud.com:443/_334586_1605884455620_panzi-1605884405101#pic_center)

![在这里插入图片描述](https://app-test.obs.cn-east-2.myhuaweicloud.com:443/_103167_1605884517227_panzi-1605884467441#pic_center)

## 使用方法
使用Watermark包裹添加水印的区域

```javascript
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Watermark(
        text: '追忆单飞',
        overlapping: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
        ),
       ),
    );
  }
```

## 参数
 ![在这里插入图片描述](https://app-test.obs.cn-east-2.myhuaweicloud.com:443/_109395_1605884652033_panzi-1605884602036#pic_center)
