import PySwiftKit
import PySerializing
import PySwiftObject
import PyUnpack

import PySwiftWrapper

import KivyTexture

#if os(iOS)
import UIKit
#else
import Cocoa

#endif
@PyModule
struct SfRender: PyModuleProtocol {
    
    @PyFunction
    static func sf_symbol(system_name: String, point_size: Double) -> PyPointer {
#if os(iOS)
        guard
            let image = UIImage(
                systemName: system_name,
                withConfiguration: UIImage.SymbolConfiguration(pointSize: point_size)
            )?.withRenderingMode(.alwaysTemplate),
            let cg = image.cgImage
                
        else { return .None }
        #else
        guard
            let image = NSImage(
                systemSymbolName: system_name,
                accessibilityDescription: nil
            )?.withSymbolConfiguration(.init(pointSize: point_size, weight: .regular, scale: .medium)),
            let cg = image.cgImage(forProposedRect: nil, context: .current, hints: nil)
            
            
        else {
            return .None
        }
#endif
        return KivyTexture(cg: cg).pyPointer
        
    }
    
    static var py_classes: [any (PyClassProtocol & AnyObject).Type] = []
}

public extension PySwiftModuleImport {
    static let sf_render = PySwiftModuleImport(name: "sf_render", module: SfRender.py_init)
}
