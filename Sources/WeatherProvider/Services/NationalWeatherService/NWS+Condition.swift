import Foundation
import GeohashKit
import NationalWeatherService

extension Forecast.Period {
    public var wxpCondition: WXPCondition? {
        guard let condition = self.conditions.first else { return nil }
        switch (self.isDaytime, condition) {
        case (true, .skc):          return .clear_day
        case (false, .skc):         return .clear_night

        case (true, .few):          return .clear_day
        case (false, .few):         return .clear_night

        case (true, .sct):          return .cloudy_day
        case (false, .sct):         return .cloudy_night

        case (true, .bkn):          return .cloudy_day
        case (false, .bkn):         return .cloudy_night

        case (_, .ovc):             return .overcast
        case (_, .wind_skc),
             (_, .wind_few),
             (_, .wind_sct),
             (_, .wind_bkn),
             (_, .wind_ovc):        return .windy

        case (_, .snow):            return .snow

        case (_, .rain_snow),
             (_, .rain_sleet),
             (_, .snow_sleet),
             (_, .fzra),
             (_, .rain_fzra),
             (_, .snow_fzra),
             (_, .sleet):           return .sleet

        case (_, .rain),
             (_, .rain_showers):    return .rain

        case (_, .rain_showers_hi): return .heavy_rain

        case (_, .tsra),
             (_, .tsra_sct),
             (_, .tsra_hi):         return .thunderstorm

        case (_, .tornado):         return .tornado

        case (_, .hurricane),
             (_, .tropical_storm):  return .hurricane

        case (_, .dust):            return .dust
        case (_, .smoke):           return .smoke
        case (_, .haze):            return .haze
        case (_, .hot):             return .hot
        case (_, .cold):            return .icy
        case (_, .blizzard):        return .blizzard
        case (_, .fog):             return .fog
        case (_, .other):           return .other
        }
    }
}
