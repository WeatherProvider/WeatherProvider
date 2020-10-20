import GeohashKit

/// Provides multiple ways to specify location.
///
/// - important: Your implementation of latitude and longitude is expected to be within bounds, as defined below.
///
/// ### Bounds
/// latitude = `[-90, 90]` and longitude = `[-180, 180]`
public protocol Location {
    var latitude: Double { get }
    var longitude: Double { get }
}

public struct Coordinates: Location {
    public let latitude: Double
    public let longitude: Double

    /// - parameters:
    ///     - latitude: Accepts in the bounds of `[-90, 90]` and will clamp out-of-bounds to within the range.
    ///                 For example, a value of `-100` will be `-90` or a value of `120` will be `90`.
    ///     - longitude:Accepts in the bounds of `[-180, 180]` and will clamp out-of-bounds to within the range.
    ///                 For example, a value of `-190` will be `-180` or a value of `190` will be `180`.
    public init(_ latitude: Double, _ longitude: Double) {
        if latitude > 90 {
            self.latitude = 90
        } else if latitude < -90 {
            self.latitude = -90
        } else {
            self.latitude = latitude
        }

        if longitude > 180 {
            self.longitude = 180
        } else if longitude < -180 {
            self.longitude = -180
        } else {
            self.longitude = longitude
        }
    }
}

extension Geohash: Location {
}
