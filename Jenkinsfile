
podTemplate(
        label: label,
        containers: [
                containerTemplate(name: 'debian', image: "debian:stretch", ttyEnabled: true, command: 'cat'),
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
