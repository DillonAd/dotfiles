FROM ubuntu

RUN apt update
RUN apt install -y sudo curl

RUN touch /etc/sudoers
RUN echo "root ALL=(ALL) ALL" >> /etc/sudoers
RUN echo "df ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "Defaults    env_reset" >> /etc/sudoers
RUN echo 'Defaults    secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> /etc/sudoers
RUN chmod 440 /etc/sudoers

RUN useradd --create-home  df
RUN usermod -aG sudo df
USER df

WORKDIR /home/df/
COPY ./ /home/df/.dotfiles
RUN sudo bash ./.dotfiles/configure.sh

ENTRYPOINT [ "/bin/bash" ]

