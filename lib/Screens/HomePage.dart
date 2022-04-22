import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_practice/Screens/Library.dart';
import 'package:music_practice/Screens/navScreen.dart';
import 'package:music_practice/helper/helpers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.appScaffoldColor,
      body: OrientationBuilder(
        builder: (context,Orientation orientation) {
          return SafeArea(
            child: orientation == Orientation.portrait ? buildPotrait() : buildLandscape(),
          );
        }
      ),
    );
  }
}

class buildPotrait extends StatelessWidget {
  const buildPotrait({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        Image.asset(
          Images.homepage,
          height:350.0,
          width: 350.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Text(
            Strings.welcomeScreenTitle,
            style: AppStyle.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10),
          child: Text(
            Strings.welcomeScreenSubTitle,
            style: AppStyle.subTitle,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(15),
            height: 70,
            width: double.infinity ,
            child: TextButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> NavScreen())),
              child: Text(
                Strings.getStartedButton,
                style: AppStyle.getStarted,
              ),
              style: TextButton.styleFrom(
                  backgroundColor: AppStyle.getStartedButtonColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
            ),
          ),
        )
      ],
    );
  }
}

class buildLandscape extends StatelessWidget {
  const buildLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.homepage,
          height:350.0,
          width: 350.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.welcomeScreenTitle,
              style: AppStyle.title,
            ),
            Text(
              Strings.welcomeScreenSubTitle,
              style: AppStyle.subTitle,
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 70,
              width: 150 ,
              child: TextButton(
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>NavScreen())),
                child: Text(
                  Strings.getStartedButton,
                  style: AppStyle.getStarted,
                ),
                style: TextButton.styleFrom(
                    backgroundColor: AppStyle.getStartedButtonColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0))),
              ),
            )
          ],
        ),
      ],
    );
  }
}
