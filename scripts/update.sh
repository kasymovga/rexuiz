#!/bin/sh

REPOS='http://rexuiz.com/maps/RexuizLauncher
http://bnse.rexuiz.top/RexuizLauncher
http://nexuiz.mooo.com/RexuizLauncher
http://108.61.164.188/RexuizLauncher'

download() {
	mkdir -m 755 -p "`dirname "$2"`" || return 1
	if test "$CURL" = y
	then
		curl -L --connect-timeout 10 "$1" --output "$2"
	else
		if test "$WGET" = y
		then
			wget --timeout=10 "$1" -O "$2"
		else
			echo "Downloading require wget or curl installed"
			return 1
		fi
	fi
}

checksign() {
	openssl dgst -sha256 -verify "$3" -signature "$2" "$1"
}

checksize() {
	test "`stat -c '%s' "$1"`" = "$2"
}

checkhash() {
	test "`md5sum "$1" | cut -f 1 -d ' '`" = "$2"
}

fail() {
	echo "$@"
	exit 1
}

if test $# != 1
then
	echo "Usage: $0 <Rexuiz directory>"
	exit 0
fi

REXUIZ_DIR="$1"
UPDATE_DIR="$REXUIZ_DIR/.update"

mkdir -m 755 -p "$UPDATE_DIR" || fail "Can not create temporary directory: $UPDATE_DIR"
cat > "$UPDATE_DIR/rexuiz_pub.key" << EOF
-----BEGIN PUBLIC KEY-----
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAuTNg6y4h3eo2IwNbTxok
acEkcog1nJuvFb3t44bDYpF9KWrDR/kCzh5hepFXlOZoUniEhcoks0hp2Sv7oBan
4ms6v4NMm0TMlHiWYp7VBwcvRSxsdWj3P5babTaw+FHzP4Pdk/AEn8973pQfDsGO
OuPvw5zeUiE1bFyajMUo7sgYPSnMhDfsPHJwIcvDrstBbEUVOVLHW8gJbrg9OLPU
ZAEL4wx/FCxqo/BBjF9N3pWJIM7wR1mF8QkmozAyd6J6fm+w6tMXcV9Je/P4X6q1
xcmMRAGgPikOJPRV9be8nqrG7Ls8qM/tGcQeqTjdo0Zsy94Mxp25WKjLeKbhOUph
gIpJjX7bpgol9OPjtYLF1bhXLDghA3gxCnUGOhVHJjQLfj6zUYwaH3xPRoRtYSKt
gNDa5OiHe1jx+qKkh+d88uCkOG4k9OGxGYAaTVvgtDgAh2fP0SOfbwNn9pbPBHVz
NcvnSD1htaB/Gt/l6W75rtPhhk0NgZ23oNcUnFRH05Hsme4kKgQ5iL9Qp3ziSIBD
ZZaCx+FBX9mhzmdcxcYBVi1X479v3BcNVV1wYVJJNBLfT14D9LTtMts2U6vkjhNW
eFNO+LmZO07tI4Ea/bP22AUF9YcEjj1Sy5zAx7TadacPYsElCnIdVE0vBRfgn7IC
OPvP/auIOSblAmylt+J/o3UCAwEAAQ==
-----END PUBLIC KEY-----
EOF

if type curl > /dev/null
then
	CURL=y
fi
if type wget > /dev/null
then
	WGET=y
fi

REPO_FOUND=0
for REPO_URL in $REPOS
do
	if download "$REPO_URL/index.lst" "$UPDATE_DIR/index.lst" && download "$REPO_URL/index.lst.sig" "$UPDATE_DIR/index.lst.sig" && checksign "$UPDATE_DIR/index.lst" "$UPDATE_DIR/index.lst.sig" "$UPDATE_DIR/rexuiz_pub.key"
	then
		REPO_FOUND=1
		break
	fi
done
if test "$REPO_FOUND" = 0
then
	fail "No working repo found"
fi
echo -n > "$UPDATE_DIR/.update.lst" || fail "Can not create update list"
while IFS='|' read -r HASH SIZE FILE TAIL
do
	TARGET_FILE="$REXUIZ_DIR/$FILE"
	UPDATE_FILE="$UPDATE_DIR/$FILE"
	if test -f "$TARGET_FILE" && checksize "$TARGET_FILE" "$SIZE" && checkhash "$TARGET_FILE" "$HASH"
	then
		echo "$TARGET_FILE is up to date"
		continue
	fi
	if test -f "$UPDATE_FILE" && checksize "$UPDATE_FILE" "$SIZE" && checkhash "$UPDATE_FILE" "$HASH"
	then
		echo "$FILE" >> "$UPDATE_DIR/.update.lst" || fail "Update list build error"
		continue
	fi
	if download "$REPO_URL/$FILE" "$UPDATE_FILE" && checkhash "$UPDATE_FILE" "$HASH"
	then
		echo "$FILE downloaded successfuly"
		echo "$FILE" >> "$UPDATE_DIR/.update.lst" || fail "Update list build error"
	else
		echo "Downloading of $REPO_URL/$FILE failed"
		fail "Can not download update data"
	fi
done < "$UPDATE_DIR/index.lst"
while read L
do
	echo "Updating $L"
	mkdir -m 755 -p "`dirname "$REXUIZ_DIR/$L"`" || fail "Can not create directory for files"
	mv "$UPDATE_DIR/$L" "$REXUIZ_DIR/$L" || fail "Can not update files"
done < "$UPDATE_DIR/.update.lst"
rm -rf "$UPDATE_DIR"
