
var SammanClient = require('./lib/SammanClient')

var logger = require('./lib/logging')('samman-auth:Client');

// function SammanAuthentication(config, stuff) {
//   var self = Object.create(SammanAuthentication.prototype)
//   // config for this module
//   self._config = config
//   logger.debug(self._config)

//   var api = self._config.api
//   if (!api) throw new Error('SAMMAN Auth API 地址必须配置')

//   var token = self._config.token
//   if (!token) throw new Error('SAMMAN Auth API toekn 必须配置')

//   var localurl = self._config.localurl
//   if (!localurl) throw new Error('本地url必须配置')

//   this.client = new SammanClient(api, token, localurl)
// }

// SammanAuthentication.prototype.authenticate = function (user, password, cb) {
//   return this.client.login(user,password).then(function(result){
//     if(result.login){
//       cb(null,[user])
//     }else{
//       cb(result.message,false);
//     }
//   })
// }

module.exports = DelegatedAuthentication

function DelegatedAuthentication(config, stuff) {
  var self = Object.create(DelegatedAuthentication.prototype)

  // config for this module
  self._config = config

  var api = self._config.api
  if (!api) throw new Error('SAMMAN Auth API 地址必须配置')

  var token = self._config.token
  if (!token) throw new Error('SAMMAN Auth API toekn 必须配置')

  var localurl = self._config.localurl
  if (!localurl) throw new Error('本地url必须配置')

  return self
}

DelegatedAuthentication.prototype.authenticate = function (user, password, cb) {
  var self = this
  var client = new SammanClient(self._config.api, self._config.token, self._config.localurl)
    return client.login(user,password).then(function(result){
    if(result.login){
      cb(null,[user])
    }else{
      cb(result.message,false);
    }
  })
}


module.exports = DelegatedAuthentication
