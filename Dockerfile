FROM debian
LABEL maintainer="Simon Sharman simon.sharman@telxl.com"

ENV DEBIAN_FRONTEND noninteractive

COPY includes/asterisk-16.6.1.tar.gz /usr/src

RUN apt-get update; apt-get install -y nano net-tools build-essential curl libedit-dev uuid-dev libxml2-dev file libsqlite3-dev libssl-dev libsrtp2-dev; \
    tar -C /usr/src/ -xvf /usr/src/asterisk-16.6.1.tar.gz; \
    cd /usr/src/asterisk-16.6.1; \
    ./configure --with-jansson-bundled; \
    make menuselect.makeopts; \
    menuselect/menuselect --disable cdr_tds --disable cel_tds --disable cdr_sqlite3_custom \
    --disable cel_sqlite3_custom --disable chan_motif --disable chan_sip --disable res_stun_monitor \
    --disable chan_iax2 --disable chan_skinny --disable res_pjsip_notify --disable res_parking \
    --disable app_agent_pool --disable res_calendar --disable cel_manager --disable cdr_csv --disable cdr_manager \
    --disable app_followme --disable app_amd --disable chan_unistim --disable pbx_ael --disable app_alarmreceiver \
    --disable chan_oss --disable app_festival --disable app_queue --disable app_voicemail --disable app_dictate \
    --disable app_externalivr --disable app_minivm --disable app_morsecode --disable app_zapateller \
    --disable app_adsiprog --disable app_getcpeid --disable app_ices --disable app_image \
    --disable cdr_custom --disable cel_custom --disable chan_mgcp --disable res_fax --disable res_ael_share \
    --disable res_smdi --disable res_adsi --disable chan_phone --disable res_pjsip_phoneprov_provider --disable res_phoneprov \
    --enable app_macro --enable res_crypto --enable res_http_websocket --enable res_pjsip_transport_websocket \
    --enable res_srtp --enable res_ari --enable res_ari_applications --enable res_ari_asterisk --enable res_ari_bridges \
    --enable res_ari_channels --enable res_ari_device_states --enable res_ari_endpoints --enable res_ari_events \
    --enable res_ari_model --enable res_ari_playbacks --enable res_ari_recordings \
    --enable res_ari_mailboxes --enable res_ari_sounds \
    --disable BUILD_NATIVE; \
    make; \
    make install

COPY includes/entrypoint.sh /
ADD includes/asterisk /etc/asterisk

ENTRYPOINT ["/entrypoint.sh"]
# ENTRYPOINT ["/bin/bash"]
