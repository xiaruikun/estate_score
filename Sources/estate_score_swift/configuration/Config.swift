import PerfectLib
import JSONConfig
import PerfectPostgreSQL
import PerfectLogger

func mainConfig() {

    logFileConfig()

    #if os(Linux)
		let fname = "./config/ApplicationConfigurationLinux.json"
        LogFile.info("加载 -- Linux.json -- 配置文件")
	#else
		let fname = "./config/ApplicationConfiguration.json"
        LogFile.info("加载 -- ApplicationConfiguration.json -- 配置文件")
	#endif

    if let configData = JSONConfig(name: fname) {
        if let dict = configData.getValues() {

            HTTPport = dict["httpport"] as! Int

            let host = "host=\(dict["SQL_host"]!) dbname=\(dict["SQL_dbname"]!)"
            let port = " port=\(dict["SQL_port"]!)"
            let login = " user=\(dict["SQL_user"]!) password=\(dict["SQL_password"]!)"
            let status = sqlConnection.connectdb(host+login+port)

            if status == .ok {
                LogFile.info("==== 连接数据库成功 ====")
            }else {
                LogFile.warning("==== 连接数据库失败 ====")
            }

        }
    }else {
        LogFile.error("==== 获取配置文件失败 ====")
    }
       
}

func logFileConfig() {
    LogFile.location = "./LogFiles/Logs.log"
}
