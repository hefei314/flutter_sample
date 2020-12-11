import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/app/constants.dart';
import 'package:flutter_sample/app/global.dart';
import 'package:flutter_sample/support/bean/splash_bean.dart';
import 'package:flutter_sample/support/route/navigator_util.dart';
import 'package:flutter_sample/support/utils/assets_util.dart';
import 'package:flutter_sample/support/utils/sp_util.dart';
import 'package:flutter_sample/support/utils/timer_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///
/// author: hefei
/// time  : 2020/12/11
/// desc  : 闪屏页 => 包含引导页和启动页
///
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static final List<Widget> _guideList = [
    AssetsUtil.getSplashBackground(0),
    AssetsUtil.getSplashBackground(1),
    AssetsUtil.getSplashBackground(2)
  ];

  static const int TYPE_START_PAGE = 0; // 启动页
  static const int TYPE_GUIDE_PAGE = 1; // 引导页
  static const int TYPE_AD_PAGE = 2; // 广告页

  int _type = TYPE_START_PAGE;

  int _countdownValue = 4;

  int _currentGuideIndex = 0;

  SplashBean _splashBean;

  TimerUtil _timerUtil;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    if (_timerUtil != null) _timerUtil.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            Offstage(
              offstage: _type != TYPE_START_PAGE,
              child: _buildSplashPage(),
            ),
            Offstage(
              offstage: _type != TYPE_AD_PAGE || _splashBean == null,
              child: _buildADPage(),
            ),
            Offstage(
              offstage: _type != TYPE_GUIDE_PAGE,
              child: _buildGuidePage(),
            ),
            Offstage(
              offstage: _type == TYPE_GUIDE_PAGE || _countdownValue == 0,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: InkWell(
                      onTap: () => _goMain(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.transparent,
                        ),
                        child: Text(
                          "$_countdownValue | 跳过",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// 闪屏页
  ///
  Widget _buildSplashPage() {
    return AssetsUtil.getSplashBackground(0);
  }

  ///
  /// 广告页
  ///
  Widget _buildADPage() {
    if (_splashBean == null) {
      return new Container(
        height: 0.0,
      );
    }
    return Container(
      constraints: BoxConstraints.expand(),
      child: CachedNetworkImage(
        imageUrl: _splashBean.imgUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  ///
  /// 引导页
  ///
  Widget _buildGuidePage() {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment(0, 0.8),
        children: [
          Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: _guideList[index],
              );
            },
            itemCount: _guideList.length,
            loop: false,
            autoplay: false,
            pagination: SwiperPagination(
              margin: EdgeInsets.only(bottom: 20.0),
              builder: DotSwiperPaginationBuilder(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                activeColor: Color.fromRGBO(255, 255, 255, 0.9),
                size: 8.0,
                activeSize: 8.0,
              ),
              alignment: Alignment.bottomCenter,
            ),
            control: SwiperControl(
              iconPrevious: null,
              iconNext: null,
            ),
            onIndexChanged: (index) {
              setState(() {
                _currentGuideIndex = index;
              });
            },
          ),
          Offstage(
            offstage: _currentGuideIndex < _guideList.length - 1,
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('立即体验'),
              onPressed: () {
                _goMain();
                // 设置为非首次安装
                Global.setFirstInstall(false);
              },
            ),
          )
        ],
      ),
    );
  }

  ///
  /// 初始化
  ///
  void _init() {
    _loadADData();
    if (Global.isFirstInstall()) {
      // 首次安装
      setState(() {
        _type = TYPE_GUIDE_PAGE;
      });
    } else {
      if (_splashBean == null) {
        setState(() {
          _type = TYPE_START_PAGE;
        });
      } else {
        setState(() {
          _type = TYPE_AD_PAGE;
        });
      }
      _initCountDown();
    }
  }

  ///
  /// 加载广告数据
  ///
  /// 数据仅加载在缓存中，这导致后台更新数据后会在下次打开应用时才会展示。
  ///
  void _loadADData() {
    _splashBean = SpUtil.getObj(Constants.KEY_SPLASH_INFO, (v) => SplashBean.fromJson(v));
    if (_splashBean != null) {
      setState(() {});
    }
    // 模拟网络请求
    Constants.getSplash().then((data) {
      if (data != null && data.imgUrl.isNotEmpty) {
        if (_splashBean == null || (_splashBean != null && _splashBean.imgUrl != data.imgUrl)) {
          // 无缓存 || 数据更新
          SpUtil.putObject(Constants.KEY_SPLASH_INFO, data);
        }
      } else {
        SpUtil.putObject(Constants.KEY_SPLASH_INFO, null);
      }
    });
  }

  ///
  /// 初始化倒计时
  ///
  void _initCountDown() {
    _timerUtil = new TimerUtil(mTotalTime: _countdownValue * 1000);
    _timerUtil.setOnTimerTickCallback((millisUntilFinished) {
      double _secondsUntilFinished = millisUntilFinished / 1000;
      setState(() {
        _countdownValue = _secondsUntilFinished.toInt();
      });
      if (_secondsUntilFinished == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  ///
  /// 跳转到主页
  ///
  void _goMain() {
    NavigatorUtil.goMainPage(context);
  }
}
