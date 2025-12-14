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
