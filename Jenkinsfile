pipeline {

    // Provisioning through EC2 plugin
    agent any

    stages {
        stage('Checkout') {
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
