docker volume create --name ovpn-example
docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://127.0.0.1
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
docker run -v ovpn-example:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME nopass
docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn

docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full CLIENTNAME_pass
docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient CLIENTNAME_pass > CLIENTNAME_pass.ovpn
1
docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://127.0.0.1 -2 -C AES-256-CBC
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full 2fa_c
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn ovpn_otp_user 2fa_c
docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient 2fa_c > 2fa_c.ovpn


docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://127.0.0.1 -2 -C AES-256-CBC
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full 2fa_c_n nopass
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn ovpn_otp_user 2fa_c_n
docker run -v ovpn-example:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient 2fa_c_n > 2fa_c_n.ovpn



https://www.google.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/2fa_c@127.0.0.1%3Fsecret%3DV2MSJUUG3WYS4TE4EINGEXPN2Y%26issuer%3Dbe53fc891f66
Your new secret key is: V2MSJUUG3WYS4TE4EINGEXPN2Y
Your verification code for code 1 is 203629
Your emergency scratch codes are:
  17810940
  88034387
  24429926
  40366956
  95070073


https://www.google.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/2fa_c_n@127.0.0.1%3Fsecret%3DO7JMFJRID4PATC7JTDCBGCFXF4%26issuer%3D28f2527c9eed
Your new secret key is: O7JMFJRID4PATC7JTDCBGCFXF4
Your verification code for code 1 is 301383
Your emergency scratch codes are:
  95443004
  56274506
  69052654
  33010225
  74845319

  
docker run -v ovpn-example:/etc/openvpn --rm -it kylemanna/openvpn bash