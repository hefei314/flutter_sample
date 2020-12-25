# flutter_sample

A sample for Flutter.

## Modules
- 基础组件

- 自定义组件

    - LoadingLayout

        > 多状态布局，包含加载中、无数据、出错、无网络四种状态

    - 

- 其他

    - 国际化

        ```dart
        1.使用插件 Flutter Intl
            (1)pubspec.yaml中添加
               dependencies:
            	 flutter_localizations:
                   sdk: flutter
            (2)Tools >> Flutter Intl >> Initialize for the Project
               此时lib下将添加generated以及l10n文件夹;
        	   pubspec.yaml将中添加
               flutter_intl:
                 enabled: true
            (3)Tools >> Flutter Intl >> Add Locale 添加语言支持，在l10n文件夹中开始翻译
            (4)main.dart中添加国际化支持
               MaterialApp(
                  ...
                  onGenerateTitle: (context) {
                    return S.of(context).appName;
                  },
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  ...
                );
                使用方法：S.of(context).keyName 或者 S.current.keyName
        
        ```

