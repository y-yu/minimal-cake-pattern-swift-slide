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

class HashPasswordSerivceImpl: HashPasswordService {
  let readConfigService: ReadConfigService
  
  init(_ configFile: String) {
    readConfigService = ReadConfigServiceImpl(configFile)
  }
}

class HashPasswordServiceTestImpl: HashPasswordService {
  var readConfigService: ReadConfigService =
    ReadConfigServiceMockImpl("dummySalt")
}

class HashPasswordServiceMockImpl: HashPasswordService {
  var readConfigService: ReadConfigService = ReadConfigServiceMockImpl("dummySalt")
  
  func hashBySha1(password: String) -> String {
    return password + "_dummySalt"
  }
}

class HashPasswordServiceNgImpl: HashPasswordService {
    func hashBySha1(password: String) -> String {
        return "ng"
    }
}
