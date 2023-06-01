function fn() {
  var accessTokenPath = 'file:C:/Users/msalah/OneDrive - SQLI/Documents/SeleniumProjects/AdvancedExercicesAPI/myproject/target/access-token.txt';
  var accessToken = karate.read(accessTokenPath);

  var config = {
    baseUrl: 'https://simple-books-api.glitch.me',
    accessToken: accessToken
  };

  return config;
}
