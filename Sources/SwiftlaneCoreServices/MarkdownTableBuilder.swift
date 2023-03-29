//

import Foundation

public class MarkdownTableBuilder {
	private var head: [String]?
	private var rows = [[String]]()
	
	public init() {}
	
	public init(rows: [[String]]) {
		self.rows = rows
	}
	
	public func headRow(_ cells: [String]?) -> Self {
		head = cells
		return self
	}
	
	public func row(_ cells: [String]) -> Self {
		rows.append(cells)
		return self
	}
	
	public func addRows(_ rows: [[String]]) {
		self.rows.append(contentsOf: rows)
	}
	
	public func build(title: String? = nil, dropAllIfTableIsEmpty: Bool = true) -> String {
		if dropAllIfTableIsEmpty, rows.isEmpty {
			return ""
		}
		
		func buildRow(_ cells: [String]) -> String {
			let rowBody: [String] = cells.map { cell -> String in
				["<td>", "\n", cell, "\n", "</td>"].joined(separator: "\n")
			}
			return ["<tr>", rowBody.joined(separator: "\n"), "</tr>"].joined(separator: "\n")
		}
		
		let tableBody: [String] = rows
			.map { row -> String in
				buildRow(row)
			}
		
		let head = self.head.map { ["<thead>", buildRow($0), "</thead>"].joined(separator: "\n") } ?? ""
		
		let tableMarkdown: String = [
			title,
			"<table>",
			head,
			"<tbody>",
			tableBody.joined(separator: "\n"),
			"</tbody>",
			"</table>",
		].compactMap { $0 }.joined(separator: "\n")
		
		return tableMarkdown
	}
}
