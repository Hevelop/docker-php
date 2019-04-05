def label = env.BUILD_TAG.replace("%2F", "-")

podTemplate(
        label: label,
        containers: [
                containerTemplate(name: 'debian', image: "eugenmayer/make:latest", ttyEnabled: true, command: 'cat'),
        ],
        imagePullSecrets: [ 'artifactory' ]
) {
    node(label) {
        container('debian') {
            stage('prepare') {
                checkout scm
            }

            stage("build images") {
                sh "make publish"
            }
        }
    }
}
