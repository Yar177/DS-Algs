import UIKit

class CellDecorator {
    
    lazy var decorate: (CustomCell, RowType) -> Void = { [weak self] cell, rowType in
//        NetworkLayer.shared.getSomeData {
//            <#code#>
//        }
        self?.setupLabel(for: cell, rowType: rowType)
        self?.setupImage(for: cell, rowType: rowType)
    }
    
    private func setupLabel(for cell: CustomCell, rowType: RowType) {
        cell.setPassword(password: rowType.string)
    }
    
    private func setupImage(for cell: CustomCell, rowType: RowType) {
        cell.add(image: rowType.image)
    }
}
