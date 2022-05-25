module.exports ={
    devServer: {
        host:'0.0.0.0',             //只要使用localhost就会出现尺寸错乱
        // host: 'www.test.com',//如果是真机测试，就使用这个IP
        port: 8080,     //也可以在webstorm里面修改
        disableHostCheck: true,
        // https: false, // https:{type:Boolean}
        open: true, // 配置自动启动浏览器
    },
    configureWebpack:{
        resolve:{
            alias:{
                "assets":"@/assets",
                "common":"@/common",
                "components":"@/components",
                "network":"@/network",
                "views":"@/views",
                "store":"@/store",
            }
        }
    }
}
{
    // // 基本路径 baseURL已经过时
    // publicPath: './',
    // // 输出文件目录
    // outputDir: 'dist',
    // // eslint-loader 是否在保存的时候检查
    // lintOnSave: true,
    // // use the full build with in-browser compiler?
    // // https://vuejs.org/v2/guide/installation.html#Runtime-Compiler-vs-Runtime-only
    // // compiler: false,
    // // webpack配置
    // // see https://github.com/vuejs/vue-cli/blob/dev/docs/webpack.md
    // chainWebpack: () => {},
    // configureWebpack: () => {},
    // // vue-loader 配置项
    // // https://vue-loader.vuejs.org/en/options.html
    // // vueLoader: {},
    // // 生产环境是否生成 sourceMap 文件
    // productionSourceMap: true,
    // // css相关配置
    // css: {
    //     // 是否使用css分离插件 ExtractTextPlugin
    //     extract: true,
    //     // 开启 CSS source maps?
    //     sourceMap: false,
    //     // css预设器配置项
    //     loaderOptions: {},
    //     // 启用 CSS modules for all css / pre-processor files.
    //     modules: false
    // },
    // // use thread-loader for babel & TS in production build
    // // enabled by default if the machine has more than 1 cores
    // parallel: require('os').cpus().length > 1,
    // // 是否启用dll
    // // See https://github.com/vuejs/vue-cli/blob/dev/docs/cli-service.md#dll-mode
    // // dll: false,
    // // PWA 插件相关配置
    // // see https://github.com/vuejs/vue-cli/tree/dev/packages/%40vue/cli-plugin-pwa
    // pwa: {},
    // // webpack-dev-server 相关配置
    // devServer: {
    //     open: process.platform === 'darwin',
    //     disableHostCheck: true,
    //     host: 'www.test.com',//如果是真机测试，就使用这个IP
    //     port: 1234,
    //     https: false,
    //     hotOnly: false,
    //     before: app => {}
    // },
    // // 第三方插件配置
    // pluginOptions: {
    //     // ...
    // },
}