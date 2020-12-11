import 'dart:async';

///
/// 倒计时回调
///
typedef void OnTimerTickCallback(int millisUntilFinished);

///
/// author: hefei
/// time  : 2020/10/22
/// desc  : 计时工具类
///
class TimerUtil {
  TimerUtil({this.mInterval = Duration.millisecondsPerSecond, this.mTotalTime});

  int mInterval; // 时间间隔, 单位:毫秒
  int mTotalTime; // 总时长, 单位:毫秒

  Timer _mTimer;

  bool _isActive = false;

  OnTimerTickCallback _onTimerTickCallback;

  void _doCallback(int time) {
    if (_onTimerTickCallback != null) {
      _onTimerTickCallback(time);
    }
  }

  ///
  /// 启动定时器
  ///
  void startTimer() {
    if (_isActive || mInterval <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: mInterval);
    _doCallback(0);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      _doCallback(timer.tick);
    });
  }

  ///
  /// 启动倒计时
  ///
  void startCountDown() {
    if (_isActive || mInterval <= 0 || mTotalTime <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: mInterval);
    _doCallback(mTotalTime);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      int time = mTotalTime - mInterval;
      mTotalTime = time;
      if (time >= mInterval) {
        _doCallback(time);
      } else if (time == 0) {
        _doCallback(time);
        cancel();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          mTotalTime = 0;
          _doCallback(0);
          cancel();
        });
      }
    });
  }

  ///
  /// 取消定时器
  ///
  void cancel() {
    _isActive = false;
    if (_mTimer != null) {
      _mTimer.cancel();
      _mTimer = null;
    }
  }

  bool isActive() {
    return _isActive;
  }

  void setInterval(int interval) {
    if (interval <= 0) interval = Duration.millisecondsPerSecond;
    mInterval = interval;
  }

  void setTotalTime(int totalTime) {
    if (totalTime <= 0) return;
    mTotalTime = totalTime;
  }

  void updateTotalTime(int totalTime) {
    cancel();
    mTotalTime = totalTime;
    startCountDown();
  }

  void setOnTimerTickCallback(OnTimerTickCallback callback) {
    _onTimerTickCallback = callback;
  }

  String formatTime(int seconds) {
    String str = "";

    int day = seconds ~/ 86400;
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;

    if (day > 0) str += "$day 天 ";
    if (hour > 0) str += "${formatTime(hour)} 时 ";
    if (minute > 0) str += "${formatTime(minute)} 分 ";
    if (second > 0) str += "${formatTime(second)} 秒";
    return str;
  }

  String formatTime2(int seconds) {
    String str = "";

    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;

    if (hour > 0) str += "${formatTime(hour)} : ";
    if (minute > 0) str += "${formatTime(minute)} : ";
    if (second > 0) str += "${formatTime(second)}";
    return str;
  }

  String zeroTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }
}
