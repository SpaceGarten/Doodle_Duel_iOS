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
            guard canvasView.isUserInteractionEnabled else { return }
            matchManager.sendData(canvasView.drawing.dataRepresentation(), mode: .reliable)
        }
    }
    
    @ObservedObject var matchManager: MatchManager
    @Binding var eraserEnabled: Bool
    @Binding var selectedColor: UIColor
    @Binding var strokeWidth: CGFloat

    func makeUIView(context: Context) -> PKCanvasView {
        let canvasView = PKCanvasView()
        
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = eraserEnabled ? PKEraserTool(.vector) : PKInkingTool(.pen, color: selectedColor,width:strokeWidth)
        canvasView.delegate = context.coordinator
        canvasView.isUserInteractionEnabled = matchManager.currentlyDrawing
        
        return canvasView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(matchManager: matchManager)
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = eraserEnabled ? PKEraserTool(.vector) : PKInkingTool(.pen, color: selectedColor, width: strokeWidth)

        let wasDrawing = uiView.isUserInteractionEnabled
        uiView.isUserInteractionEnabled = matchManager.currentlyDrawing
        if !wasDrawing && matchManager.currentlyDrawing {
            uiView.drawing = PKDrawing()
        }
        if !uiView.isUserInteractionEnabled || !matchManager.inGame {
            print("Updating drawing...")
            uiView.drawing = matchManager.lastReceivedDrawing
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    @State static var eraser = false
    @State static var selectedColor = UIColor.black
    @State static var strokeWidth: CGFloat = 5.0

    static var previews: some View {
        DrawingView(matchManager: MatchManager(), eraserEnabled: $eraser, selectedColor: $selectedColor, strokeWidth: $strokeWidth)
    }
}
