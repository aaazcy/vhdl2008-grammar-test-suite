-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: record_type_definition containing array fields.
--            An Ethernet frame header with MAC address arrays
--            within a record. Tests composite nesting.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ethernet_frame_header is
  port (
    mac_byte   : in  bit_vector(7 downto 0);
    byte_idx   : in  integer range 0 to 5;
    eth_type   : in  bit_vector(15 downto 0);
    hdr_valid  : out bit
  );
end entity ethernet_frame_header;

architecture rtl of ethernet_frame_header is
  -- record_type_definition with array fields
  type mac_address is array (0 to 5) of bit_vector(7 downto 0);
  type eth_header is record
    dest_mac    : mac_address;
    src_mac     : mac_address;
    ethertype   : bit_vector(15 downto 0);
  end record;
  signal hdr : eth_header := (
    dest_mac  => (others => X"00"),
    src_mac   => (others => X"00"),
    ethertype => X"0000");
begin
  hdr.dest_mac(byte_idx) <= mac_byte;
  hdr.ethertype          <= eth_type;
  hdr_valid <= '1' when hdr.ethertype = X"0800" else '0';
end architecture rtl;
