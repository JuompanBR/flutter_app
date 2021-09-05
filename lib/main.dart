import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import "./components/contact_view.dart";

void main(List<String> args) {
  runApp(Notes());
}

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      color: CupertinoColors.darkBackgroundGray,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemYellow,
        brightness: Brightness.dark,
        barBackgroundColor: CupertinoColors.black,
      ),
      home: HomeNotes(),
    );
  }
}

class HomeNotes extends StatefulWidget {
  HomeNotes({Key? key}) : super(key: key);

  @override
  _HomeNotesState createState() => _HomeNotesState();
}

class _HomeNotesState extends State<HomeNotes> {
  List<Widget> pageTabs = [
    HomePage(),
    ChatPage(),
    SendPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (BuildContext context, currentIndex) {
        return CupertinoPageScaffold(
          child: pageTabs[currentIndex],
        );
      },
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.paperplane),
            label: "Send",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverNavigationBar(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          leading: CupertinoButton(
            onPressed: () {},
            child: Icon(CupertinoIcons.back),
          ),
          largeTitle: Text("Notes"),
          trailing: CupertinoButton(
            onPressed: () {},
            child: Icon(CupertinoIcons.info),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 2.5 / 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: CupertinoButton(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("mindfull.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Text(
                        "Mindfulness",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Card is clicked.'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text('ok'),
                            onPressed: () {
                              Navigator.pop(context, 'ok');
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('Large Title'),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        )
      ],
    );
  }
}

class SendPage extends StatefulWidget {
  SendPage({Key? key}) : super(key: key);

  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          trailing: CupertinoButton(
            onPressed: () {},
            child: Icon(CupertinoIcons.person),
          ),
          largeTitle: Text("Contacts"),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3 / 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Material(
                child: Text("hi"),
              );
            },
            childCount: 20,
          ),
        )
      ],
    );
  }
}
