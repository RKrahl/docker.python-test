FROM rkrahl/opensuse:42.3

RUN zypper --non-interactive addrepo http://download.opensuse.org/repositories/home:/Rotkraut:/Opt-Python/openSUSE_Leap_42.3/home:Rotkraut:Opt-Python.repo && \
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
        opt-python33 \
        opt-python33-PyYAML \
        opt-python33-lxml \
        opt-python33-pip \
        opt-python33-setuptools \
        opt-python34 \
        opt-python34-PyYAML \
        opt-python34-lxml \
        opt-python34-pip \
        opt-python34-setuptools \
        opt-python35 \
        opt-python35-PyYAML \
        opt-python35-lxml \
        opt-python35-pip \
        opt-python35-setuptools \
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
