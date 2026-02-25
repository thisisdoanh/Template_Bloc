import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.thisisdoanh.template.bloc.dev"
            resValue(type = "string", name = "app_name", value = "Dev: Template Bloc")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.thisisdoanh.template.bloc"
            resValue(type = "string", name = "app_name", value = "Template Bloc")
        }
    }
}