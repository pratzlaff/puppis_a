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

    tcrvl19=$(wcs_val "$evt" TCRVL19)
    tcrpx19=$(wcs_val "$evt" TCRPX19)
    tcdlt19=$(wcs_val "$evt" TCDLT19)

    tcrvl20=$(wcs_val "$evt" TCRVL20)
    tcrpx20=$(wcs_val "$evt" TCRPX20)
    tcdlt20=$(wcs_val "$evt" TCDLT20)

    src_px_x=$(perl -le "print( ($src_ra-($tcrvl19))/$tcdlt19+$tcrpx19 )")
    src_px_y=$(perl -le "print( ($src_dec-($tcrvl20))/$tcdlt20+$tcrpx20 )")
    echo $src_px_x $src_px_y
}
