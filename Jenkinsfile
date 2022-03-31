@Library('tfc-lib') _

dockerConfig = getDockerConfig(['MATLAB','Vivado'], matlabHSPro=false)
dockerConfig.add("-e MLRELEASE=R2021a")
dockerHost = 'docker'

////////////////////////////

packages = ['master']

stage("Build Toolbox") {
    dockerParallelBuild(packages, dockerHost, dockerConfig) { 
        branchName ->
        withEnv(['PACKAGE='+branchName]) {
            checkout scm
            sh 'git submodule update --init'
            sh 'python3 CI/scripts/rename_common.py'
            sh 'make -C ./CI/scripts gen_tlbx'
            archiveArtifacts artifacts: '*.mltbx'
            stash includes: '**', name: 'builtSources', useDefaultExcludes: false
        }
    }
}

/////////////////////////////////////////////////////

classNames = ['AD4630']

stage("Hardware Streaming Tests") {
    dockerParallelBuild(classNames, dockerHost, dockerConfig) { 
        branchName ->
        withEnv(['HW='+branchName]) {
            unstash "builtSources"
            sh 'echo ${HW}'
            // sh 'make -C ./CI/scripts test_streaming'
        }
    }
}

//////////////////////////////////////////////////////

node {
    stage('Deploy Development') {
        unstash "builtSources"
        uploadArtifactory('PrecisionToolbox','*.mltbx')
    }
    if (env.BRANCH_NAME == 'master') {
        stage('Deploy Production') {
            unstash "builtSources"
            uploadFTP('PrecisionToolbox','*.mltbx')
        }
    }
}

