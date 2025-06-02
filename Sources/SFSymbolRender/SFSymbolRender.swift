import PySwiftKit
import PySerializing
import PySwiftObject
import PyUnpack

import PySwiftWrapper

import KivyTexture
import UIKit

@PyModule
struct SfRender: PyModuleProtocol {
    
    @PyFunction
    static func sf_symbol(system_name: String, point_size: Double) -> PyPointer {
        guard
            let image = UIImage(
                systemName: system_name,
                withConfiguration: UIImage.SymbolConfiguration(pointSize: point_size)
            )?.withRenderingMode(.alwaysTemplate),
            let cg = image.cgImage
        else { return .None }

        return KivyTexture(cg: cg).pyPointer
        
    }
    
    static var py_classes: [any (PyClassProtocol & AnyObject).Type] = []
}

public extension PySwiftModuleImport {
    static let sf_render = PySwiftModuleImport(name: "sf_render", module: SfRender.py_init)
}
