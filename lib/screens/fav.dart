
import 'package:ayurhealth/provider/favProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {

    final f = Provider.of<ProviderFav>(context);
    return Scaffold(appBar: AppBar(title: Text("Wishlist",style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: "popins"),),),
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: f.name.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black26)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage(f.img[index]),
                            width: 96,
                            height: 96,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    f.name[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: "popins"),
                                  ),
                                  SizedBox(width: 20,),
                                  GestureDetector(
                                    onTap: () {
                                      f.toggleFav(f.img[index], f.rate[index], f.name[index], f.pname[index]);


                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Consumer<ProviderFav>(
                                        builder: (context, providerFav, child) {
                                          final isFavorite = providerFav.isFavorited(f.name[index]);
                                          return Icon(
                                            isFavorite ? Icons.favorite : Icons.favorite_border,
                                            color: isFavorite ? Colors.red : Colors.grey,
                                            size: 20,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                f.pname[index],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: "popins"),
                              ),

                              Text(
                               "\$ ${f.rate[index]}",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontFamily: "popins"),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
