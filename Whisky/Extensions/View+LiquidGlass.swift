//
//  View+LiquidGlass.swift
//  Whisky
//
//  This file is part of Whisky.
//
//  Whisky is free software: you can redistribute it and/or modify it under the terms
//  of the GNU General Public License as published by the Free Software Foundation,
//  either version 3 of the License, or (at your option) any later version.
//
//  Whisky is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
//  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
//  See the GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along with Whisky.
//  If not, see https://www.gnu.org/licenses/.
//

import SwiftUI

enum WhiskyLiquidGlassRole {
    case sidebar
    case detail
    case card
    case bar
}

private extension WhiskyLiquidGlassRole {
    var cornerRadius: CGFloat {
        switch self {
        case .sidebar:
            return 24
        case .detail:
            return 28
        case .card:
            return 20
        case .bar:
            return 18
        }
    }

    var defaultTint: Color? {
        switch self {
        case .sidebar:
            return .accentColor.opacity(0.12)
        case .detail:
            return nil
        case .card:
            return .accentColor.opacity(0.18)
        case .bar:
            return .accentColor.opacity(0.08)
        }
    }

    @available(macOS 15, *)
    var baseGlass: Glass {
        switch self {
        case .sidebar:
            return .clear
        case .detail:
            return .regular
        case .card:
            return .regular
        case .bar:
            return .clear
        }
    }
}

extension View {
    @ViewBuilder
    func whiskyLiquidGlass(
        _ role: WhiskyLiquidGlassRole,
        namespace: Namespace.ID? = nil,
        id: AnyHashable? = nil,
        interactive: Bool = false,
        tint customTint: Color? = nil
    ) -> some View {
        if #available(macOS 15, *) {
            var glass = role.baseGlass
            if interactive {
                glass = glass.interactive()
            }
            let tint = customTint ?? role.defaultTint
            var view = self.glassEffect(
                glass,
                in: RoundedRectangle(cornerRadius: role.cornerRadius, style: .continuous)
            )
            if let tint {
                view = view.tint(tint)
            }
            if let namespace, let id {
                view = view.glassEffectID(id, in: namespace)
            }
            view
        } else {
            self
        }
    }

    @ViewBuilder
    func whiskyLiquidGlassContainer(spacing: CGFloat = 18) -> some View {
        if #available(macOS 15, *) {
            GlassEffectContainer(spacing: spacing) {
                self
            }
        } else {
            self
        }
    }
}
