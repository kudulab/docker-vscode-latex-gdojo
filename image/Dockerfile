FROM debian:9.8-slim

# Install prerequisites for Dojo
RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  gnupg2 git ca-certificates wget apt-utils apt-transport-https locales \
  git unzip nano xz-utils sudo

# Install Dojo scripts
ENV DOJO_VERSION=0.8.0
RUN git clone --depth 1 -b ${DOJO_VERSION} https://github.com/kudulab/dojo.git /tmp/dojo_git &&\
  /tmp/dojo_git/image_scripts/src/install.sh && \
  rm -r /tmp/dojo_git && \
  echo 'dojo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Install visual studio code
ENV VSCODE_VERSION="1.41.1"
RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install \
  libgtk-3-0 libasound2 libatk1.0-0 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 \
  libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
  libxtst6 libsecret-1-0 libxss1 libnotify4 libnss3 libxkbfile1 libgconf-2-4 libxtst6 &&\
  apt-get clean && rm -rf /tmp/* /var/tmp/* && rm -rf /var/lib/apt/lists/* &&\
  wget -O code.deb https://vscode-update.azurewebsites.net/${VSCODE_VERSION}/linux-deb-x64/stable &&\
  dpkg -i code.deb && rm code.deb

# Install prerequisites for Latex
RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  texlive latexmk

# Install vscode extensions
RUN sudo -E -H -u dojo /bin/bash -c "code --install-extension James-Yu.latex-workshop"
RUN sudo -E -H -u dojo /bin/bash -c "code --install-extension streetsidesoftware.code-spell-checker"

# Install vscode settings
COPY vscode_settings.json /home/dojo/.config/Code/User/settings.json
RUN chown dojo:dojo /home/dojo/.config/Code/User/settings.json

# For Bash
COPY profile /home/dojo/.profile
COPY bashrc_default /home/dojo/.bashrc
RUN chown dojo:dojo -R /home/dojo

COPY etc_dojo.d/scripts/* /etc/dojo.d/scripts/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["/bin/bash"]
