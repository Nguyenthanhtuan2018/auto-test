var payload = {
  mobile: mobile,
  deviceId: deviceId,
  password: password
};

var response = http.post(loginUrl, {
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify(payload)
});

if (!response.ok) {
  throw "Login API failed, status=" + response.status + ", body=" + response.body;
}

var body = json(response.body);
var status = body.status || {};
var data = body.data || {};
var auth = data.auth || {};
var user = data.user || {};

if (!status.success) {
  throw "API failed: " + (status.message || "Unknown error");
}

if (!auth.token) {
  throw "Không tìm thấy data.auth.token trong response";
}

output.auth = {
  token: auth.token,
  tokenExpireAt: auth.tokenExpireAt,
  refreshToken: auth.refreshToken
};

var name = user.name || "";

function escapeRegex(str) {
  return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

var escapedName = escapeRegex(name);

output.user = {
  userId: user.userId,
  name: name,
  displayRegex: ".*" + escapedName + ".*"
};

console.log("Login API OK. User name =", name);
