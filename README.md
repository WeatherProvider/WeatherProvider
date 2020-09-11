<img src="https://user-images.githubusercontent.com/22162410/92952820-799c5300-f415-11ea-8874-2d1d616c8150.png" alt="Weather Provider Logo" align="left" width="64">

# WeatherProvider
A free and open-source weather API, powered by government data.

# Platforms
![Swift](https://github.com/WeatherProvider/WeatherProvider/workflows/Swift/badge.svg)
- Apple-platforms
- Ubuntu

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

## Important
This project is currently **unstable**, subject to major API changes.
As of now, a lot of the terminology is based off the United States National Weather Services definitions.
I am looking to generalize the model as I continue to incorporate more sources.

# License
- This Swift library is MIT License.
- Data source licenses may vary, but in general should be public-domain.
