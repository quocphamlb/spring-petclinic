FROM anapsix/alpine-java

LABEL maintainer="quoc.pham@spiraledge.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8001 || exit 1

# tell docker what port to expose
EXPOSE 8001
