//
//  DrawingView.swift
//  DoodleDuel
//
//  Created by Matthew Morikan on 2024-03-06.
//


import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var matchManager: MatchManager
        
        init(matchManager: MatchManager) {
            self.matchManager = matchManager
        }
        
        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
           
        }
    }
    var canvasView = PKCanvasView()
    
    @ObservedObject var matchManager: MatchManager
    @Binding var eraserEnabled: Bool
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
        canvasView.delegate = context.coordinator
        canvasView.isUserInteractionEnabled = matchManager.currentlyDrawing
        
        return canvasView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(matchManager: matchManager)
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // TODO: Handle various updates
        
        canvasView.tool = eraserEnabled ? PKEraserTool(.vector) :
        PKInkingTool(.pen, color: .black, width: 5)
    }
}

struct DrawingView_Previews: PreviewProvider {
    @State static var eraser = false
    static var previews: some View {
        DrawingView(matchManager: MatchManager(), eraserEnabled: $eraser)
    }
}
