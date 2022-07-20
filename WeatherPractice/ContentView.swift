//
//  ContentView.swift
//  WeatherPractice
//
//  Created by Ömer Faruk Kılıçaslan on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                WeatherHeadTextTitle(cityName: "Cupertino,CA")
                
                WeatherMainView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
                
                
                
                HStack (spacing: 15){
                    
                    WeatherForEachDay(dayText: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherForEachDay(dayText: "WED", imageName: "cloud.sun.fill", temperature: 50)
                    
                    WeatherForEachDay(dayText: "WED", imageName: "cloud.sun.fill", temperature: 50)
                    
                    WeatherForEachDay(dayText: "WED", imageName: "cloud.sun.fill", temperature: 50)
                    
                    WeatherForEachDay(dayText: "WED", imageName: "cloud.sun.fill", temperature: 50)
                    
                }.padding(.bottom, 150)
                
                
                
                Button {
                    isNight.toggle()
                } label: {
                    ButtonText(isNight: $isNight, buttonText: "Change Day Time")
                }
                
                Spacer()
                
                

            }
            
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherHeadTextTitle: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherMainView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack (spacing: 20){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


struct WeatherForEachDay: View {
    
    var dayText: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayText)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct ButtonText: View {
    
    @Binding var isNight : Bool
    var buttonText: String
    
    var body: some View {
        
        Text(buttonText)
            .frame(width: 250, height: 50)
            .background(Color.white)
            .foregroundColor(isNight ? .gray : .blue)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(15)
    }
}
