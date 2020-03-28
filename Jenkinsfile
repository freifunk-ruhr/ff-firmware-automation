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
        choice(name: 'GLUON_DEBUG', choices: ['1', '2'], description: 'Build with -j1 and V=s for debugging build errors')
        string(name: 'GLUON_CORES', defaultValue: '2', description: 'Cores that should be assigned to the docker container and to the gluon firmware build process')
        
		booleanParam(name: 'ar71xx_generic', defaultValue: true)
		booleanParam(name: 'ar71xx_mikrotik', defaultValue: true)
		booleanParam(name: 'ar71xx_nand', defaultValue: true)
		booleanParam(name: 'ar71xx_tiny', defaultValue: true)
		booleanParam(name: 'brcm2708_bcm2708', defaultValue: true)
		booleanParam(name: 'brcm2708_bcm2709', defaultValue: true)
		booleanParam(name: 'brcm2708_bcm2710', defaultValue: false)
		booleanParam(name: 'ipq806x', defaultValue: true)
		booleanParam(name: 'mpc85xx_generic', defaultValue: true)
		booleanParam(name: 'mvebu', defaultValue: true)
		booleanParam(name: 'ramips_mt7621', defaultValue: true)
		booleanParam(name: 'ramips_mt7628', defaultValue: true)
		booleanParam(name: 'ramips_rt305x', defaultValue: true)
		booleanParam(name: 'sunxi', defaultValue: false)
		booleanParam(name: 'x86_generic', defaultValue: true)
		booleanParam(name: 'x86_geode', defaultValue: true)
		booleanParam(name: 'x86_64', defaultValue: true)
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
            archiveArtifacts artifacts: 'output/', fingerprint: true
        }
    }
}
