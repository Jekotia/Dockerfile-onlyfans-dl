FROM python:slim AS git
RUN apt update
RUN apt install git -y
RUN git clone https://github.com/k0rnh0li0/onlyfans-dl.git /onlyfans-dl
RUN rm /onlyfans-dl/auth.json
#----------------------------------------------------------------------
FROM python:slim
RUN pip install requests

USER 1000:1000
COPY --chown=1000:1000 --from=git /onlyfans-dl /onlyfans-dl
WORKDIR /onlyfans-dl
RUN mkdir profiles
VOLUME /onlyfans-dl/auth.json
VOLUME /onlyfans-dl/profiles

ENTRYPOINT ["python", "/onlyfans-dl/onlyfans-dl.py"]