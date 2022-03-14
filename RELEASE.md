## Release steps

```
pod trunk register support@glassfy.io 'GlassfyGlue' --description='macbook air'
pod lib lint --verbose
pod spec lint GlassfyGlue.podspec
pod trunk push GlassfyGlue.podspec
```
