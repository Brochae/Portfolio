const { createProxyMiddleware } = require('http-proxy-middleware');
const { env } = require('process');

const target = env.ASPNETCORE_HTTPS_PORT ? `https://localhost:${env.ASPNETCORE_HTTPS_PORT}` :
  env.ASPNETCORE_URLS ? env.ASPNETCORE_URLS.split(';')[0] : 'http://localhost:36131';

module.exports = function (app) {

    app.use(GetProxyMiddleware("profile"));

    function GetProxyMiddleware(context) {
        const proxy = createProxyMiddleware(["/" + context,], {
            target: target,
            secure: false,
            headers: {
                Connection: 'Keep-Alive'
            }
        });
        return proxy
    }
};
