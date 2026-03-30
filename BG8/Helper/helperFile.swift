//
//  helperFile.swift
//  BG8
//
//  Created by Mac HD on 24/02/2025.
//

import SwiftUI
import CoreLocation


var showAlert: Bool = false

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct BlurEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        view.backgroundColor = UIColor.white.withAlphaComponent(0.01)
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct GlassBackground: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.01)
            BlurView(style: .systemUltraThinMaterial)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY)) // bottom center
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY)) // top left
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // top right
        path.closeSubpath()
        return path
    }
}
