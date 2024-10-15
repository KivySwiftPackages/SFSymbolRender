import PySwiftCore
import PySwiftObject
import PythonCore
import KivyTexture
import UIKit


func sf_symbol(system_name: String, point_size: Double) -> PyPointer {
	guard
		let image = UIImage(
			systemName: system_name,
			withConfiguration: UIImage.SymbolConfiguration(pointSize: point_size)
		)?.withRenderingMode(.alwaysTemplate),
		let cg = image.cgImage
	else { fatalError() }
	let tex = KivyTexture(cg: cg)
	return tex.data
	
}

public let module = PySwiftModuleImport(name: "sf_render", module: PyInit_sf_render)
