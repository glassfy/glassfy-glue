## Release steps

```
pod trunk register support@glassfy.net 'GlassfyGlue' --description='macbook air'
pod lib lint --verbose
pod spec lint GlassfyGlue.podspec
pod trunk push GlassfyGlue.podspec
```
