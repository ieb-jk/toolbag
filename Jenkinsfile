pipeline {

    // Provisioning through EC2 plugin
    agent any

    stages {
        stage('Checkouty') {
            steps {
                echo 'Checkout PR'
            }
        }

        stage('UnitTesting') {
            steps {
                echo 'PhpUnit - contained code testing upto mock / stubbed php scripts. test Migration scripts and scan for errors'
            }
        }

        stage('ParallelTesting') {
            steps {
                parallel (
                    "StaticAnalysis" : { echo 'SonarPHP - Codesniffer, LinesOfCode, MessDetector, CopyPaste Detector, CodeBrowser, DOX' },
                    "Integration" : { echo 'BrowserStack with end to end testing' },
                    "LoadTesting" : { echo 'JMeter, Bench, Seige' },
                    "Security" : { echo 'RIPs security scanning' }
                )
            }
        }

        stage('PromoteToDark') {
            steps {
                echo 'Initially deployed to staged environment for final approval, before switching live/dark urls'
            }
        }
    }
}

def gitURL() {
    sh "git config --get remote.origin.url > .git/giturl"
    return readFile(".git/giturl").trim()
}

def getSHA() {
    sh "git rev-parse origin/${env.BRANCH_NAME} > .git/lastcommit"
    return readFile(".git/lastcommit").trim()
}


// SlackNotifier
def slackit(color, message, channel) {
    slackSend channel: channel, teamDomain: 'IEB-ITCrowd', token: '99999999999999999999', color: color, message: '<' + env.BUILD_URL + '|[' + env.JOB_NAME + ' build ' + env.BUILD_NUMBER + ']>\n' + message
}


// Build Status Stuff
void buildStatus(String context, String message, String state) {
    buildStatus(context, message, state, gitURL(), getSHA());
}

void buildStatus(String context, String message, String state, url, commitSha) {
    step([
        $class : "GitHubCommitStatusSetter",
        reposSource : [$class: "ManuallyEnteredRepositorySource", url: url],
        commitShaSource : [$class: "ManuallyEnteredShaSource", sha: commitSha],
        contextSource : [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/$context"],
        errorHandlers : [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
        statusResultSource: [$class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]]]
        ]);
}

