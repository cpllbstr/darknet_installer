#!/bin/bash

if [[ ! $(sudo echo 0) ]]; then exit; fi

# Перед установкой требуется скачать файлы c официального сайта (https://developer.nvidia.com/cudnn): 
#   * libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb 
#   * libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb 
#   * libcudnn7-doc_7.6.5.32-1+cuda10.2_amd64.deb
# Эти файлы требуется поместить в ту же папку, что и этот скрипт.

## Установка CUDA 10.2
if [[ ! $(./cuda_install.sh) ]]; then echo "Error installing CUDA" && exit; fi

## Установка CUDnn
if [[ ! $(./cudnn_install.sh) ]]; then echo "Error installing CUDnn, check your files!" && exit; fi

## Проверка корректности установки CUDnn
if [[ ! $(./cudnn_check.sh) ]]; then echo "CUDnn test is not passed, maybe it's built wrong, try rebuilding it!" && exit; fi

## Установка darknet 
if [[ ! $(./darknet_install.sh) ]]; then echo "Error installing darknet!" && exit; fi

## Проверка корректности установки darknet
if [[ ! $(./darknet_load.sh) ]]; then echo "Erorr running darknet, maybe it's built wrong, try rebuilding it!" && exit; fi


