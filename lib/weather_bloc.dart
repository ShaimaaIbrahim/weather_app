import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/WeatherRepo.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherEvent extends Equatable{

  @override
  List<Object> get props => throw UnimplementedError();

}

class FetchWeather extends WeatherEvent{

  final cityName;

  FetchWeather(this.cityName);

  @override
  List<Object> get props {
   return [cityName];
  }

}

class ResetWeather extends WeatherEvent{

}

class WeatherState extends Equatable{

  @override
  List<Object> get props => throw UnimplementedError();

}

class WeatherIsNoSearched extends WeatherState{

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{

  final WeatherModel weather;

  WeatherIsLoaded(this.weather);

  WeatherModel get getWeather => weather;

  @override

  List<Object> get props {
     return [weather];
  }
}

class WeatherIsNotLoaded extends WeatherState{

}
//like viewModel at kotlin

class WeatherBloc extends Bloc<WeatherEvent , WeatherState> {

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo);

  @override
  WeatherState get initialState => WeatherIsNoSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherIsLoading();
      try {
        WeatherModel weather = await weatherRepo.getWeatherModel(event.cityName);
        yield WeatherIsLoaded(weather);
      }
     catch(_){
      print("error occured when fetching data because $_");
      yield WeatherIsNotLoaded();
     }
  }else if(event is ResetWeather){
    yield WeatherIsNoSearched();
    }

  }
}