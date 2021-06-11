import 'dart:io';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/widgets/widgets.dart';

class AppInfo {
  final String? packageName;
  final String? appVersion;
  final String? ipAddress;
  final String? os;
  final String? buildNumber;

  Map<String, dynamic> get getAppInfo => this.toMap();

  const AppInfo(
      {this.packageName,
      this.appVersion,
      this.ipAddress,
      this.os,
      this.buildNumber});

  AppInfo copyWith({
    String? packageName,
    String? appVersion,
    String? ipAddress,
    String? os,
    String? buildNumber,
  }) {
    return AppInfo(
      packageName: packageName ?? this.packageName,
      appVersion: appVersion ?? this.appVersion,
      ipAddress: ipAddress ?? this.ipAddress,
      os: os ?? this.os,
      buildNumber: buildNumber ?? this.buildNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'packageName': packageName,
      'appVersion': appVersion,
      'ipAddress': ipAddress,
      'os': os,
      'buildNumber': buildNumber,
    };
  }

  factory AppInfo.fromMap(Map<String, dynamic> map) {
    return AppInfo(
      packageName: map['packageName'],
      appVersion: map['appVersion'],
      ipAddress: map['ipAddress'],
      os: map['os'],
      buildNumber: map['buildNumber'],
    );
  }

  @override
  String toString() {
    return 'AppInfo(packageName: $packageName, appVersion: $appVersion, ipAddress: $ipAddress, os: $os, buildNumber: $buildNumber)';
  }
}

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late CurrentTheme currentTheme;
  late AppInfo appInfo;
  late String ipAddress;
  late PackageInfo packageInfo;
  late String os;
  late List<InfoTile> infoTiles = [];

  Future getInfo() async {
    ipAddress = await getIPAdress();
    os = Platform.operatingSystem;
    packageInfo = await PackageInfo.fromPlatform();

    appInfo = AppInfo(
        packageName: packageInfo.packageName,
        appVersion: packageInfo.version,
        buildNumber: packageInfo.buildNumber,
        ipAddress: ipAddress,
        os: os);
    print(appInfo.toString());
    infoTiles = [
      InfoTile(
        title: 'Package Name',
        value: appInfo.packageName,
        isDark: currentTheme.isDark,
      ),
      InfoTile(
        title: 'App Version',
        value: appInfo.appVersion,
        isDark: currentTheme.isDark,
      ),
      InfoTile(
        title: 'IP Address',
        value: appInfo.ipAddress,
        isDark: currentTheme.isDark,
      ),
      InfoTile(
        title: 'Operating System',
        value: appInfo.os,
        isDark: currentTheme.isDark,
      ),
      InfoTile(
        title: 'Build Number',
        value: appInfo.buildNumber,
        isDark: currentTheme.isDark,
      ),
    ];
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    currentTheme = Provider.of<CurrentTheme>(context, listen: false);
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    print("Settings Screen");
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            currentTheme.isDark ? CustomColors.darkBg : CustomColors.lightBg,
        body: Body(
          title: Text(''),
          type: null,
          showAppBar: false,
          scrollingChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container(
                //   color: CustomColors.marvelRed,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 50.0,
                //     vertical: 30,
                //   ),
                //   child: Image.asset('assets/images/marvel_logo.png'),
                // ),
                if(infoTiles.isNotEmpty)
                  for (InfoTile infoTile in infoTiles) 
                    infoTile,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key, this.title, this.value, this.isDark})
      : super(key: key);

  final String? title, value;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        TextStyle(color: isDark! ? CustomColors.white : CustomColors.black);
    return Container(
      decoration: BoxDecoration(
        color: isDark! ? CustomColors.frostBlack : CustomColors.frostWhite,
        border: Border.symmetric(
          horizontal: BorderSide(width: 0.5),
        ),
      ),
      child: ListTile(
        leading: Text(title!, style: textStyle,),
        title: Text(':', style: textStyle,),
        trailing: Text(value!, style: textStyle,),
      ),
    );
  }
}
