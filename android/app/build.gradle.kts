apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'

android {
    compileSdkVersion 34
    ndkVersion "27.0.12077973"

    defaultConfig {
        applicationId "com.example.smart_homefinal"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
}
