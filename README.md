# CUDA Docker Images

Collection of CUDA images for builds (like PyTorch). Hosted to `ghcr.io/bendabir/cuda`. Only Linux x64 is supported. Images are based on Ubuntu 24.04 to avoid issues with GLIBC with GHAs.

## Compatibility

| CUDA Version | Ubuntu Version | Status | CUDA Keyring Version | Supported |
| ------------ | -------------- | ------ | -------------------- | :-------: |
| 8.0          | 16.04          | EoL    | 1.0                  |    ❌     |
| 9.0          | 16.04          | EoL    | 1.0                  |    ❌     |
| 9.1          | 16.04          | EoL    | 1.0                  |    ✔️     |
| 9.2          | 16.04          | EoL    | 1.1                  |    ✔️     |
| 10.0         | 18.04          | EoL    | 1.1                  |    ✔️     |
| 10.1         | 18.04          | EoL    | 1.1                  |    ✔️     |
| 10.2         | 18.04          | EoL    | 1.1                  |    ✔️     |
| 11.0         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.1         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.2         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.3         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.4         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.5         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.6         | 20.04          | LTS    | 1.1                  |    ✔️     |
| 11.7         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 11.8         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 12.0         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 12.1         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 12.2         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 12.3         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 12.4         | 22.04          | LTS    | 1.1                  |    ✔️     |
| 12.5         | 24.04          | LTS    | 1.1                  |    ✔️     |
| 12.6         | 24.04          | LTS    | 1.1                  |    ✔️     |

## Build

Images can be manually built as follow. Please check the compatibility table above to set versions accordingly.
The Ubuntu version is only used to target the appropriate repository to download the CUDA Toolkit. Images are all based on Ubuntu 24.04.

```bash
export CUDA_VERSION="12.1"
export UBUNTU_VERSION="22.04"
export CUDA_KEYRING_VERSION="1.1"

docker build \
  -t "ghcr.io/bendabir/cuda:$CUDA_VERSION" \
  -f "images/linux.Dockerfile" \
  --platform linux/amd64 \
  --build-arg "CUDA_VERSION=$CUDA_VERSION" \
  --build-arg "UBUNTU_VERSION=$UBUNTU_VERSION" \
  --build-arg "CUDA_KEYRING_VERSION=$CUDA_KEYRING_VERSION" \
  .
```
