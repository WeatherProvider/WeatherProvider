/// A standardized set of weather conditions. Different agencies have a different way of reporting conditions,
/// so this roughly unifies these conditions to make it easier for developers. It won't cover every case, but is
/// for convenience.
public enum WXPCondition: String {
    case clear_night
    case clear_day
    case fog
    case cloudy_day
    case cloudy_night
    case overcast
    case drizzle
    case rain
    case heavy_rain
    case hail
    case snow
    case heavy_snow
    case sleet
    case thunderstorm
    case partly_cloudy_day
    case partly_cloudy_night
    case smoke
    case windy
    case blizzard
    case icy
    case hot
    case tornado
    case hurricane
    case haze
    case dust
    case other

    /// Returns the english description of the condition.
    var english: String {
        switch self {
        case .clear_night:           return "Clear"
        case .clear_day:             return "Clear"
        case .fog:                   return "Fog"
        case .cloudy_day:            return "Cloudy"
        case .cloudy_night:          return "Cloudy"
        case .overcast:              return "Overcast"
        case .drizzle:               return "Dizzle"
        case .rain:                  return "Rain"
        case .heavy_rain:            return "Heavy rain"
        case .hail:                  return "Hail"
        case .snow:                  return "Snow"
        case .heavy_snow:            return "Heavy Show"
        case .sleet:                 return "Sleet"
        case .thunderstorm:          return "Thunderstorm"
        case .partly_cloudy_day:     return "Partly cloudy"
        case .partly_cloudy_night:   return "Partly cloudy"
        case .smoke:                 return "Smoke"
        case .windy:                 return "Windy"
        case .blizzard:              return "Blizzard"
        case .icy:                   return "Freezing"
        case .hot:                   return "Hot"
        case .tornado:               return "Tornado"
        case .hurricane:             return "Hurricane"
        case .haze:                  return "Haze"
        case .dust:                  return "Dust"
        case .other:                 return "Other"
        }
    }

    /// Returns the name of the symbol that can be used with SF Symbols.
    var sfSymbolName: String? {
        switch self {
        case .clear_night:           return "moon.stars"
        case .clear_day:             return "sun.max"
        case .fog:                   return "cloud.fog"
        case .cloudy_day:            return "cloud.sun"
        case .cloudy_night:          return "cloud.moon"
        case .overcast:              return "cloud"
        case .drizzle:               return "cloud.drizzle"
        case .rain:                  return "cloud.rain"
        case .heavy_rain:            return "cloud.heavyrain"
        case .hail:                  return "cloud.hail"
        case .snow:                  return "cloud.snow"
        case .heavy_snow:            return "snow"
        case .sleet:                 return "cloud.sleet"
        case .thunderstorm:          return "cloud.bolt.rain"
        case .partly_cloudy_day:     return "cloud.sun"
        case .partly_cloudy_night:   return "cloud.moon"
        case .smoke:                 return "smoke"
        case .windy:                 return "wind"
        case .blizzard:              return "wind.snow"
        case .icy:                   return "thermometer.snowflake"
        case .hot:                   return "thermometer.sun"
        case .tornado:               return "tornado"
        case .hurricane:             return "hurricane"
        case .haze:                  return "sun.haze"
        case .dust:                  return "sun.dust"
        case .other:                 return nil
        }
    }

    /// Returns the name of the icon that can be used with Font Awesome.
    var fontAwesomeName: String? {
        switch self {
        case .clear_night:           return "moon.stars"
        case .clear_day:             return "sun"
        case .fog:                   return "fog"
        case .cloudy_day:            return "clouds-sun"
        case .cloudy_night:          return "clouds-moon"
        case .overcast:              return "clouds"
        case .drizzle:               return "cloud-drizzle"
        case .rain:                  return "cloud-rain"
        case .heavy_rain:            return "cloud-showers-heavy"
        case .hail:                  return "cloud-hail"
        case .snow:                  return "cloud-snow"
        case .heavy_snow:            return "snowflake"
        case .sleet:                 return "cloud-sleet"
        case .thunderstorm:          return "thunderstorm"
        case .partly_cloudy_day:     return "cloud-sun"
        case .partly_cloudy_night:   return "cloud-moon"
        case .smoke:                 return "smoke"
        case .windy:                 return "wind"
        case .blizzard:              return "snow-blowing"
        case .icy:                   return "temperature-frigid"
        case .hot:                   return "temperature-hot"
        case .tornado:               return "tornado"
        case .hurricane:             return "hurricane"
        case .haze:                  return "sun-haze"
        case .dust:                  return "sun-dust"
        case .other:                 return nil
        }
    }
}

