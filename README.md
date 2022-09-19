# MyDockerFiles

用于**强对流天气识别系统2.0**(Severe Weather Identification System 2.0, Swis2.0)开发和发布的环境. 亦可用于本课题组内机器学习/深度学习模型开发

## 1. swis2_pytorch_dev
swis2的开发环境，有jupyter lab支持，matplotlib系列支持

```bash
  docker run --rm -it \
  -p your_host_port:8888 \     
  -v /your_work_path:/swis2 \     
  --gpus={all}{'"device=1,2,your_device_index"'} \     
  wangc94/swis2-pytorch-dev-cuda-11.3-ubuntu-20.04
```

## 2. swis2_pytorch_release
swis2的发布环境

```bash
docker run --rm -it \     
-v /your_work_path:/swis2 \     
--gpus={all}{'"device=1,2,your_device_index"'} \     
--user="$(id -u):$(id -g)" \     
wangc94/swis2_pytorch_release     
```

## 3. swis2_release_centos
当不需要docker部署时, 需要部署在公服中心的centos 7.5系统上，此为打包编译环境

```bash
docker run --rm -it \     
-v /your_work_path:/swis2 \     
--gpus={all}{'"device=1,2,your_device_index"'} \     
--user="$(id -u):$(id -g)" \     
wangc94/swis2_release_centos
```

## 4. pytorch-cuda-11.6
本人开发环境，有完整的开发环境支持
- pandas, scipy
- sklearn, pyotrch
- jupyter lab
- matplotlib, seaborn carotpy
- simsun, Jetbrains mono
- [more](pytorch-cuda-11.6/environment.yml)
```bash
docker run --rm -it \     
-p your_host_port:8888 \
-v /your_work_path:/work \     
--gpus={all}{'"device=1,2,your_device_index"'} \    
wangc94/pytorch-cuda-11.6
```
