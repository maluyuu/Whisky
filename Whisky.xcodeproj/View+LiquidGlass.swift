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

// MARK: - Glass Effect Extension

extension View {
    /// Applies a Liquid Glass effect to the view
    /// - Parameters:
    ///   - style: The glass style to apply
    ///   - interactive: Whether the glass effect should respond to interactions
    /// - Returns: A view with the applied glass effect
    func whiskyLiquidGlass(_ style: LiquidGlassStyle, interactive: Bool = false) -> some View {
        self.modifier(LiquidGlassModifier(style: style, interactive: interactive))
    }
}

// MARK: - Liquid Glass Style

enum LiquidGlassStyle {
    case card
    case button
    case pill
    case custom(cornerRadius: CGFloat)
    
    var shape: AnyShape {
        switch self {
        case .card:
            return AnyShape(RoundedRectangle(cornerRadius: 12))
        case .button:
            return AnyShape(RoundedRectangle(cornerRadius: 8))
        case .pill:
            return AnyShape(Capsule())
        case .custom(let cornerRadius):
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }
}

// MARK: - Liquid Glass Modifier

struct LiquidGlassModifier: ViewModifier {
    let style: LiquidGlassStyle
    let interactive: Bool
    
    @State private var isHovered = false
    @State private var isPressed = false
    
    func body(content: Content) -> some View {
        content
            .background {
                // Use the new Liquid Glass API if available, fallback to visual effect
                if #available(macOS 15.0, *) {
                    // Modern Liquid Glass implementation
                    Rectangle()
                        .fill(.regularMaterial, style: FillStyle())
                        .glassEffect(.regular.interactive(interactive), in: style.shape)
                } else {
                    // Fallback for older macOS versions
                    VisualEffectView(material: .hudWindow, blendingMode: .behindWindow)
                        .clipShape(style.shape)
                }
            }
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .opacity(isHovered && interactive ? 0.9 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isHovered)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
            .onHover { hovering in
                if interactive {
                    isHovered = hovering
                }
            }
            .pressEvents {
                onPress: {
                    if interactive {
                        isPressed = true
                    }
                }
                onRelease: {
                    if interactive {
                        isPressed = false
                    }
                }
            }
    }
}

// MARK: - Visual Effect View (Fallback)

struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = .active
        return visualEffectView
    }
    
    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}

// MARK: - Press Events Helper

extension View {
    func pressEvents(onPress: @escaping () -> Void, onRelease: @escaping () -> Void) -> some View {
        self.simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    onPress()
                }
                .onEnded { _ in
                    onRelease()
                }
        )
    }
}

// MARK: - AnyShape Helper

struct AnyShape: Shape {
    private let _path: (CGRect) -> Path
    
    init<S: Shape>(_ shape: S) {
        _path = { rect in
            shape.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}