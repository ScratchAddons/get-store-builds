VERSION_TAG=$(curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/ScratchAddons/ScratchAddons/releases \
  | jq -r '.[0].tag_name')

wget -O scratchaddons-$VERSION_TAG.crx \
  https://clients2.google.com/service/update2/crx?response=redirect&prodversion=86.0.4240.111&acceptformat=crx2,crx3&x=id%3Dfbeffbjdlemaoicjdapfpikkikjoneco%26uc

wget -O scratchaddons-$VERSION_TAG.xpi \
  http://addons.mozilla.org/firefox/downloads/latest/scratch-messaging-extension/addon-12999334-latest.xpi