import 'package:flutter/material.dart';
import 'package:nubanktest/domain/entities/entities.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage(this.presenter);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final urlController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void reloadPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nu Short URL Program'),
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter a URL to be shortten',
                    suffixIcon: IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        await widget.presenter.shortUrl(urlController.text);
                        reloadPage();
                      },
                      icon: const Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32), child: Text('Recently shortted URLs', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
              Expanded(
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                itemCount: widget.presenter.lastShorttenUrls!.length,
                itemBuilder: (context, int index) {
                  return Padding(padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 88,
          
                    decoration: BoxDecoration(
              color: Color(0xff612F74),
              border:  Border.all(color:const Color(0xffA332B3), width: 10),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(5,5)
 
                )
              ]
            ),
                    child: Stack(
                      children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text('Self: ' + widget.presenter.lastShorttenUrls![index].self,
                             style: const TextStyle( color: Color(0xffffffff)),),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Short: ' + widget.presenter.lastShorttenUrls![index].short, 
                            overflow: TextOverflow.ellipsis,
                            style: 
                            const TextStyle(color: Color(0xffffffff)),),
                          )
                      ],
                    ),
                  ),);
                },
              ))
            ]));
  }
}
