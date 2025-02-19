//
//  Test.swift
//  SportBag
//
//  Created by D K on 16.02.2025.
//

import SwiftUI

struct Test: View {
    var body: some View {
        FirstView()
    }
}

#Preview {
    Test()
}


struct FirstView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Первая вью")
                NavigationLink("Перейти ко второй вью", value: "SecondView")
            }
            .navigationDestination(for: String.self) { value in
                if value == "SecondView" {
                    SecondView(path: $path)
                } else if value == "ThirdView" {
                    ThirdView(path: $path)
                }
            }
        }
    }
}

struct SecondView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Вторая вью")
            Button("Перейти к третьей вью") {
                path.append("ThirdView")
            }
        }
    }
}

struct ThirdView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            Text("Третья вью")
            Button("Вернуться на первую вью") {
                path.removeLast(path.count) // Удалить все вью из стека
            }
        }
    }
}
