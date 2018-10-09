import PerfectHTTPServer

func filters() -> [[String: Any]] {

	var filters: [[String: Any]] = [[String: Any]]()
	filters.append(["type":"response","priority":"high","name":PerfectHTTPServer.HTTPFilter.contentCompression])

	// filters.append(["type":"request","priority":"high","name":RequestLogger.filterAPIRequest])
	// filters.append(["type":"response","priority":"low","name":RequestLogger.filterAPIResponse])

	return filters
}
