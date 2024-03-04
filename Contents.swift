import UIKit



struct Weather: Codable {
    let city: String
    let temperature: Int
    let condition: String
    let forecast: [forecast]
}

struct forecast: Codable {
    let day: String
    let high: Int
    let low: Int
    let condition: String
}

let jsonData = """
{
    "city": "Kuwait",
    "temperature": 25,
    "condition": "Sunny",
    "forecast": [
        {
            "day": "Monday",
            "high": 29,
            "low": 17,
            "condition": "Partly Cloudy"
        },
        {
            "day": "Tuesday",
            "high": 18,
            "low": 13,
            "condition": "Rain"
        }
    ]
}
""".data(using: .utf8)!

do {
    let weathers = try JSONDecoder().decode(Weather.self, from: jsonData)
    print("CITY: \(weathers.city) CONDITION: \(weathers.condition)  TEMPERATURE: \(weathers.temperature)")
    for weather in weathers.forecast{
        print("DAY: \(weather.day) HIGH: \(weather.high) LOW: \(weather.low) CONDITION: \(weather.condition)")
    }
    

} catch {
    print("Decoding error: \(error)")
}
