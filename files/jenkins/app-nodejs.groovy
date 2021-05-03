node {
	
	stage ("SCM"){
		git(branch: "", credentialsId: 'JenkinsUserInGitLab', url: "")
		git(branch: 'master', credentialsId: 'JenkinsUserInGitLab', url: '')
	}

    stage ("SCM"){
		git(branch: "", credentialsId: '', url: "")
		dir("configs-app") {
			git(branch: 'master', credentialsId: '', url: '')
		}
	}

    stage('App Test'){

         env.NODE_ENV = "test"

         print "Environment will be : ${env.NODE_ENV}"

         sh 'node -v'
         sh 'npm prune'
         sh 'npm install'
         sh 'npm test'

    }

    
    stage ("Docker Build"){
		
		def dockerRegistry = 'registry.desafio:5001'
		def dockerTool = tool name: 'docker'
			
		configFileProvider([ configFile(fileId: 'DockerfileNodeJs', targetLocation: 'Dockerfile') ]) {
            def dockerRegistry  = "registry.desafio:5001"
            def imageDocker     = "${dockerRegistry}/${binaryApp}-${binaryType}-${binaryEnv}"
            def generatedImage  = docker.build("${imageDocker)}:${env.BUILD_ID}")
             
                generatedImage.push()
				generatedImage.push("latest")
        }
	}
	
	stage ("Deploy to Kubernetes "){
		def dockerRegistry = 'registry.desafio:5001'
		def imageDocker = ""
		def deploymentFileName = ""
		def groovyFile = ""
		def namespace = 'nodejs'
		def nameDeployment = "${}"
			
		withEnv(["NAME_DEPLOYMENT=${nameDeployment}", "IMAGE_DOCKER=${imageDocker}"]) {
			withKubeConfig(
			caCertificate: '', clusterName: 'DesafioDevOps',
			contextName: 'kubernetes-admin@kubernetes', credentialsId: '',
			namespace: '', serverUrl: 'https://:6443',
			) {
				load "${groovyFile}"
				sh 'rm -rf deployment.yaml'
				sh "cat ${deploymentFileName} | envsubst > deployment.yaml"
				sh "kubectl --namespace=${namespace} apply -f deployment.yaml --record=true"
				sh "kubectl set image deployment.v1.apps/${nameDeployment} ${nameDeployment}-container=${imageDocker} --namespace=${namespace} --record=true"
				sleep 30
				sh "kubectl rollout status deployment.v1.apps/${nameDeployment} --namespace=${namespace}"
			}
		}		
	}
	
}

