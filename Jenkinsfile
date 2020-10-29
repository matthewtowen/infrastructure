pipeline {
  agent {
    label "label"
  }
  options {
                buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
  }
  environment {
      ART = credentials("token")
      ARTIFACTORY = "url"
  }
  stages {
    stage("Build"){
      // Build artefacts
      steps {
        ansiColor('xterm') {
          sh "ci/build.sh"
        }
      }
    }
    stage("Publish"){
      // publish to GCS
      steps {
        ansiColor('xterm') {
          sh "ci/publish.sh"
        }
      }
    }
  }
