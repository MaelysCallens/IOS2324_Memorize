//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Maëlys Callens on 01/12/2023.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
