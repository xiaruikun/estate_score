//
//  HandlerTests.swift
//  COpenSSL
//
//  Created by PlutusCat on 2018/8/29.
//

import PerfectHTTP
import StORM
import JSONConfig

extension Handlers {

    static func testHandler(data: [String:Any]) throws -> RequestHandler {
        return { request, response in


//            var jsonDict = Dictionary<String, Any>()

            let _ = request.params().first(where: { (value, _) in

                print("value ==", value)

//                jsonDict = JSON(parseJSON: value).dictionaryValue

                return true
            })

            let res = sqlConnection.exec(statement: " select  community_id,communityname,city_code from community_1101 limit 10")

            var jsonArray = Array<Any>()

            for x in 0..<res.numTuples() {
                var resDic = Dictionary<String, String>()

                let c1 = res.getFieldInt(tupleIndex: x, fieldIndex: 0)
                let c2 = res.getFieldString(tupleIndex: x, fieldIndex: 1)
                let c3 = res.getFieldString(tupleIndex: x, fieldIndex: 2)

                resDic["community_id"] = "\(c1!)"
                resDic["communityname"] = "\(c2!)"
                resDic["city_code"] = "\(c3!)"

                jsonArray.append(resDic)
            }
            res.clear()
            sqlConnection.close()

            let jsonString = Handlers.baseResponseBodyJSONData(status: 200, message: "成功", data: jsonArray)
            response.setBody(string: jsonString)                           //响应体
            response.completed()

        }
    }

}


