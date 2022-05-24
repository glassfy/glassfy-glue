package io.glassfy.glue

object Configuration {
    const val compileSdk = 28
    const val targetSdk = 28
    const val minSdk = 21
    private const val majorVersion = 1
    private const val minorVersion = 1
    private const val patchVersion = 80
    const val versionName = "$majorVersion.$minorVersion.$patchVersion"
    const val snapshotVersionName = "$versionName-SNAPSHOT"
    const val artifactGroup = "io.glassfy"
    const val artifactId = "androidglue"
    const val ghProjectName = "glassfy-glue"
}