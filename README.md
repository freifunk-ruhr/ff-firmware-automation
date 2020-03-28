# Firmware AUtomation
An Automation-Script which builds the freifunk-firmware with your configuration for all build-targets (automatically).

## Index
* [Requirements](#requirements)
* [Installation](#Installation)
* [License](#License)
* [Memorandium of Understanding](#Memorandium-of-Understanding)

## Requirements
* Docker
* GNU-Make *(optional)*

## Installation
1. Build the image  
`$ make build-container`  
2. Clone your configuration  
`$ CONFIG_REPOSITORY=giturl CONFIG_BRANCH=branch make clone-config`  
3. Build targets
`$ make build-targets`  
    * You can build specific targets by overriding `BUILD_TARGETS`.

## License
https://github.com/freifunk-ruhr/boilerplate/blob/master/LICENSE

## Memorandum of Understanding
https://blog.freifunk.net/2015/05/15/memorandum-understanding/
