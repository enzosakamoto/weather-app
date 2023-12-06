//
//  WeatherView.swift
//  weather-app
//
//  Created by Enzo Sakamoto on 06/12/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute().weekday()))").fontWeight(.light)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            let weatherCondition = weather.weather[0].main
                            
                            switch weatherCondition {
                            case "Clouds": Image(systemName: "cloud")
                                    .font(.system(size: 50))
                            case "Clear": Image(systemName: "sun.max")
                                    .font(.system(size: 50))
                            case "Rain": Image(systemName: "cloud.rain")
                                    .font(.system(size: 50))
                            case "Snow": Image(systemName: "cloud.snow")
                                    .font(.system(size: 50))
                            default: Image(systemName: "sun.max")
                                    .font(.system(size: 50))
                            }
                            
                            Text(weather.weather[0].main)
                            
                        }
                        .frame(width: 150)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "º")
                            .font(.system(size: 90))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble()) + "º")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble()) + "º")
                    }
                    .padding(.horizontal, 10)
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble()) + " m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humity", value: (weather.main.humidity.roundDouble()) + "%")
                    }
                    .padding(.horizontal, 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.639, saturation: 0.646, brightness: 0.631))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.639, saturation: 0.646, brightness: 0.631))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
