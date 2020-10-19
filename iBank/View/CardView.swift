//
//  CardView.swift
//  iBank
//
//  Created by Admin on 10/18/20.
//

import SwiftUI

struct CardView: View {
    var number : String
    var name : String
    var vencto : Date
    
    var body: some View {

        ZStack {
            Image("cardBandec")
                .resizable()
                .frame(width: 320, height: 180, alignment: .center)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
            Text(number)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .font(.body)
                .offset(y:8)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
            Text(name)
                .fontWeight(.semibold)
                .font(.system(size: 12.0))
                .foregroundColor(.black)
                .offset(x:-50, y:40)
                .shadow(color: Color.white.opacity(0.2), radius: 5, x: 5, y: 5)
            Text(self.formatDate())
                .fontWeight(.semibold)
                .font(.system(size: 12.0))
                .foregroundColor(.black)
                .offset(x:-25, y:60)
                .shadow(color: Color.white.opacity(0.2), radius: 5, x: 5, y: 5)
            Text("CUP")
                .fontWeight(.semibold)
                .font(.system(size: 12.0))
                .foregroundColor(.black)
                .offset(x:-120, y:60)
                .shadow(color: Color.white.opacity(0.2), radius: 5, x: 5, y: 5)
            
            
        }
    }
    
    
    private func formatDate() -> String{
        var fDate : String = "Vence: "
        let year : String = String(self.vencto.description.split(separator: "-")[0])
        let month : String = String(self.vencto.description.split(separator: "-")[1])
        fDate.append("\(month)/\(year)")
        return fDate
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: "9204 0699 9327 3598", name: "RONIEL LOPEZ ALVAREZ", vencto: Date())
    }
}
