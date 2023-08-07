//
//  TLButton.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bgColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Perform your action here
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Create Account", bgColor: .cyan) {
//            Action
        }
    }
}
