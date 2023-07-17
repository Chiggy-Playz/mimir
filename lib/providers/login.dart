class LoginProvider {
  String serverAddress = "";
  String username = "";
  String password = "";

  void setServerAddress(String serverAddress) {
    this.serverAddress = serverAddress;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

  String getServerAddress() {
    return serverAddress;
  }

  String getUsername() {
    return username;
  }

  String getPassword() {
    return password;
  }
}
