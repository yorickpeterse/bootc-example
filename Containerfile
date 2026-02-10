FROM quay.io/fedora/fedora-bootc:43

RUN --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/var/lib/dnf,sharing=locked \
    --mount=type=tmpfs,target=/var/log \
    --mount=type=bind,source=dnf,target=/dnf,z \
    dnf install --assumeyes --quiet $(< /dnf/install.txt) >/dev/null

COPY overlay/ /

RUN --mount=type=bind,source=systemd,target=/systemd,z \
    systemctl disable $(< /systemd/disable.txt) && \
    systemctl enable $(< /systemd/enable.txt)

RUN bootc container lint --fatal-warnings
