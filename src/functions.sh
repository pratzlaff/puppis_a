srcdir=/data/legs/rpete/flight/puppis_a/src
datadir=/data/legs/rpete/data/puppis_a

obsids()
{
    [ $# -eq 0 ] || {
	echo "Usage: $0" >&2
	return 1
    }
    \grep '^[0-9]' "${srcdir}/../data/obsids" | cut -f 1 #| tail -1
}

wcs_val() {
    local evt="$1"
    local keyword="$2"
    dmlist "$evt" header,raw | grep $keyword | perl -anle 'print $F[5]'
}

src_pos()
{
    local evt="$1"
    local src_ra=125.489583
    local src_dec=-43.004361

    /data/legs/rpete/flight/wcs_test/wcs2pix_wcstools \
	"$evt" "$src_ra" "$src_dec"
}
