//
//  PageBlockTableCell.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a cell of a table
internal struct PageBlockTableCell: Codable {
    /// Horizontal cell content alignment
    internal let align: PageBlockHorizontalAlignment

    /// The number of columns the cell should span
    internal let colspan: Int

    /// True, if it is a header cell
    internal let isHeader: Bool

    /// The number of rows the cell should span
    internal let rowspan: Int

    /// Cell text; may be null. If the text is null, then the cell should be invisible
    internal let text: RichText?

    /// Vertical cell content alignment
    internal let valign: PageBlockVerticalAlignment

    internal init(
        align: PageBlockHorizontalAlignment,
        colspan: Int,
        isHeader: Bool,
        rowspan: Int,
        text: RichText?,
        valign: PageBlockVerticalAlignment
    ) {
        self.align = align
        self.colspan = colspan
        self.isHeader = isHeader
        self.rowspan = rowspan
        self.text = text
        self.valign = valign
    }
}
