//
//  ContentView.swift
//  Lab8_2022
//
//  Created by ICS 224 on 2022-03-15.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    let worldAnchor = try! Experience.loadWorld()
    var body: some View {
        ARViewContainer(worldAnchor: worldAnchor).edgesIgnoringSafeArea(.all)
        VStack{
            Button("Orbit!") {
                worldAnchor.notifications.orbitBattery.post();
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    let worldAnchor : Experience.World;
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "World" scene from the "Experience" Reality File
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(worldAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
