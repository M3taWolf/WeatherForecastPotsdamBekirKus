//
//  ContentView.swift
//  WeatherForecastPotsdamBekirKus
//
//  Created by Bekir Kus on 25.01.23.
//

import SwiftUI

// Dictionary, Key:Values, 1 = Mon, 2 = Tue, 3 = Wed, 4 = Thu, 5 = Fri, 6 = Sat, 7 = Sun

var sharedViews =  [1: 0,
                    2: 0,
                    3: 0,
                    4: 0,
                    5: 0,
                    6: 0,
                    7: 0]
    


// ContentView, Stacks, NavigationView, ScrollView

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        
        
        NavigationView {
            // view background color
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                // styling VStack, vertical view
                VStack(alignment: .center) {
                    VStack(alignment: .center) {
                        // getting image from Global Struct
                        Image(systemName: currentWeather.image)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        // getting current data from Global Struct
                        Text(currentWeather.detail)
                            .font(.headline.weight(.semibold))
                            .foregroundColor(.black)
                        
                        Text(currentWeather.value)
                            .font(.title2.weight(.bold))
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding()
                    
                    // styling scrollView
                    ScrollView(.vertical, showsIndicators: false) {
                        // getting informations for days from global struct
                        ForEach(weatherArray.indices) { index in
                            WeatherDetailView(weather: weatherArray[index], index: index)
                                .frame(minWidth: 350, maxWidth: 400)
                            
                        }
                        Spacer()
                    }
                    
                }
                .padding()
            }
            // title styling
            .navigationBarTitle("Potsdam")
            .navigationBarTitleDisplayMode(.automatic)
            .onChange(of: scenePhase) { newPhase in
                
                if newPhase == .background {
                    print("\(sharedViews)")
                    
                    
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

// created WeatherItemLabelView for using later in WeatherDetailView
struct WeatherItemLabelView: View {
    let text: String
    let fontWeight: Font.Weight
    // styling text: Weekdays and weather conditions
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .fontWeight(fontWeight)
                .foregroundColor(.black)
        }
    }
}

// created WeatherItemImageView for using later in WeatherDetailView
struct WeatherItemImageView: View {
    
    var imageName: String
    // styling icons in frames
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 25)
            .padding(.horizontal, 8)
            .font(.system(size: 20))
        
    }
}



struct WeatherDetailView: View {
    
    let weather: Weather
    let index: Int
    
    var body: some View {
        // getting days and images for weather details
        HStack {
            VStack(alignment: .center) {
                WeatherItemLabelView(text: weather.day, fontWeight: .semibold)
                WeatherItemImageView(imageName: weather.image)                    // <- using WeatherItemImageView
            }
            Spacer()
            WeatherItemLabelView(text: weather.detail, fontWeight: .light)        // <- using WeatherItemLabelView
            WeatherItemLabelView(text: weather.value, fontWeight: .bold)
            
            // creating shareLink for sharing specific days with friends via "Messages"
            ShareLink(item: "Hey, check the weather: \(weather.detail)")
                .foregroundColor(.cyan
                )
                .simultaneousGesture(TapGesture().onEnded() {
                    print("clicked")
                    
                    //if clicked on share, change value in dictionary +1
                    sharedViews[index+1]! += 1
                })
            
            
        }
        .padding()
        .background(Color.primary.opacity(0.15))
        .cornerRadius(20.0)
    }
    
}
