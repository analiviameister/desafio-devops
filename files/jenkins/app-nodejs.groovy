node {
	
    stage ("SCM"){
		git(branch: "", credentialsId: 'JenkinsUserInGitLab', url: "")
		dir("configs-templates-deployment") {
			git(branch: 'master', credentialsId: 'JenkinsUserInGitLab', url: 'git@gitlab.mateus:infra/configs-templates-deployment.git')
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
	
	stage ("Deploy to Kubernetes Dev"){
			def pom = readMavenPom file: ''
			def dockerRegistry = 'rdocker.mateus:5001'
			def imageDocker = "${dockerRegistry}/ithappens/${pom.artifactId}:${pom.version}-"
			def deploymentFileName = 'configs-templates-deployment/deployment-java-default.yaml'
			def groovyFile = "configs-templates-deployment/conf/java//master//${pom.artifactId}.groovy"
			def namespace = 'java-pro'
			def nameDeployment = "${pom.artifactId}-prod"
			if("" == "staging") {
				dockerRegistry = 'registry.hom.infra.mateus'
				imageDocker = "${dockerRegistry}/ithappens/${pom.artifactId}:${pom.version}-${BUILD_NUMBER}-"
				groovyFile = "configs-templates-deployment/conf/java//homologacao//${pom.artifactId}.groovy"
				namespace = 'java-hom'
				nameDeployment = "${pom.artifactId}-hom"
			}
			if("" == "dev") {
				dockerRegistry = 'registry.dev.infra.mateus'
				groovyFile = "configs-templates-deployment/conf/java//dev//${pom.artifactId}.groovy"
				imageDocker = "${dockerRegistry}/ithappens/${pom.artifactId}:${pom.version}-${BUILD_NUMBER}-"
				namespace = 'java-dev'
				nameDeployment = "${pom.artifactId}-dev"
			}
			withEnv(["NAME_DEPLOYMENT=${nameDeployment}", "IMAGE_DOCKER=${imageDocker}"]) {
				withKubeConfig(
				caCertificate: '', clusterName: 'ClusterDevPulse',
				contextName: 'kubernetes-admin@kubernetes', credentialsId: 'token-k8s-dev',
				namespace: '', serverUrl: 'https://k8s-lb.dev.mateus:6443',
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
	
	} finally {
		notify.start(currentBuild)
	}
}
