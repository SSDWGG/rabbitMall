export const mixin={
    methods:{
        newwindow(path){
            let routeUrl = this.$router.resolve(path);
            window.open(routeUrl.href, '_blank');
        } //外链跳转
    },
}