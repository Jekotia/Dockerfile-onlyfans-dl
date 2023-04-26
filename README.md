This container is intended to provide an easily runnable environment for [k0rnh0li0/onlyfans-dl](https://github.com/k0rnh0li0/onlyfans-dl). Configure auth.json according to that project, and then run the container with volume mounts for `/onlyfans-dl/auth.json` & `/onlyfans-dl/profiles`. The entrypoint is onlyfans-dl.py.

## Docker build example
```
docker build --progress=plain --tag onlyfans-dl:latest ./
```

## Docker run example
```bash
docker run \
	--name <container_name> -d \
	-v <onlyfans-dl_dir>/auth.json:/onlyfans-dl/auth.json:ro \
	-v <onlyfans-dl_dir>/profiles:/onlyfans-dl/profiles \
	jekotia/onlyfans-dl:latest all
```

## Docker compose example
```yaml
services:
  onlyfans-dl:
    image: jekotia/onlyfans-dl:latest
    container_name: onlyfans-dl
    command: all
    volumes:
      - <onlyfans-dl_dir>/auth.json:/onlyfans-dl/auth.json:ro
      - <onlyfans-dl_dir>/profiles:/onlyfans-dl/profiles
```