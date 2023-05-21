FROM eclipse-temurin:11-jre-focal

RUN groupadd --gid 1000 suwayomi && useradd  --uid 1000 --gid suwayomi --no-log-init suwayomi;

RUN mkdir -p /home/suwayomi && chown -R suwayomi:suwayomi /home/suwayomi

USER suwayomi

WORKDIR /home/suwayomi

RUN curl -s --create-dirs -L https://raw.githubusercontent.com/suwayomi/docker-tachidesk/main/scripts/startup_script.sh -o /home/suwayomi/startup/startup_script.sh

RUN curl -L https://github.com/Suwayomi/Tachidesk-Server/releases/download/v0.7.0/Tachidesk-Server-v0.7.0-r1197.jar -o /home/suwayomi/startup/tachidesk_latest.jar

EXPOSE 4567

CMD ["/bin/sh", "/home/suwayomi/startup/startup_script.sh"]
