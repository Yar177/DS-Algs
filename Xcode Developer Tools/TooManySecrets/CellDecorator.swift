import UIKit

class CellDecorator {
    
    lazy var decorate: (CustomCell, RowType) -> Void = { cell, rowType in
        self.setupLabel(for: cell, rowType: rowType)
        self.setupImage(for: cell, rowType: rowType)
    }
    
    private func setupLabel(for cell: CustomCell, rowType: RowType) {
        cell.setPassword(password: rowType.string)
    }
    
    private func setupImage(for cell: CustomCell, rowType: RowType) {
        cell.add(image: rowType.image)
    }
}
