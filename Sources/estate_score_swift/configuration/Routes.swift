import PerfectHTTPServer

func mainRoutes() -> [[String: Any]] {

	var routes: [[String: Any]] = [[String: Any]]()
	// Special healthcheck
	routes.append(["method":"post", "uri":"/healthcheck", "handler":Handlers.healthcheck])

	// Handler for home page
	routes.append(["method":"post", "uri":"/", "handler":Handlers.main])

    routes.append(["method":"post", "uri":"/test", "handler": Handlers.testHandler])

	return routes
}
