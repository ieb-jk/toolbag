node {
   echo “This is a test”
//
//    agent any
//    stages {
//        stage('Create instance') {
//            steps {
//                dir('ops') {
//                    git credentialsId: 'f70573dd-4832-4d29-8018-6ffa0050f17a', poll: false, url: 'https://github.com/IEBTrading/Valkyrie.git'
//                }
//
//                dir('ops/terraform/allbeauty') {
//                    sh "terraform apply -var 'git_branch=${env.BRANCH_NAME}'"
//                    sh 'terraform output --json > ~/.terraform_output'
//                    sleep 20
//                }
//
//                dir('ops/playbooks/allbeauty') {
//                    sh 'ansible-playbook -i ../../terraform/inventory.php -s allbeauty.yml'
//                }
//            }
//        }
//    }
}
