# 常用packages

1. [Reactotron](https://infinite.red/reactotron), 开源[github](https://github.com/infinitered/reactotron)，可以调试event的React Native工具。
1. [react-native-elements](https://github.com/react-native-elements/react-native-elements), 一个跨平台的React Native UI Kit, 它跨web!
2. [react-native-vector-icons](https://github.com/oblador/react-native-vector-icons), 矢量图标库。如果不能正常工作，可以运行`yarn react-native link`, `pod install`
3. [Lottie](https://github.com/react-native-community/lottie-react-native), 矢量动画库.
4. [React Native Login Screen](https://github.com/WrathChaos/react-native-login-screen), 一个可配置的登录界面。注意这个npm package依赖于很多其它的包，需要手动安装，github首页有说明。

清缓存脚本:

~~~json
// 放入package.json/script下面
// 运行: yarn clean
"clean": "watch-del-all && watch-del-all && rm -rf $TMPDIR/react-native-packager-cache-* && rm -rf $TMPDIR/metro-bundler-cache-*"
~~~

# Lottie

1. 在react-native下面如果加载图片失败，可以把图片通过base64编码到data.json里面去, 放p字段下面.
2. 
# 灵异现象

1. 使用story的时候，在开启react native debug的情况下，会遇到code更新没有反应的情况, 重启电脑都没有用，删除了的story会一直出现，新加的story不出现。 解决办法: 关闭debug.

# 技巧

1. 渲染正方形: `aspectRatio: 1`
2. 

# react navigation

1. 隐藏指定screen的导航栏, 更详细解释请看[react navigation optoins](https://reactnavigation.org/docs/stack-navigator/#options)

~~~jsx
<Tab.Screen name="旅行团" component={()=>(
    <Stack.Navigator initialRouteName="Tour">
        {/*headerMode="none">*/}
        <Stack.Screen name="Tour" component={tour}  options={{
            header: null,
            headerMode: 'none',
            headerShown: false
        }}>

        </Stack.Screen>
        <Stack.Screen name={"Friends"} component={Friends} ></Stack.Screen>
    </Stack.Navigator>
)
~~~

1. 透明堆栈, https://reactnavigation.org/docs/stack-navigator/#transparent-modals

# 多平台方案

1. tarojs


# storybook

1. 根据环境变量启动storybook：
    1. 安装[https://github.com/babel/minify/tree/master/packages/babel-plugin-transform-inline-environment-variables](https://github.com/babel/minify/tree/master/packages/babel-plugin-transform-inline-environment-variables), `npm install babel-plugin-transform-inline-environment-variables --save-dev`
    2. 修改babel.config.js, 添加下面的行: `plugins: ["transform-inline-environment-variables"],`
    3. 修改package.json, storybook命令修改如下: `"storybook": "start-storybook -p 7007 | RN_STORY_ENTRY=true react-native start",`
    4. 在index.js里面判断process.env: 
        ~~~javascript
        const rn_story_entry = process.env['RN_STORY_ENTRY'];
        if(rn_story_entry){
            storiesOf('Game', module).add('Game', () => <App />)
            AppRegistry.registerComponent(appName, () => StorybookUIRoot)
        }
        else{
            AppRegistry.registerComponent(appName, () => App);
        }
        ~~~
    5. 命令行启动storybook的时候就会自动切换到storybook里面去: `yarn storybook`

# 按原始比例缩放显示图片

1. 单独只用Image,然后设置宽高, resizeMode: 'contain', 这是不会正常工作的。可能是做布局的时候Image布局有bug。
1. 正确做法： 包一层View, 做布局。 设置宽度'100%', aspectRatio为图片宽高比。
2. View下面放置Image或者ImageBackground, width '100%', height '100%', resizeMode: 'contain'
3. Done

~~~jsx

            <View style={{width: '100%', aspectRatio: 751/351.0}}>
                <ImageBackground source={require("./assets/img/head.png")} style={{ width: '100%', height: '100%', resizeMode: 'contain', justifyContent: 'center'}} />
            </View>
~~~