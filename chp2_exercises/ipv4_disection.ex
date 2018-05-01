defmodule IPV4Parser do
  def parse(ipv4_packet) do
    <<
      version :: binary-size(4), # In this case always 4 lol
      ihl :: binary-size(4),
      dscp :: binary-size(6),
      ecn :: binary-size(2),
      length :: binary-size(16),
      identification :: binary-size(16),
      flags :: binary-size(3),
      fragment_offset :: binary-size(13),
      time_to_live :: binary-size(8),
      protocol :: binary-size(8),
      header_checksum :: binary-size(16),
      source_addr :: binary-size(32),
      destination_addr :: binary-size(32),
      _options :: binary # Is present when the ihl > 5
    >> = ipv4_packet
  end
end
