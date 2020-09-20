
| Under Active Development |
|----|
| If you are interested in weather data now, try: |
| United States: [NationalWeatherService-Swift](https://github.com/WeatherProvider/NationalWeatherService-Swift) |
| Canada: [MeteorologicalServiceOfCanada-Swift](https://github.com/WeatherProvider/MeteorologicalServiceOfCanada-Swift)|
| If you are interested in helping out, check out <kbd>Needs Help</kbd> issues |

<img src="https://user-images.githubusercontent.com/22162410/92952820-799c5300-f415-11ea-8874-2d1d616c8150.png" alt="Weather Provider Logo" align="left" width="64">

# WeatherProvider
![Swift 5.3](https://img.shields.io/badge/swift-5.3-orange)
![MIT License](https://img.shields.io/badge/license-MIT-lightgrey)

A free and open-source weather API, powered by government data.
## Platforms
| Platform | CI |
| :------- | :- |
| Apple    | [![Apple](https://github.com/WeatherProvider/WeatherProvider/workflows/Apple/badge.svg)](https://github.com/WeatherProvider/WeatherProvider/actions?query=workflow%3AApple) |
| Linux (Ubuntu & Amazon) | [![Linux](https://github.com/WeatherProvider/WeatherProvider/workflows/Linux/badge.svg)](https://github.com/WeatherProvider/WeatherProvider/actions?query=workflow%3ALinux) |

# About
## Flexible
Data sources can be easily incorporated by conforming to `WeatherProvider`. Failing data sources are handled gracefully.

## Decentralized
It is possible to use this library in your app to directly query the weather source.
This is useful if you do not want to pay for a server . However, you can also use 
this library on a server if you prefer more control. See [WeatherProvider-Server](/WeatherProvider/WeatherProvider-Server).

## Privacy
Instead of providing an accurate coordinate, you may provide a location in the 
form of a Geohash, which has varying degrees of accuracy depending on your configuration.

# Installation
Use Swift Package Manager.

## IMPORTANT
YOU NEED TO DO SOME CONFIGURATION BEFORE YOU CAN USE WEATHER PROVIDER. SEE [CONFIGURATION](https://github.com/WeatherProvider/WeatherProvider/wiki/Configuration).

## How to Use
As of 0.3.0, this package only supports the National Weather Service and getting the current weather condition.

```swift
let weatherProvider = WeatherProvider()

weatherProvider.getCurrentConditions(for: Coordinates(latitude: 47.6174, latitude: -122.2017)) { result in
   switch result {
      case .success(let conditions):   print(conditions)
      case .failure(let error):        print(error)
   }
}

```

If you prefer, you can use a geohash instead of exact coordinates. 
Note that using a geohash will use the center coordinate of that geohash, 
so you'll want to be careful of how precise of a hash you want to use.

```swift
let geohash = Geohash(coordinates: (47.6174, -122.2017), precision: 5)  // "c23ng"

weatherProvider.getCurrentConditions(for: geohash) { result in          // results in (47.61474609375, -122.18994140625)
   switch result {
      case .success(let conditions):   print(conditions)
      case .failure(let error):        print(error)
   }
}
```

## Important
This project is currently **unstable**, subject to major API changes.
As of now, a lot of the terminology is based off the United States National Weather Services definitions.
I am looking to generalize the model as I continue to incorporate more sources.

# License
- This Swift library is MIT License.
- Data source licenses may vary, but in general should be public-domain.
