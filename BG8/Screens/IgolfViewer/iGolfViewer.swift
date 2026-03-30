//
//  iGolfViewer.swift
//  BG8
//
//  Created by Mac HD on 28/02/2026.
//

import SwiftUI
import IGolfViewer3D

struct CourseView: View {
    var courseID: String? = nil
    var showBackButton: Bool = false
    var scorecard: ScorecardModel? = nil
    var gpsData: GPSModel? = nil
    var vectorData: VectorGPSModel? = nil
    var teeDetails: TeeDetailsModel? = nil
    var totalHoles: Int = 18
    @Environment(\.dismiss) var dismiss
    @State private var selectedHole: Int = 1
    @State private var config: CourseRenderViewConfig? = nil
    @State private var userLocation: CLLocation? = nil
    @State private var flyoverState : FlyoverState = .none

    private var currentPar: Int? {
        guard let scorecard = scorecard,
              let menScorecard = scorecard.menScorecardList.first,
              menScorecard.parHole.indices.contains(selectedHole - 1) else {
            return nil
        }
        return menScorecard.parHole[selectedHole - 1]
    }

    private var currentHcp: Int? {
        guard let scorecard = scorecard,
              let menScorecard = scorecard.menScorecardList.first,
              menScorecard.hcpHole.indices.contains(selectedHole - 1) else {
            return nil
        }
        return menScorecard.hcpHole[selectedHole - 1]
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                if showBackButton {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                }
                
                Text("Course Viewer")
                    .font(.headline)
                
                Spacer()
                
                HStack(spacing: 12) {
                    Button(action: {
                        if selectedHole > 1 {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedHole -= 1
                            }
                        }
                    }) {
                        Text("Previous")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedHole > 1 ? .blue : .gray)
                    }
                    .disabled(selectedHole <= 1)
                    
                    Text("\(selectedHole)/\(totalHoles)")
                        .font(.system(size: 13, design: .monospaced))
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Capsule())
                    
                    Button(action: {
                        if selectedHole < totalHoles {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedHole += 1
                            }
                        }
                    }) {
                        Text("Next")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(selectedHole < totalHoles ? .blue : .gray)
                    }
                    .disabled(selectedHole >= totalHoles)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(uiColor: .systemBackground))
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            if let teeList = teeDetails?.teesList, !teeList.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(teeList, id: \.teeName) { tee in
                            TeeCard(tee: tee, selectedHoleIndex: selectedHole - 1)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                }
//                .background(Color(uiColor: .systemSecondaryBackground).opacity(0.5))
            }
            
            if let config {
                ZStack(alignment: .topLeading) {
                    CourseRenderViewRepresentable(config: config)
                        .currentHole(selectedHole)
                    .currentLocation(userLocation)
                    .navigationMode(.mode2DView)
                    .measurementSystem(.imperial)
                    .showCalloutOverlay(true)
                    .userLocationVisible(true)
                    .draw3DCentralLine(false)
                    .sendFlagLocations(false)
                    .autoGreenView(false)
                    .showHeatmaps(false)
                    .onCourseDataLoaded { }
                    .onTapAtLocation { point in }
                    .onHoleDataLoaded { }
                    .onNavigationModeChanged { mode in }
                    .onFlagScreenPointUpdated { point in }
                    .onCurrentHoleUpdated { hole in
                        // Only update if the hole is different to prevent cycles
                        if selectedHole != Int(hole) {
                            selectedHole = Int(hole)
                        }
                    }
                    .onDistancesUpdated { front, center, back in }
                    .onFlyoverFinished { }
                    .onFlyoverShouldReset {
                        flyoverState = .none
                    }
                    .id("viewer-\(courseID ?? "unknown")") // Stable ID per course to prevent re-initialization on hole change
                    
                    // Scorecard Information Overlay
                    VStack(spacing: 8) {
                        if let par = currentPar {
                            InfoCard(label: "PAR", value: "\(par)")
                        }
                        if let hcp = currentHcp {
                            InfoCard(label: "HCP", value: "\(hcp)")
                        }
                    }
                    .padding(12)
                }
            } else {
                ProgressView("Loading course...")
                    .task {
                        loadCourse()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .navigationTitle("")
    }
    private func loadCourse() {
        // Fetch course data from your API
        // Then build the config:
        
        // Note: Using placeholders for data dictionaries as they are typically fetched from an API
        var vectorDetails: [AnyHashable: Any] = [:]
        if let vectorData = vectorData {
            do {
                let data = try JSONEncoder().encode(vectorData)
                if let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    vectorDetails = dict
                }
            } catch {
                print("Error encoding Vector data: \(error)")
            }
        }
        
        var gpsDetails: [AnyHashable: Any] = [:]
        if let gpsData = gpsData {
            do {
                let data = try JSONEncoder().encode(gpsData)
                if let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    gpsDetails = dict
                }
            } catch {
                print("Error encoding GPS data: \(error)")
            }
        }
        
        var scorecardDict: [AnyHashable: Any] = [:]
        if let scorecard = scorecard {
            do {
                let data = try JSONEncoder().encode(scorecard)
                if let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    scorecardDict = dict
                }
            } catch {
                print("Error encoding scorecard: \(error)")
            }
        }

        let elevationsData: [AnyHashable: Any]? = nil
        let pinPositions: [AnyHashable: Any]? = nil
        let heatmaps: [HeatmapData]? = nil
        let rockParams: RockParams? = nil

        let config = CourseRenderViewConfig.Builder()
            .apiKey("Oqt-mW0LBMYO-SI")
            .secretKey("cca6_dw-pQ__JCtsH4q6ISpIbHM-ch")
            .courseId(courseID ?? "")
            .vectorDetails(vectorDetails)
            .courseGpsDetails(gpsDetails)
            .scorecardDetails(scorecardDict)
            .elevationsData(elevationsData)
            .coursePinPositions(pinPositions)
            .hole(selectedHole)
            .navigationMode(.mode2DView)
            .textureQuality(.high)
            .calloutsDrawMode(.twoSegments)
            .showCalloutsOverlay(true)
            .viewerUnits(.imperial)
            .drawDogLegMarker(true)
            .drawCentralPathMarkers(false)
            .frontBackMarkersDynamic(true)
            .rotateHoleOnLocationChanged(false)
            .autoAdvanceActive(false)
            .draw3dCentralLine(false)
            .userLocationVisible(true)
//            .autoGreenView(false)
            .heatmaps(heatmaps)
            .rockParams(rockParams)
            .build()
        
        self.config = config
        
    }
}

struct TeeCard: View {
    let tee: TeeDetails
    let selectedHoleIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(Color(hex: tee.teeColorValue) ?? .gray)
                .frame(width: 8, height: 8)
            
            VStack(alignment: .leading, spacing: 1) {
                Text(tee.teeName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                if tee.ydsHole.indices.contains(selectedHoleIndex) {
                    Text("\(tee.ydsHole[selectedHoleIndex])")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct InfoCard: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(spacing: 2) {
            Text(label)
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(minWidth: 50)
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(Color(uiColor: .systemBackground).opacity(0.85))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    CourseListScreen()
}
