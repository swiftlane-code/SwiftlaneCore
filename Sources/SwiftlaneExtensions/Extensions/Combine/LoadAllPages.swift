//

import Combine

public extension Publishers {
	/// Recursively loads all available pages one after another
	/// starting from `startPageIndex` while `nextPageExists` returns `true`.
	/// `nextPageExists` is called every time a new page is loaded.
	///
	/// - Parameters:
	///   - pageRequest: makes a publisher to load page at index.
	///   - nextPageExists: closures which determines if next page should be loaded.
	///   - startPageIndex: index of first page to load.
	/// - Returns: Publisher of array of all loaded pages results.
	static func loadAllPages<PageResult, Failure>(
		pageRequest: @escaping (Int) -> AnyPublisher<PageResult, Failure>,
		nextPageExists: @escaping ([PageResult]) -> Bool,
		startPageIndex: Int = 0,
		loadedPages: [PageResult] = []
	) -> AnyPublisher<[PageResult], Failure> {
		pageRequest(startPageIndex)
			.flatMap { pageResult -> AnyPublisher<[PageResult], Failure> in
				let loadedPages = loadedPages + [pageResult]
				
				if nextPageExists(loadedPages) {
					return loadAllPages(
						pageRequest: pageRequest,
						nextPageExists: nextPageExists,
						startPageIndex: startPageIndex + 1,
						loadedPages: loadedPages
					)
					.eraseToAnyPublisher()
				}
				
				return Just(loadedPages)
					.setFailureType(to: Failure.self)
					.eraseToAnyPublisher()
			}
			.eraseToAnyPublisher()
	}
}
