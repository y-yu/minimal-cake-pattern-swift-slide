import Foundation

protocol HashPasswordService: UsesReadConfigService {
  func hashBySha1(password: String) -> String
}

extension HashPasswordService {
  func hashBySha1(password: String) -> String {
    let data = password + readConfigService.readSalt()
    // このコードはイメージです
    return SHA1(data).toString()
  }
}

protocol UsesHashPasswordService {
  var hashPasswordService: HashPasswordService { get }
}

class MixInHashPasswordSerivce: HashPasswordService {
  let readConfigService: ReadConfigService
  
  init(_ configFile: String) {
    readConfigService = MixInReadConfigService(configFile)
  }
}

class MixInTestHashPasswordService: HashPasswordService {
  var readConfigService: ReadConfigService =
    MixInMockReadConfigService("dummySalt")
}

class MixInMockHashPasswordService: HashPasswordService {
  var readConfigService: ReadConfigService = MixInMockReadConfigService("dummySalt")
  
  func hashBySha1(password: String) -> String {
    return password + "_dummySalt"
  }
}
