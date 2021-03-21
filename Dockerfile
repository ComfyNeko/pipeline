FROM PHP 7.2.24-0ubuntu0.18.04.7
 RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY . /usr/bin/php
