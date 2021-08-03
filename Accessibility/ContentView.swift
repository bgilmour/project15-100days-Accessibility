//
//  ContentView.swift
//  Accessibility
//
//  Created by Bruce Gilmour on 2021-08-02.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Group {
            Image(decorative: "ales-krivec-15949")
                .accessibility(hidden: true)

            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            //.accessibilityElement(children: .combine)
            .accessibilityElement(children: .ignore)
            .accessibility(label: Text("Your score is 1000"))
        }
    }
}

struct ReadingControlValuesView: View {
    @State private var estimate = 25.0
    @State private var rating = 3

    var body: some View {
        VStack {
            Slider(value: $estimate, in: 0 ... 50)
                .padding()
                .accessibility(value: Text("\(Int(estimate))"))

            Stepper("Rate our service: \(rating)/5", value: $rating, in: 0 ... 5)
                .padding()
                .accessibility(value: Text("Rate our service: \(rating)/5"))
        }
    }

}

struct HintsAndTraitsView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]

    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    @State private var selectedPicture = Int.random(in: 0 ... 3)

    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0 ... 3)
            }
            .accessibility(label: Text(labels[selectedPicture]))
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
