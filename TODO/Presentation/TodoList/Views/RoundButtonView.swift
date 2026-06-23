//
//  AddButtonView.swift
//  TODO
//
//  Created by Kuldeep Solanki on 19/06/26.
//

import SwiftUI

struct RoundButtonView: View {
    var imageName: String?
    var body: some View {
        Image(systemName: imageName ?? "plus")
            .padding()
            .background(
                Circle()
                    .fill(Color.tile)
                    .shadow(radius: 16)
            )

    }

}

#Preview {
    RoundButtonView()
}
