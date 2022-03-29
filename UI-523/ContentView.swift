//
//  ContentView.swift
//  UI-523
//
//  Created by nyannyan0328 on 2022/03/29.
//

import SwiftUI

struct ContentView: View {
    @State var isOn : Bool = false
    @State var animation : Bool = false
    var body: some View {
        VStack(spacing:20){
            
            AnimatedView(title: "Kavsoft")
             
      
            Toggle(isOn: $isOn) {
                
              Text("Mulit Color")
                
            }
        
            .padding(.leading,5)
            .padding(.top,20)
        }
       
            .preferredColorScheme(.dark)
        
        
    }
    @ViewBuilder
    func AnimatedView(title : String)->some View{
        
        ZStack{
            
            
            Text(title)
                .font(.system(size: 75))
                .foregroundColor(.white.opacity(0.25))
            
            
            HStack(spacing:0){
                
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    
                    
                    Text(String(title[title.index(title.startIndex, offsetBy: index)]))
                        .font(.system(size: 75))
                         .foregroundColor(isOn ?  radomElement() : .white)
                    
                    
                }
                 
            }
            .mask {
                
                
               
                    Rectangle()
                           .fill(
                           
                               LinearGradient(colors: [
                               
                               
                                   .white.opacity(0.5),
                                   .white.opacity(0.3),
                               
                               ], startPoint: .leading, endPoint: .trailing)
                           
                           )
                          
                         
                           .rotationEffect(.init(degrees: -70))
                           .padding(20)
                           .offset(x: -250)
                           .offset(x: animation ? 500 : 0)
                    
            }
       
        }
     
        .onAppear {
            
            withAnimation(.linear(duration: 2).speed(1).repeatForever(autoreverses: true)){
                
                
                animation.toggle()
            }
            
            
        }
        
    }
    func radomElement()->Color{
        
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green:CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
