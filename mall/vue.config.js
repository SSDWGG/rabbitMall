module.exports ={
    devServer: {
        host:'0.0.0.0', 
        port: 8080,    
        disableHostCheck: true,
        open: true,
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
