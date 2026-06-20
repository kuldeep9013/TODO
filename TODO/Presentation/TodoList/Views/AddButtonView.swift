//
//  AddButtonView.swift
//  TODO
//
//  Created by Kuldeep Solanki on 19/06/26.
//

import SwiftUI

struct AddButtonView: View {

    var body: some View {
        Image(systemName: "plus")
            .padding()
            .background(
                Circle()
                    .fill(Color.brown)
                    .shadow(radius: 16)
            )

    }

}

#Preview {
    AddButtonView()
}
