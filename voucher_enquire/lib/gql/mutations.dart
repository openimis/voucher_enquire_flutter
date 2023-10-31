const tokenAuthMutation = r"""
mutation login($username: String!, $password: String!) {
  tokenAuth(username: $username, password: $password) {
    token,
    payload,
    refreshToken,
    refreshExpiresIn
  }
}
""";

const refreshTokenMutation = r"""
mutation refresh($refreshToken: String!) {
  refreshToken(refreshToken: $refreshToken) {
    token,
    payload, 
    refreshToken,
    refreshExpiresIn
  }
}
""";
