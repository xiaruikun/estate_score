import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectLogger
import PerfectPostgreSQL

var HTTPport = 8181
var sqlConnection = PGConnection()

mainConfig()

// let httplogger = RequestLogger()
// RequestLogFile.location = "./webLog.log"

var confData: [String:[[String:Any]]] = [
    "servers": [
        [
            "name":"estate_score_swift_server",
            "port":HTTPport,
            "routes":[],
            "filters":[]
        ]
    ]
]

// Load Filters
confData["servers"]?[0]["filters"] = filters()

// Load Routes
confData["servers"]?[0]["routes"] = mainRoutes()

do {
    // Launch the servers based on the configuration data.
    try HTTPServer.launch(configurationData: confData)
} catch {
    // fatal error launching one of the servers
//    fatalError("\(error)")
    LogFile.error("\(error)")
}

/// 创建 http server 服务
// let networkServer = NetworkServerManager(root: "webroot", port: UInt16(HTTPport))
// networkServer.configure()
// networkServer.startServer()

