// String searchApiUrl = 
  // 'https://www.metaweather.com/api/location/search/?query=';

  // String cityApiUrl = 
  // 'https://www.metaweather.com/api/location/';

  // void fetchSearch (String input) async{
  //   var searchResult = await http.get('https://www.metaweather.com/api/location/search/?query=${cityName}');
  //   var result = json.decode(searchResult.body)[0];

  //   setState(() {
  //     cityName = result['title'];
  //     woeid = result["woeid"];
  //   });
  // }

  // void fetchLocation() async{
  //   var locationResult = await http.get('https://www.metaweather.com/api/location/${woeid}');

  //   var result = json.decode(locationResult.body);
  //   var consolidatedWeather = result["consolidated_weather"];
  //   var data = consolidatedWeather[0];

  //   setState(() {
  //     nhietDo = data["the_temp"].round();
  //     weather = data["weather_state_name"].replaceAll(' ', '').toLowerCase();
  //   });
  // }

  // void onTextFieldSubbmitted(String input){
  //   fetchSearch(input);
  //   fetchLocation();
  // }