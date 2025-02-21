//
//  EnterView.swift
//  SportBag
//
//  Created by D K on 21.02.2025.
//

import SwiftUI

struct EnterView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some View {
        HomeView()
            .onAppear {
                AppDelegate.orientationLock = .portrait
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            }
    }
}

#Preview {
    EnterView()
}
