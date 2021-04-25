// /*
// import 'dart:async';
//
// import 'package:carousel_slider/utils.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial_example/main.dart';
//
// */
// /*
// class ImageSlider extends StatefulWidget {
//   @override
//   _ImageSliderState createState() => _ImageSliderState();
// }
//
// class _ImageSliderState extends State<ImageSlider> with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   List animatedText=["seerat","Afreen", "Saif"];
//
//   @override
//   void initState() {
//     _controller = AnimationController(vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: SizeConfig.screenWidth,
//         height: SizeConfig.screenHeight,
//         child: Center(
//           child: ListView.builder(
//             controller: ,
//             scrollDirection: Axis.horizontal,
//             itemExtent: 250,
//            itemCount: animatedText.length,
//             itemBuilder: (context, snapshot){
//              return Card(
//                color: Colors.pinkAccent,
//              );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
// *//*
//
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];
//
//
// */
// /*class CarouselDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         initialRoute: '/',
//         routes: {
//           '/': (ctx) => CarouselDemoHome(),
//           '/basic': (ctx) => BasicDemo(),
//           '/nocenter': (ctx) => NoCenterDemo(),
//           '/image': (ctx) => ImageSliderDemo(),
//           '/complicated': (ctx) => ComplicatedImageDemo(),
//           '/enlarge': (ctx) => EnlargeStrategyDemo(),
//           '/manual': (ctx) => ManuallyControlledSlider(),
//           '/noloop': (ctx) => NoonLoopingDemo(),
//           '/vertical': (ctx) => VerticalSliderDemo(),
//           '/fullscreen': (ctx) => FullscreenSliderDemo(),
//           '/ondemand': (ctx) => OnDemandCarouselDemo(),
//           '/indicator': (ctx) => CarouselWithIndicatorDemo(),
//           '/prefetch': (ctx) => PrefetchImageDemo(),
//           '/reason': (ctx) => CarouselChangeReasonDemo(),
//           '/position': (ctx) => KeepPageviewPositionDemo(),
//           '/multiple': (ctx) => MultipleItemDemo(),
//         }
//     );
//   }
// }
//
// class DemoItem extends StatelessWidget {
//   final String title;
//   final String route;
//   DemoItem(this.title, this.route);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//     );
//   }
// }
//
// class CarouselDemoHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Carousel demo'),),
//       body: ListView(
//         children: <Widget>[
//           DemoItem('Basic demo', '/basic'),
//           DemoItem('No center mode demo', '/nocenter'),
//           DemoItem('Image carousel slider', '/image'),
//           DemoItem('More complicated image slider', '/complicated'),
//           DemoItem('Enlarge strategy demo slider', '/enlarge'),
//           DemoItem('Manually controlled slider', '/manual'),
//           DemoItem('Noon-looping carousel slider', '/noloop'),
//           DemoItem('Vertical carousel slider', '/vertical'),
//           DemoItem('Fullscreen carousel slider', '/fullscreen'),
//           DemoItem('Carousel with indicator demo', '/indicator'),
//           DemoItem('On-demand carousel slider', '/ondemand'),
//           DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
//           DemoItem('Carousel change reason demo', '/reason'),
//           DemoItem('Keep pageview position demo', '/position'),
//           DemoItem('Multiple item in one screen demo', '/multiple'),
//         ],
//       ),
//     );
//   }
// }
//
// class BasicDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<int> list = [1,2,3,4,5];
//     return Scaffold(
//       appBar: AppBar(title: Text('Basic demo')),
//       body: Container(
//           child: CarouselSlider(
//             options: CarouselOptions(),
//             items: list.map((item) => Container(
//               child: Center(
//                   child: Text(item.toString())
//               ),
//               color: Colors.green,
//             )).toList(),
//           )
//       ),
//     );
//   }
// }
//
// class NoCenterDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<int> list = [1,2,3,4,5];
//     return Scaffold(
//       appBar: AppBar(title: Text('Basic demo')),
//       body: Container(
//           child: CarouselSlider(
//             options: CarouselOptions(
//               disableCenter: true,
//             ),
//             items: list.map((item) => Container(
//               child: Text(item.toString()),
//               color: Colors.green,
//             )).toList(),
//           )
//       ),
//     );
//   }
// }
//
// class ImageSliderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Image slider demo')),
//       body: Container(
//           child: CarouselSlider(
//             options: CarouselOptions(),
//             items: imgList.map((item) => Container(
//               child: Center(
//                   child: Image.network(item, fit: BoxFit.cover, width: 1000)
//               ),
//             )).toList(),
//           )
//       ),
//     );
//   }
// }
//
// final List<Widget> imageSliders = imgList.map((item) => Container(
//   child: Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(5.0)),
//         child: Stack(
//           children: <Widget>[
//             Image.network(item, fit: BoxFit.cover, width: 1000.0),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(200, 0, 0, 0),
//                       Color.fromARGB(0, 0, 0, 0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   'No. ${imgList.indexOf(item)} image',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//     ),
//   ),
// )).toList();*//*
//
//
// */
// /*class ComplicatedImageDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Complicated image slider demo')),
//       body: Container(
//           child: Column(children: <Widget>[
//             CarouselSlider(
//               options: CarouselOptions(
//                 autoPlay: true,
//                 aspectRatio: 2.0,
//                 enlargeCenterPage: true,
//               ),
//               items: imageSliders,
//             ),
//           ],)
//       ),
//     );
//   }
// }*/
//
// class CarouselSlider extends StatefulWidget {
//   /// [CarouselOptions] to create a [CarouselState] with
//   ///
//   /// This property must not be null
//   final CarouselOptions options;
//
//   /// The widgets to be shown in the carousel of default constructor
//   final List<Widget> items;
//
//   /// The widget item builder that will be used to build item on demand
//   /// The third argument is the PageView's real index, can be used to cooperate
//   /// with Hero.
//   final ExtendedIndexedWidgetBuilder itemBuilder;
//
//   /// A [MapController], used to control the map.
//   final CarouselControllerImpl _carouselController;
//
//   final int itemCount;
//
//   CarouselSlider(
//       {@required this.items,
//         @required this.options,
//         carouselController,
//         Key key})
//       : itemBuilder = null,
//         itemCount = items != null ? items.length : 0,
//         _carouselController = carouselController ?? CarouselController(),
//         super(key: key);
//
//   /// The on demand item builder constructor
//   CarouselSlider.builder(
//       {@required this.itemCount,
//         @required this.itemBuilder,
//         @required this.options,
//         carouselController,
//         Key key})
//       : items = null,
//         _carouselController = carouselController ?? CarouselController(),
//         super(key: key);
//
//   @override
//   CarouselSliderState createState() => CarouselSliderState(_carouselController);
// }
//
// class CarouselSliderState extends State<CarouselSlider>
//     with TickerProviderStateMixin {
//   final CarouselControllerImpl carouselController;
//   Timer timer;
//
//   CarouselOptions get options => widget.options ?? CarouselOptions();
//
//   CarouselState carouselState;
//
//   PageController pageController;
//
//   /// mode is related to why the page is being changed
//   CarouselPageChangedReason mode = CarouselPageChangedReason.controller;
//
//   CarouselSliderState(this.carouselController);
//
//   void changeMode(CarouselPageChangedReason _mode) {
//     mode = _mode;
//   }
//
//   @override
//   void didUpdateWidget(CarouselSlider oldWidget) {
//     carouselState.options = options;
//     carouselState.itemCount = widget.itemCount;
//
//     // pageController needs to be re-initialized to respond to state changes
//     pageController = PageController(
//       viewportFraction: options.viewportFraction,
//       initialPage: carouselState.realPage,
//     );
//     carouselState.pageController = pageController;
//
//     // handle autoplay when state changes
//     handleAutoPlay();
//
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     carouselState =
//         CarouselState(this.options, clearTimer, resumeTimer, this.changeMode);
//
//     carouselState.itemCount = widget.itemCount;
//     carouselController.state = carouselState;
//     carouselState.initialPage = widget.options.initialPage;
//     carouselState.realPage = options.enableInfiniteScroll
//         ? carouselState.realPage + carouselState.initialPage
//         : carouselState.initialPage;
//     handleAutoPlay();
//
//     pageController = PageController(
//       viewportFraction: options.viewportFraction,
//       initialPage: carouselState.realPage,
//     );
//
//     carouselState.pageController = pageController;
//   }
//
//   Timer getTimer() {
//     return widget.options.autoPlay
//         ? Timer.periodic(widget.options.autoPlayInterval, (_) {
//       final route = ModalRoute.of(context);
//       if (route?.isCurrent == false) {
//         return;
//       }
//
//       CarouselPageChangedReason previousReason = mode;
//       changeMode(CarouselPageChangedReason.timed);
//       int nextPage = carouselState.pageController.page.round() + 1;
//       int itemCount = widget.itemCount ?? widget.items.length;
//
//       if (nextPage >= itemCount &&
//           widget.options.enableInfiniteScroll == false) {
//         if (widget.options.pauseAutoPlayInFiniteScroll) {
//           clearTimer();
//           return;
//         }
//         nextPage = 0;
//       }
//
//       carouselState.pageController
//           .animateToPage(nextPage,
//           duration: widget.options.autoPlayAnimationDuration,
//           curve: widget.options.autoPlayCurve)
//           .then((_) => changeMode(previousReason));
//     })
//         : null;
//   }
//
//   void clearTimer() {
//     if (timer != null) {
//       timer?.cancel();
//       timer = null;
//     }
//   }
//
//   void resumeTimer() {
//     if (timer == null) {
//       timer = getTimer();
//     }
//   }
//
//   void handleAutoPlay() {
//     bool autoPlayEnabled = widget.options.autoPlay;
//
//     if (autoPlayEnabled && timer != null) return;
//
//     clearTimer();
//     if (autoPlayEnabled) {
//       resumeTimer();
//     }
//   }
//
//   Widget getGestureWrapper(Widget child) {
//     Widget wrapper;
//     if (widget.options.height != null) {
//       wrapper = Container(height: widget.options.height, child: child);
//     } else {
//       wrapper =
//           AspectRatio(aspectRatio: widget.options.aspectRatio, child: child);
//     }
//
//     return RawGestureDetector(
//       gestures: {
//         _MultipleGestureRecognizer:
//         GestureRecognizerFactoryWithHandlers<_MultipleGestureRecognizer>(
//                 () => _MultipleGestureRecognizer(),
//                 (_MultipleGestureRecognizer instance) {
//               instance.onStart = (_) {
//                 onStart();
//               };
//               instance.onDown = (_) {
//                 onPanDown();
//               };
//               instance.onEnd = (_) {
//                 onPanUp();
//               };
//               instance.onCancel = () {
//                 onPanUp();
//               };
//             }),
//       },
//       child: NotificationListener(
//         onNotification: (notification) {
//           if (widget.options.onScrolled != null &&
//               notification is ScrollUpdateNotification) {
//             widget.options.onScrolled(carouselState.pageController.page);
//           }
//           return false;
//         },
//         child: wrapper,
//       ),
//     );
//   }
//
//   Widget getCenterWrapper(Widget child) {
//     if (widget.options.disableCenter) {
//       return Container(
//         child: child,
//       );
//     }
//     return Center(child: child);
//   }
//
//   Widget getEnlargeWrapper(Widget child,
//       {double width, double height, double scale}) {
//     if (widget.options.enlargeStrategy == CenterPageEnlargeStrategy.height) {
//       return SizedBox(child: child, width: width, height: height);
//     }
//     return Transform.scale(
//         scale: scale,
//         child: Container(child: child, width: width, height: height));
//   }
//
//   void onStart() {
//     changeMode(CarouselPageChangedReason.manual);
//   }
//
//   void onPanDown() {
//     if (widget.options.pauseAutoPlayOnTouch) {
//       clearTimer();
//     }
//
//     changeMode(CarouselPageChangedReason.manual);
//   }
//
//   void onPanUp() {
//     if (widget.options.pauseAutoPlayOnTouch) {
//       resumeTimer();
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     clearTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return getGestureWrapper(PageView.builder(
//       physics: widget.options.scrollPhysics,
//       scrollDirection: widget.options.scrollDirection,
//       pageSnapping: widget.options.pageSnapping,
//       controller: carouselState.pageController,
//       reverse: widget.options.reverse,
//       itemCount: widget.options.enableInfiniteScroll ? null : widget.itemCount,
//       key: widget.options.pageViewKey,
//       onPageChanged: (int index) {
//         int currentPage = getRealIndex(index + carouselState.initialPage,
//             carouselState.realPage, widget.itemCount);
//         if (widget.options.onPageChanged != null) {
//           widget.options.onPageChanged(currentPage, mode);
//         }
//       },
//       itemBuilder: (BuildContext context, int idx) {
//         final int index = getRealIndex(idx + carouselState.initialPage,
//             carouselState.realPage, widget.itemCount);
//
//         return AnimatedBuilder(
//           animation: carouselState.pageController,
//           child: (widget.items != null)
//               ? (widget.items.length > 0 ? widget.items[index] : Container())
//               : widget.itemBuilder(context, index, idx),
//           builder: (BuildContext context, child) {
//             double distortionValue = 1.0;
//             // if `enlargeCenterPage` is true, we must calculate the carousel item's height
//             // to display the visual effect
//             if (widget.options.enlargeCenterPage != null &&
//                 widget.options.enlargeCenterPage == true) {
//               double itemOffset;
//               // pageController.page can only be accessed after the first build,
//               // so in the first build we calculate the itemoffset manually
//               try {
//                 itemOffset = carouselState.pageController.page - idx;
//               } catch (e) {
//                 BuildContext storageContext = carouselState
//                     .pageController.position.context.storageContext;
//                 final double previousSavedPosition =
//                 PageStorage.of(storageContext)?.readState(storageContext)
//                 as double;
//                 if (previousSavedPosition != null) {
//                   itemOffset = previousSavedPosition - idx.toDouble();
//                 } else {
//                   itemOffset =
//                       carouselState.realPage.toDouble() - idx.toDouble();
//                 }
//               }
//               final distortionRatio =
//               (1 - (itemOffset.abs() * 0.3)).clamp(0.0, 1.0);
//               distortionValue = Curves.easeOut.transform(distortionRatio);
//             }
//
//             final double height = widget.options.height ??
//                 MediaQuery.of(context).size.width *
//                     (1 / widget.options.aspectRatio);
//
//             if (widget.options.scrollDirection == Axis.horizontal) {
//               return getCenterWrapper(getEnlargeWrapper(child,
//                   height: distortionValue * height, scale: distortionValue));
//             } else {
//               return getCenterWrapper(getEnlargeWrapper(child,
//                   width: distortionValue * MediaQuery.of(context).size.width,
//                   scale: distortionValue));
//             }
//           },
//         );
//       },
//     ));
//   }
// }
// class _MultipleGestureRecognizer extends PanGestureRecognizer {}
//
//
// /*
// class EnlargeStrategyDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Complicated image slider demo')),
//       body: Container(
//           child: Column(children: <Widget>[
//             CarouselSlider(
//               options: CarouselOptions(
//                 autoPlay: true,
//                 aspectRatio: 2.0,
//                 enlargeCenterPage: true,
//                 enlargeStrategy: CenterPageEnlargeStrategy.height,
//               ),
//               items: imageSliders,
//             ),
//           ],)
//       ),
//     );
//   }
// }
//
// class ManuallyControlledSlider extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ManuallyControlledSliderState();
//   }
// }
//
// class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
//   final CarouselController _controller = CarouselController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Manually controlled slider')),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               CarouselSlider(
//                 items: imageSliders,
//                 options: CarouselOptions(enlargeCenterPage: true, height: 200),
//                 carouselController: _controller,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Flexible(
//                     child: RaisedButton(
//                       onPressed: () => _controller.previousPage(),
//                       child: Text('←'),
//                     ),
//                   ),
//                   Flexible(
//                     child: RaisedButton(
//                       onPressed: () => _controller.nextPage(),
//                       child: Text('→'),
//                     ),
//                   ),
//                   ...Iterable<int>.generate(imgList.length).map(
//                         (int pageIndex) => Flexible(
//                       child: RaisedButton(
//                         onPressed: () => _controller.animateToPage(pageIndex),
//                         child: Text("$pageIndex"),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         )
//     );
//   }
// }
//
// class NoonLoopingDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Noon-looping carousel demo')),
//       body: Container(
//           child: CarouselSlider(
//             options: CarouselOptions(
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//               enableInfiniteScroll: false,
//               initialPage: 2,
//               autoPlay: true,
//             ),
//             items: imageSliders,
//           )
//       ),
//     );
//   }
// }
//
// class VerticalSliderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Vertical sliding carousel demo')),
//       body: Container(
//           child: CarouselSlider(
//             options: CarouselOptions(
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//               scrollDirection: Axis.vertical,
//               autoPlay: true,
//             ),
//             items: imageSliders,
//           )
//       ),
//     );
//   }
// }
//
// class FullscreenSliderDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
//       body: Builder(
//         builder: (context) {
//           final double height = MediaQuery.of(context).size.height;
//           return CarouselSlider(
//             options: CarouselOptions(
//               height: height,
//               viewportFraction: 1.0,
//               enlargeCenterPage: false,
//               // autoPlay: false,
//             ),
//             items: imgList.map((item) => Container(
//               child: Center(
//                   child: Image.network(item, fit: BoxFit.cover, height: height,)
//               ),
//             )).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class OnDemandCarouselDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('On-demand carousel demo')),
//       body: Container(
//           child: CarouselSlider.builder(
//             itemCount: 100,
//             options: CarouselOptions(
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//               autoPlay: true,
//             ),
//             itemBuilder: (ctx, index, realIdx) {
//               return Container(
//                 child: Text(index.toString()),
//               );
//             },
//           )
//       ),
//     );
//   }
// }
//
// class CarouselWithIndicatorDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _CarouselWithIndicatorState();
//   }
// }
//
// class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
//   int _current = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Carousel with indicator demo')),
//       body: Column(
//           children: [
//             CarouselSlider(
//               items: imageSliders,
//               options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 2.0,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _current = index;
//                     });
//                   }
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: imgList.map((url) {
//                 int index = imgList.indexOf(url);
//                 return Container(
//                   width: 8.0,
//                   height: 8.0,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: _current == index
//                         ? Color.fromRGBO(0, 0, 0, 0.9)
//                         : Color.fromRGBO(0, 0, 0, 0.4),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ]
//       ),
//     );
//   }
// }
//
// class PrefetchImageDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _PrefetchImageDemoState();
//   }
// }
//
// class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
//   final List<String> images = [
//     'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
//     'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
//     'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
//     'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
//     'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
//     'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
//     'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
//   ];
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       images.forEach((imageUrl) {
//         precacheImage(NetworkImage(imageUrl), context);
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Prefetch image slider demo')),
//       body: Container(
//           child: CarouselSlider.builder(
//             itemCount: images.length,
//             options: CarouselOptions(
//               autoPlay: true,
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//             ),
//             itemBuilder: (context, index, realIdx) {
//               return Container(
//                 child: Center(
//                     child: Image.network(images[index], fit: BoxFit.cover, width: 1000)
//                 ),
//               );
//             },
//           )
//       ),
//     );
//   }
// }
//
// class CarouselChangeReasonDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _CarouselChangeReasonDemoState();
//   }
// }
//
// class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {
//   String reason = '';
//   final CarouselController _controller = CarouselController();
//
//   void onPageChange(int index, CarouselPageChangedReason changeReason) {
//     setState(() {
//       reason = changeReason.toString();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Change reason demo')),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               CarouselSlider(
//                 items: imageSliders,
//                 options: CarouselOptions(
//                   enlargeCenterPage: true,
//                   aspectRatio: 16/9,
//                   onPageChanged: onPageChange,
//                   autoPlay: true,
//                 ),
//                 carouselController: _controller,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Flexible(
//                     child: RaisedButton(
//                       onPressed: () => _controller.previousPage(),
//                       child: Text('←'),
//                     ),
//                   ),
//                   Flexible(
//                     child: RaisedButton(
//                       onPressed: () => _controller.nextPage(),
//                       child: Text('→'),
//                     ),
//                   ),
//                   ...Iterable<int>.generate(imgList.length).map(
//                         (int pageIndex) => Flexible(
//                       child: RaisedButton(
//                         onPressed: () => _controller.animateToPage(pageIndex),
//                         child: Text("$pageIndex"),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Center(
//                 child: Column(children: [
//                   Text('page change reason: '),
//                   Text(reason),
//                 ],),
//               )
//             ],
//           ),
//         )
//     );
//   }
// }
//
// class KeepPageviewPositionDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Keep pageview position demo')),
//       body: ListView.builder(itemBuilder: (ctx, index) {
//         if (index == 3) {
//           return Container(
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   aspectRatio: 2.0,
//                   enlargeCenterPage: true,
//                   pageViewKey: PageStorageKey<String>('carousel_slider'),
//                 ),
//                 items: imageSliders,
//               )
//           );
//         } else {
//           return Container(
//             margin: EdgeInsets.symmetric(vertical: 20),
//             color: Colors.blue,
//             height: 200,
//             child: Center(
//               child: Text('other content'),
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
//
// class MultipleItemDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Multiple item in one slide demo')),
//       body: Container(
//           child: CarouselSlider.builder(
//             options: CarouselOptions(
//               aspectRatio: 2.0,
//               enlargeCenterPage: false,
//               viewportFraction: 1,
//             ),
//             itemCount: (imgList.length / 2).round(),
//             itemBuilder: (context, index, realIdx) {
//               final int first = index * 2;
//               final int second = first + 1;
//               return Row(
//                 children: [first, second].map((idx) {
//                   return Expanded(
//                     flex: 1,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10),
//                       child: Image.network(imgList[idx], fit: BoxFit.cover),
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           )
//       ),
//     );
//   }
// }
// *//*
//

 import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_bluetooth_serial_example/AvailableSpeakers.dart';
import 'package:flutter_bluetooth_serial_example/ConnectionScreen.dart';
import 'package:flutter_bluetooth_serial_example/SpeakerJson.dart';
import 'package:flutter_bluetooth_serial_example/main.dart';
import 'package:flutter_bluetooth_serial_example/SplashScreen.dart';

import '../BluetoothDeviceListEntry.dart';
import 'BlueSlider.dart';


List images = ["bzoom.png","M7.jpg","Macron.png","bzoom.png","Macron.png","M7.jpg"];
PageController pageController;
bool connected= false;
String connectedInfo ;
bool loading = false;


 class ImageSlider extends StatefulWidget {
   @override
   _ImageSliderState createState() => _ImageSliderState();
 }
 
 class _ImageSliderState extends State<ImageSlider> with SingleTickerProviderStateMixin {


   double pageOffset = 0;
   double viewportFraction = 0.5;



/*
   final  scroll =  pageController.animateTo(5, duration: Duration(milliseconds: 2), curve: Curves.linear);
*/

   @override
  void initState() {
     pageController = PageController(initialPage: 0, viewportFraction: viewportFraction,)..addListener(() {
       setState(() {
         pageOffset = pageController.page;

       });
     });

    /* Timer(Duration(seconds: 5), (){
      setState(() {
         loading =true;
       });
     });*/



     // TODO: implement initState
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return Expanded(
       child: Container(
         child: AspectRatio(
           aspectRatio: 1,
           child: PageView.builder(
               controller: pageController ,
               itemCount: filteredList.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index){
                   BluetoothDiscoveryResult result =filteredList[index];
               /*  double scale = max(viewportFraction,
                     (1 - (pageOffset - index).abs()) + viewportFraction);

                 double angle = (pageOffset - index).abs();
                 if (angle > 0.5) {
                   angle = 1 - angle;
                 }*//// doesnot need it

                  return  Stack(
                     fit: StackFit.expand,
                     children: [
                       Transform(
                       transform: Matrix4.identity()
                     ..setEntry(
                       3,
                       3,
                       1/0.9,
                     )..setEntry(1, 1, viewportFraction)
                     ..setEntry(3, 0, 0.004 * (-index + pageOffset)),

                   alignment: Alignment(0.0, -0.5),
                       child: InkWell(
                         onTap: ()async{
                             try {
                               bool bonded = false;

                               /// Disconnect Device
                               if (result.device.isBonded) {
                                 print('Unbonding from ${result.device.address}...');

                                 await FlutterBluetoothSerial.instance
                                     .removeDeviceBondWithAddress(result.device.address);
                                 print('Unbonding from ${result.device.address} has succed');
                               }   //TODO  remove "Disconnect" functionality from here

                               /// Connect
                               else {
                                 print('Bonding with ${result.device.address}...');
                                 bonded = await FlutterBluetoothSerial.instance
                                     .bondDeviceAtAddress(result.device.address);
                                 print(
                                     'Bonding with ${result.device.address} has ${bonded ? 'succed' : 'failed'}.');
                                /* if(bonded!=false){*//// add navigator
                                   // return Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalPlay()));
                                 if(bonded!=false){
                                   setState(() {
                                     connected = true;
                                     connectedSpeakerImage = detectedSpeakersImagesList[index];
                                     connectedSpeakerName = result.device.name;


                                   });
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ConnectionScreen("Pairing\nSuccessful",
                                       Flexible(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             Flexible(
                                               flex: 2,
                                               child: Container(
                                                 decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     border:Border.all(color:Colors.transparent,width: 6)
                                                 ),
                                                 child: Image(image: detectedSpeakersImagesList[index],fit: BoxFit.contain,),
                                                 width: MediaQuery.of(context).size.width,
                                                 height: MediaQuery.of(context).size.height * 0.30,
                                               ),
                                             ),


                                             Text("${result.device.name}\nConnected".toUpperCase(),style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.5,fontWeight: FontWeight.w700 ),textAlign: TextAlign.center,)

                                           ],
                                         ),
                                       ),Image.asset(" assets/check.png",color: greenColor,))));
                                 }




                               }
                               setState(() {
                                 /// dont understand what actually happeneing here
                                 results[results.indexOf(result)] = BluetoothDiscoveryResult(
                                     device: BluetoothDevice(
                                       name: result.device.name ?? '',
                                       address: result.device.address,
                                       type: result.device.type,
                                       bondState: bonded
                                           ? BluetoothBondState.bonded
                                           : BluetoothBondState.none,
                                     ),
                                     rssi: result.rssi);
                                 filteredList[filteredList.indexOf(result)] = BluetoothDiscoveryResult(
                                     device: BluetoothDevice(
                                       name: result.device.name ?? '',
                                       address: result.device.address,
                                       type: result.device.type,
                                       bondState: bonded
                                           ? BluetoothBondState.bonded
                                           : BluetoothBondState.none,
                                     ),
                                     rssi: result.rssi);
                               });
                             } catch (ex) {
                               /*showDialog(
                                 context: context,
                                 builder: (BuildContext context) {
                                   return AlertDialog(
                                     title: const Text('Error occured while bonding'),
                                     content: Text("${ex.toString()}"),
                                     actions: <Widget>[
                                       new FlatButton(
                                         child: new Text("Close"),
                                         onPressed: () {
                                           Navigator.of(context).pop();
                                         },
                                       ),
                                     ],
                                   );
                                 },
                               );*/
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ConnectionScreen("Pairing Failed",
                                   Flexible(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         Flexible(
                                           flex: 2,
                                           child: Container(
                                             decoration: BoxDecoration(
                                                 shape: BoxShape.circle,
                                                 border:Border.all(color:Colors.red[700],width: 6)
                                             ),
                                             child: Image(image: detectedSpeakersImagesList[index],fit: BoxFit.contain,),
                                             width: MediaQuery.of(context).size.width,
                                             height: MediaQuery.of(context).size.height * 0.30,
                                           ),
                                         ),

                                         Icon(Icons.error, color: Colors.red[700],size: SizeConfig.screenHeight * 0.05,),
                                         Flexible(
                                           child: Container(
                                             padding: EdgeInsets.all(7),
                                             width: SizeConfig.screenWidth * 0.50,
                                             height: SizeConfig.screenHeight * 0.10,
                                             decoration: BoxDecoration(
                                               border: Border.all(color:Colors.grey[500]),
                                               color: Colors.grey[350],
                                               borderRadius: BorderRadius.circular(10),
                                             ),
                                             child: Center(child: Text("Make sure your device is\n\nturned on & ready to pair",style: TextStyle(fontWeight: FontWeight.bold),)),
                                           ),
                                         )
                                         ,
                                       ],
                                     ),
                                   ),Icon(Icons.search_outlined ,color: greenColor,size: 35,))));
                             }


                            /*
                             connectedInfo = "${images[index]}";*/
                             /*Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ConnectionScreen(connected?"Pairing\nSuccessful": "Pairing Failed",
                                 Flexible(
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Flexible(
                                         flex: 2,
                                        child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border:Border.all(color:connected?Colors.transparent:Colors.red[700],width: 6)
                                            ),
                                           child: Image(image: detectedSpeakersImagesList[index],fit: BoxFit.contain,),
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height * 0.30,
                                         ),
                                      ),

                                       connected?Text(" "):Icon(Icons.error, color: Colors.red[700],size: SizeConfig.screenHeight * 0.05,),
                                       connected?
                                       Text("${result.device.name}\nConnected".toUpperCase(),style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2.5,fontWeight: FontWeight.w700 ),textAlign: TextAlign.center,):
                                       Flexible(
                                         child: Container(
                                           padding: EdgeInsets.all(7),
                                           width: SizeConfig.screenWidth * 0.50,
                                           height: SizeConfig.screenHeight * 0.10,
                                           decoration: BoxDecoration(
                                             border: Border.all(color:Colors.grey[500]),
                                             color: Colors.grey[350],
                                             borderRadius: BorderRadius.circular(10),
                                           ),
                                           child: Center(child: Text("Make sure your device is\n\nturned on & ready to pair",style: TextStyle(fontWeight: FontWeight.bold),)),
                                         ),
                                       )
                                       ,
                                     ],
                                   ),
                                 ), connected?Image.asset(" assets/check.png",color: greenColor,):Icon(Icons.search_outlined ,color: greenColor,size: 35,))));*/

                         },
                         child: Container(
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color: Colors.white,
                               boxShadow: [
                                 BoxShadow(
                                     color: pageOffset== index?greenColor:Colors.grey,
                                     blurRadius: 10.0,
                                     spreadRadius: 4.0
                                 )
                               ]
                           ),
                           child:Image(image: detectedSpeakersImagesList[index],fit: BoxFit.fill,),
                         ),
                       ),),
                       AnimatedOpacity(
                         duration: Duration(milliseconds: 2),
                         opacity: pageOffset == index? 1: 0,
                         child: Align(
                           alignment: Alignment(0.0,0.5),
                           child:BluetoothDeviceListEntry(
                             device: result.device,
                             rssi: result.rssi,
                             onTap: () async {
                              /* try {
                                 bool bonded = false;

                                 /// Disconnect Device
                                 if (result.device.isBonded) {
                                   print('Unbonding from ${result.device.address}...');
                                   await FlutterBluetoothSerial.instance
                                       .removeDeviceBondWithAddress(result.device.address);
                                   print('Unbonding from ${result.device.address} has succed');
                                 }   //TODO  remove "Disconnect" functionality from here

                                 /// Connect
                                 else {
                                   print('Bonding with ${result.device.address}...');
                                   bonded = await FlutterBluetoothSerial.instance
                                       .bondDeviceAtAddress(result.device.address);
                                   print(
                                       'Bonding with ${result.device.address} has ${bonded ? 'succed' : 'failed'}.');
                                   if(bonded!=false){/// add navigator
                                    // return Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalPlay()));
                                   }

                                 }
                                 setState(() {
                                   results[results.indexOf(result)] = BluetoothDiscoveryResult(
                                       device: BluetoothDevice(
                                         name: result.device.name ?? '',
                                         address: result.device.address,
                                         type: result.device.type,
                                         bondState: bonded
                                             ? BluetoothBondState.bonded
                                             : BluetoothBondState.none,
                                       ),
                                       rssi: result.rssi);
                                 });
                               } catch (ex) {
                                 showDialog(
                                   context: context,
                                   builder: (BuildContext context) {
                                     return AlertDialog(
                                       title: const Text('Error occured while bonding'),
                                       content: Text("${ex.toString()}"),
                                       actions: <Widget>[
                                         new FlatButton(
                                           child: new Text("Close"),
                                           onPressed: () {
                                             Navigator.of(context).pop();
                                           },
                                         ),
                                       ],
                                     );
                                   },
                                 );
                               }*/ /// dont remove it untill blutooth connectivity test done  with 4 5 other speakers.
                             },
                           )
                           /*Text(myspeakerImageBase64MapList[index].spkrName.toUpperCase(),style: TextStyle(fontSize: 25),),*/
                         ),
                       ),


                     ],
                   );
                 }
             ),
         ),
       ),
     );

   }
 }



 
