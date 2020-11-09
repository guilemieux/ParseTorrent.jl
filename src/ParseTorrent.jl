module ParseTorrent

using Bencode
using SHA

export parsetorrent

Bytes = Vector{UInt8}

function parsetorrent(b::Bytes)::Dict
    torrent = bdecode(b)
    infohash = sha1(bencode(torrent["info"]))
    torrent["infohash"] = infohash
    pieces = torrent["info"]["pieces"]
    torrent["info"]["pieces"] = pieces2hashes(Vector{UInt8}(pieces))
    torrent
end

function pieces2hashes(pieces::Bytes)::Vector{String}
    len = length(pieces)
    pieces = reshape(pieces, (20, length(pieces) ÷ 20))
    map(bytes2hex, eachcol(pieces))
end

end # module