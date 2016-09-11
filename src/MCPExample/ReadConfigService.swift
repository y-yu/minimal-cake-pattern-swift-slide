import Foundation

protocol ReadConfigService {
  var configName: String { get }
  
  func readSalt() -> String
}

extension ReadConfigService {
  private func readFile() -> Optional<String> {
    if ファイルをオープンする {
      return Optional.Some(ファイルの中身)
    } else {
      return Optional.None
    }
  }
}

protocol UsesReadConfigService {
  var readConfigService: ReadConfigService { get }
}

class ReadConfigServiceImpl: ReadConfigService {
  let configName: String
  
  init(_ str: String) {
    configName = str
  }
  
  func readSalt() -> String {
    // 本当はもっとちゃんとやる……
    return readFile()!
  }
}

class ReadConfigServiceMockImpl: ReadConfigService {
  var configName: String = "dummy"
  let dummySalt: String
  
  init(_ salt: String) {
    dummySalt = salt
  }
  
  func readSalt() -> String {
    return dummySalt
  }
}
