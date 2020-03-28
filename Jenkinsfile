pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
        timestamps()
    }
    parameters {
        string(name: 'CONFIG_REPOSITORY', defaultValue: 'https://gitlab.freifunk-kitzingen.de/derhoffmann/site-ffvec.git', description: 'The repository with the configuration')
        string(name: 'CONFIG_BRANCH', defaultValue: 'master', description: 'The branch with the configuration')
        string(name: 'GLUON_VERSION', defaultValue: 'master', description: 'Gluon version')
        choice(name: 'GLUON_DEBUG', choices: ['0', '1'], description: 'Build with -j1 and V=s for debugging build errors')
        string(name: 'GLUON_CORES', defaultValue: '1', description: 'Cores that should be assigned to the docker container and to the gluon firmware build process')
        string(name: 'BUILD_TARGETS', defaultValue: 'ar71xx-generic ar71xx-tiny r71xx-nand th79-generic rcm2708-bcm2708 brcm2708-bcm2709 ipq40xx-generic ipq806x-generic lantiq-xrx200 lantiq-xway mpc85xx-generic mpc85xx-p1020 ramips-mt7620 ramips-mt7621 ramips-mt76x8 ramips-rt305x sunxi-cortexa7 x86-generic x86-geode x86-64')
    }
    stages {
        stage ('Checkout Firmware-Automation') {
            steps {
                sh 'git clone https://github.com/freifunk-ruhr/ff-firmware-automation.git .'
            }
        }
        stage ('Build image') {
            steps {
                sh 'make build-container'
            }
        }
        stage ('Create configuration') {
            steps {
                sh 'make clone-config'
            }
        }
        stage ('Build firmware') {
            steps {
                sh 'make build-targets'
            }
        }
    }
    post {
        always {           
            archiveArtifacts(artifacts: 'output/', fingerprint: true)
        }
    }
}
