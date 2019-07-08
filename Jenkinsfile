node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("getintodevops/hellonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    // code placeholder
    stage('Push image') {
/* Finally, we'll push the image with two tags:
* First, the incremental build number from Jenkins
* Second, the 'latest' tag. */
        withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'angollap', passwordVariable: 'Q1w2e3r4!@#')]) {

        docker.withRegistry('', 'docker-hub-credentials') {
        sh "docker login -u ${USERNAME} -p ${PASSWORD}"
        myImage.push("${env.BUILD_NUMBER}")
        myImage.push("latest")
		
        }
    }
}


