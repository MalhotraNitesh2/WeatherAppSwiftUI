//
//  ContentView.swift
//  Weather App
//
//  Created by Nitesh Malhotra on 2025-01-17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            backgroundView(isNight: isNight )
            
            VStack{
                CitytextView(cityname: "Toronto,ON")
                
                maincityView(tempertaure: "-1° C" ,weatherimage: isNight ? "moon.fill" : "snow")
                
                
                
                Spacer()
                HStack{
                    Dayweather(dayofweek: "Tue", weatherimage: isNight ? "moon.fill" : "snow", temperature: 2)
                    Dayweather(dayofweek: "Wed", weatherimage: isNight ? "moon.stars.fill" : "sunset.fill", temperature: 2)
                    Dayweather(dayofweek: "Thu", weatherimage: isNight ? "moon.fill" :"cloud.sun.fill", temperature: 2)
                    Dayweather(dayofweek: "Fri", weatherimage: isNight ? "moon.stars.fill" :"wind.snow", temperature: 2)
                    Dayweather(dayofweek: "Sat", weatherimage: isNight ? "moon.fill"  : "snow", temperature: 2)
                }
                Spacer()
                
                
                Button{
                    isNight.toggle()
                }
                label:{
                    WeatherButton(title: "Change Date and Time",
                                  textcolor:isNight ?.black : .white
                                  , backgroundcolor: isNight ? .gray : Color.lightblue)
                }
                
            
            }
        }
    }
}

#Preview {
    ContentView()
}


struct Dayweather: View {
    var dayofweek : String
    var weatherimage: String
    var  temperature : Int
    var body: some View {
        VStack
        {
            
            VStack{
                Text(dayofweek)
                    .font(.system(size: 20 ,weight: .heavy, design: .default))
                    .foregroundColor(.white)
                    .padding(5)}
            
            VStack{
                Image(systemName: weatherimage)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30,height:30)
                    .padding()
                
            }
            
            VStack{
                Text("\(temperature)°C")
                    .font(.system(size: 20,weight: .medium,design: .default))
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct backgroundView: View {
    var isNight : Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .lightblue , isNight ? .white : .blue]) ,
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CitytextView: View {
    var cityname : String
    
    var body : some View{
        VStack{
            Text(cityname)
                .font(.system(size: 30 ,weight: .heavy, design: .default))
                .foregroundColor(.white)
                .padding(5)
        }
    }
}

struct maincityView: View {
    
    var tempertaure : String
    var weatherimage : String
    var body: some View {
        VStack{
            Image(systemName: weatherimage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height:180)
                .padding()
            
            Text(tempertaure)
                .font(.system(size: 40,weight: .medium,design: .default))
                .foregroundColor(.white)
        }
    }
}



struct WeatherButton: View {
    var title: String
    var textcolor : Color
    var backgroundcolor : Color
    
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(textcolor)
            .padding()
            .background(backgroundcolor)
            .cornerRadius(10)

    }
}
                        
