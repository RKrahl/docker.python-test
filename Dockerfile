FROM rkrahl/opensuse:15.2

RUN zypper --non-interactive addrepo http://download.opensuse.org/repositories/home:/Rotkraut:/Opt-Python/openSUSE_Leap_15.2/home:Rotkraut:Opt-Python.repo && \
    zypper --non-interactive modifyrepo --refresh home_Rotkraut_Opt-Python && \
    zypper --non-interactive --gpg-auto-import-keys refresh home_Rotkraut_Opt-Python && \
    zypper --non-interactive install \
        glibc-locale \
        less \
        opt-python27 \
        opt-python27-PyYAML \
        opt-python27-lxml \
        opt-python27-pip \
        opt-python27-setuptools \
        opt-python36 \
        opt-python36-PyYAML \
        opt-python36-lxml \
        opt-python36-pip \
        opt-python36-setuptools \
        opt-python37 \
        opt-python37-PyYAML \
        opt-python37-lxml \
        opt-python37-pip \
        opt-python37-setuptools \
        opt-python38 \
        opt-python38-PyYAML \
        opt-python38-lxml \
        opt-python38-pip \
        opt-python38-setuptools \
        opt-python39 \
        opt-python39-PyYAML \
        opt-python39-lxml \
        opt-python39-pip \
        opt-python39-setuptools \
        opt-python310 \
        opt-python310-PyYAML \
        opt-python310-lxml \
        opt-python310-pip \
        opt-python310-setuptools \
        patch \
        sudo \
        tar && \
    ln -sf ../usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN groupadd abuild && \
    useradd -g abuild -c "Build user" -d /home/abuild abuild && \
    mkdir -p /home/abuild/bin
COPY bashrc /home/abuild/.bashrc
COPY allpip /home/abuild/bin
RUN chown -R abuild:abuild /home/abuild && \
    chmod a+x /home/abuild/bin/allpip

COPY sudoers /etc/sudoers

USER abuild
WORKDIR /home/abuild
ENV PATH /home/abuild/bin:/opt/python/bin:/usr/local/bin:/usr/bin:/bin

RUN allpip install pytest

CMD ["bash"]
