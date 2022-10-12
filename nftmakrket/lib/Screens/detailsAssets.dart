import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nftmakrket/Screens/Home.dart';
import 'package:nftmakrket/Screens/listAssets.dart';
import 'package:nftmakrket/models/assets.dart';
import 'package:nftmakrket/models/offer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class DetailsAssets extends StatefulWidget {
  static const routeName = '/DetailsAssets';
  const DetailsAssets({Key? key, this.idAssets}) : super(key: key);
  final idAssets;
  @override
  State<DetailsAssets> createState() => _DetailsAssetsState();
}

class _DetailsAssetsState extends State<DetailsAssets> {
  Assets? assets;
  Offer? offer;
  late Future<Assets> funcgetAssetsDetails;
  late Future<Offer> funcgetOfferList;
  @override
  void initState() {
    super.initState();
    funcgetAssetsDetails = getAssetsDetails();
  }

  String? url;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return FutureBuilder(
        future: funcgetAssetsDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('assets'),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const Home(),
                        ),
                      );
                    },
                  ),
                  // add more IconButton
                ],
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Details(
                            id: assets!.data![0].collectionId.toString()),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_sharp, // add custom icons also
                  ),
                ),
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(226, 20, 30, 48),
                                Color.fromARGB(245, 36, 59, 85),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
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
                                  child: AnimatedContainer(
                                    margin: const EdgeInsets.only(
                                        top: 60,
                                        left: 10,
                                        bottom: 10.0,
                                        right: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 25),
                                    transform: Matrix4.rotationZ(0)
                                      ..translate(1.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromARGB(205, 24, 40, 72),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 8,
                                          color: Color(0x00000428),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    duration: const Duration(seconds: 2),
                                    child: Column(
                                      //
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: Colors.white,
                                              border: Border.all(
                                                width: 2.0,
                                                color: const Color.fromARGB(
                                                    255, 1, 97, 109),
                                              )),
                                          width: 300,
                                          height: 200,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Image.network(
                                              assets!.data![0].imageUrl!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        ListTile(
                                          title: Text(
                                            ' ${assets!.data![0].name}',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        AnimatedContainer(
                                          width: 400,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                0, 255, 40, 72),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 8,
                                                color: Color.fromARGB(
                                                    87, 0, 35, 40),
                                                offset: Offset(0, 10),
                                              )
                                            ],
                                          ),
                                          duration: const Duration(seconds: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              ListTile(
                                                title: Text(
                                                  assets!.data![0].description
                                                      .toString(),
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        assets!.data![0].ownership != null
                                            ? ListTile(
                                                title: Text(
                                                  'ownership : ${assets!.data![0].ownership}',
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              )
                                            : const ListTile(
                                                title: Text(
                                                  ' not owned yet',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                        assets!.data![0].externalUrl != null
                                            ? ElevatedButton(
                                                onPressed: () {
                                                  final Uri _url = Uri.parse(
                                                      assets!
                                                          .data![0].externalUrl
                                                          .toString());
                                                  _launchUrl(_url);
                                                },
                                                child: Text('Go to website'),
                                              )
                                            : const SizedBox(),
                                        AnimatedContainer(
                                          width: 400,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                0, 255, 40, 72),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 8,
                                                color: Color.fromARGB(
                                                    87, 0, 35, 40),
                                                offset: Offset(0, 10),
                                              )
                                            ],
                                          ),
                                          duration: const Duration(seconds: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'put your plot',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const SizedBox(height: 18),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                                    margin: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 25),
                                    transform: Matrix4.rotationZ(0)
                                      ..translate(1.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          const Color.fromARGB(100, 26, 55, 77),
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
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CircularProgressIndicator(),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //   MaterialPageRoute(
                                            //     builder: (ctx) => OwnerDetails(
                                            //         id: usermodel!.sId
                                            //             .toString()),
                                            //   ),
                                            // );
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

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<Offer> getOffersDetails() async {
    final response = await http.get(Uri.parse(baseUrl +
        'fetchOfferByAssetId/' +
        assets!.data![0].tokenId.toString()));
    if (response.statusCode == 200) {
      offer = Offer.fromJson(jsonDecode(response.body));
      print(offer!.data![0].assetId);
      return offer!;
    } else {
      throw Exception('Failed to load Collections');
    }
  }

  Future<Assets> getAssetsDetails() async {
    final response = await http
        .get(Uri.parse(baseUrl + 'fetchById/' + widget.idAssets.toString()));
    print(widget.idAssets.toString());
    if (response.statusCode == 200) {
      assets = Assets.fromJson(jsonDecode(response.body));
      print(assets!.data![0].externalUrl);
      getOffersDetails();
      return assets!;
    } else {
      throw Exception('Failed to load Collections');
    }
  }
}
