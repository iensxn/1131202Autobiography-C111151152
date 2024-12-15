import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('我的自傳'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Image.asset('assets/f1.jpg', width: 40, height: 40,):Image.asset('assets/f1.jpg', width: 30, height: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='我出生在一個平凡的家庭，父親是一間小工廠的老闆，母親是全職主婦，且我有兩位哥哥，父母在我小時候對我十分包容和愛護，從小起我就十分喜愛唱歌，唱歌也成為了我的專長。'
      '在到了國中之後，我開始有更多自己的想法，雖然不太喜歡讀書，但因為我知道我需要讀書才有更多辦法讓自己之後生活得更好，我便常常留在學校讀書。'
      '在會考時我發揮不良，最後考上了自己的第二志願，雖然可惜，但我還是讀了我較喜歡的科系，高中是我認為目前人生中最為快樂的一段時間，我在這段期間中認識到了我要好的朋友及學到了許多與專業有關的知識。'
      '我在經過一些唱歌的訓練之後也曾經在彰化的比賽中拔得頭籌，只可惜我到了大學後較少參加比賽，又加上需要打工而沒有太多時間可以認真練習。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who an I', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 15,),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('乙級電腦硬體裝修證照'),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 200,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 學好英文'),
                    Text('2. 程式語言'),
                    Text('3. 學好樂器'),
                    Text('4. 存一些錢'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期\n1.熟悉演算法與資料結構基礎\n2.瘋狂打工\n3.作業系統'),
          ],),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期\n1.準備研究所考試\n'),
          ],),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期\n1.準備研究所考試'),
          ],),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('我想要嘗試看看是否有可能和朋友組成樂團'),
      ),
    );
  }
}
