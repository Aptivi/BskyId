#!/bin/bash

increment() {
    # Check the versions
    OLDVER=$1
    NEWVER=$2
    if [ -z $OLDVER ]; then
        printf "Old version must be specified.\n"
        exit 1
    fi
    if [ -z $NEWVER ]; then
        printf "New version must be specified to replace old version $OLDVER.\n"
        exit 1
    fi

    # Populate some of the files needed to replace the old version with the new version
    FILES=(
        "$ROOTDIR/PKGBUILD-REL"
        "$ROOTDIR/.github/workflows/build-ppa-package-with-lintian.yml"
        "$ROOTDIR/.github/workflows/build-ppa-package.yml"
        "$ROOTDIR/.github/workflows/pushamend.yml"
        "$ROOTDIR/.github/workflows/pushppa.yml"
    )
    for FILE in "${FILES[@]}"; do
        printf "Processing $FILE...\n"
        sed -b -i "s/$OLDVER/$NEWVER/g" "$FILE"
        result=$?
        if [ $result -ne 0 ]; then
            checkvendorerror $result
            return $result
        fi
    done

    # Add a Debian changelog entry
    printf "Changing Debian changelogs info...\n"
    DEBIAN_CHANGES_FILE="$ROOTDIR/debian/changelog"
    DEBIAN_CHANGES_DATE=$(date "+%a, %d %b %Y %H:%M:%S %z")
    DEBIAN_CHANGES_ENTRY=$(cat <<EOF
bskyid ($NEWVER-1) noble; urgency=medium

  * Changed install target to generic

 -- Aptivi CEO <ceo@aptivi.anonaddy.com>  $DEBIAN_CHANGES_DATE
EOF
    )
    DEBIAN_CHANGES_CONTENT=$(printf "$DEBIAN_CHANGES_ENTRY\n\n$(cat "$DEBIAN_CHANGES_FILE")")
    printf "$DEBIAN_CHANGES_CONTENT\n" > $DEBIAN_CHANGES_FILE
}
