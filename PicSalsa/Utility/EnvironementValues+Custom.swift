//
//  EnvironementValues+Custom.swift
//  PicSalsa
//
//  Created by Andres Made on 6/10/21.
//

import Foundation
import SwiftUI

struct RouteKey: EnvironmentKey {
    static var defaultValue: Binding<Route> =
        Binding.constant(Route.onboarding)
}
extension EnvironmentValues {
    var route: Binding<Route> {
        get { self[RouteKey.self] }
        set { self[RouteKey.self] = newValue }
    }
}
