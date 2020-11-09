using Test
using ParseTorrent: pieces2hashes, parsetorrent

@testset "parsetorrent with a file" begin
    @test parsetorrent(read("torrent-examples/bitlove-intro.torrent")) == Dict()
end

# @testset "pieces2hashes" begin
#     @test pieces2hashes(Vector{UInt8}(1:100)) == []
# end