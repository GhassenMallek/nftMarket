import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nftmakrket/Screens/Home.dart';
import 'package:nftmakrket/Screens/detailsAssets.dart';
import 'package:nftmakrket/models/assets.dart';
import 'package:http/http.dart' as http;

import '../Colors/colors.dart';
import '../constant.dart';
import '../widget/marketGrid.dart';

class Details extends StatefulWidget {
  static const routeName = '/Details';
  const Details({Key? key, required, required this.id}) : super(key: key);
  final String id;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late String testingValue = '';
  List<Assets> items = [];
  Assets? assets;
  late Future<Assets> funcgetAssets;
  @override
  void initState() {
    super.initState();
    funcgetAssets = getAssets();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: funcgetAssets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('assets'),
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const Home(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_sharp, // add custom icons also
                  ),
                ),
              ),
              body: ListView(children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: deviceSize.height * 0.01,
                          bottom: deviceSize.height * 0.01),
                      child: Card(
                        color: fourth,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10.0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          height: height * 0.85,
                          width: deviceSize.width * 0.98,
                          padding: const EdgeInsets.all(6),
                          child: GridView.builder(
                            itemCount: assets!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  var id = assets!.data![index].id;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => DetailsAssets(
                                          idAssets: id.toString()),
                                    ),
                                  );
                                },
                                child: MarketGrid(
                                  assets!.data![index].name!,
                                  assets!.data![index].imageUrl!,
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 200,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            );
          } else {
            return Scaffold(
              body: Directionality(
                textDirection: TextDirection.ltr,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                            // const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),

                            Color.fromARGB(226, 20, 30, 48),
                            Color.fromARGB(245, 36, 59, 85),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          // stops: [0, 1],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: deviceSize.height,
                        width: deviceSize.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 25),
                                    transform: Matrix4.rotationZ(0)
                                      ..translate(1.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(100, 26, 55, 77),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0x00000428),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    duration: const Duration(seconds: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (ctx) => Home(),
                                              ),
                                            );
                                          },
                                          child: Text('Refresh'),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  Future<Assets> getAssets() async {
    final response = await http
        .get(Uri.parse(baseUrl + 'fetchByCollection/' + widget.id.toString()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      assets = Assets.fromJson(jsonDecode(response.body));
      return assets!;
    } else {
      throw Exception('Failed to load Collections');
    }
  }
}
