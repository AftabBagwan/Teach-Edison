import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teach_edison/screens/home.dart';
import 'package:teach_edison/screens/movies.dart';
import 'package:teach_edison/screens/search_result.dart';
import 'package:teach_edison/screens/user.dart';

class Dashboard extends StatefulWidget {
  static const IconData movie = IconData(0xe40d, fontFamily: 'MaterialIcons');
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

int _selectedIndex = 0;
var str = "";

final carouselImages = [
  'https://pbs.twimg.com/media/EJa01k8XsAI4dQU?format=jpg&name=large',
  'https://assets.mubicdn.net/images/notebook/post_images/34521/images-w1400.jpg?1639064590',
  'https://images.fandango.com/ImageRenderer/0/0/redesign/static/img/default_poster.png/0/images/masterrepository/other/ant_man_ver5.jpg',
  'https://www.joblo.com/wp-content/uploads/2021/11/encounter-2021-poster-400x600.jpg',
  'https://www3.pictures.zimbio.com/mp/Od8cL1OXfz_x.jpg',
];

const String? apiKey = '4cb93e31';
String? searchValue = fieldText.text;
const String? api = "http://www.omdbapi.com/?s=avengers&apiKey=$apiKey";
var searchData;
List? data;
final TextEditingController fieldText = TextEditingController();

class _DashboardState extends State<Dashboard> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Movies(),
    const User(),
  ];

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  Future<void> getJsonData() async {
    var response = await http
        .get(Uri.parse(api!), headers: {"Accept": "application/json"});
    setState(() {
      var dataToJson = jsonDecode(response.body);
      data = dataToJson["Search"];
      str = dataToJson['totalResults'];
    });
  }

  Future<void> getApiJson() async {
    String searchApi = "http://www.omdbapi.com/?t=$searchValue&apiKey=4cb93e31";
    var response = await http
        .get(Uri.parse(searchApi), headers: {"Accept": "application/json"});
    setState(() {
      var dataToJson = jsonDecode(response.body);
      searchData = dataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.view_list_sharp)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.language,
                )),
          ],
          title: const Text("TeachEdison Review"),
          bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: fieldText,
                  onSubmitted: (searchValue) async {
                    await getApiJson();
                    if (searchData['Response'] != 'False') {
                      fieldText.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResult(
                            title: searchData!['Title'],
                            year: searchData!['Year'],
                            released: searchData!['Released'],
                            runtime: searchData!['Runtime'],
                            genre: searchData!['Genre'],
                            director: searchData!['Director'],
                            writer: searchData!['Writer'],
                            actors: searchData!['Actors'],
                            plot: searchData!['Plot'],
                            language: searchData!['Language'],
                            country: searchData!['Country'],
                            awards: searchData!['Awards'],
                            poster: searchData!['Poster'],
                            boxoffice: searchData!['BoxOffice'],
                          ),
                        ),
                      );
                    }
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "What are you looking for ?",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              preferredSize: Size(MediaQuery.of(context).size.width, 55)),
        ),
        body: Column(
          children: [
            Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Dashboard.movie),
              label: "Movies",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              label: "User",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
