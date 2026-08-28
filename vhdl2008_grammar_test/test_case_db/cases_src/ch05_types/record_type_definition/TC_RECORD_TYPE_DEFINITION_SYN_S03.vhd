-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.3
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record
-- Case Type: Positive
-- Test Focus: record with unconstrained array field
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_spc3_ent is port(r:out integer); end entity;
architecture bh of rec_spc3_ent is
  type t_packet is record
    header  : bit_vector;
    payload : bit_vector;
    crc     : bit_vector;
  end record;
  signal s_pkt : t_packet(header(7 downto 0), payload(0 to 31), crc(7 downto 0))
    := (header=>X"AB", payload=>(others=>'0'), crc=>X"00");
begin
  s_pkt.payload(0) <= '1';
  s_pkt.crc <= X"FF";
  r <= 1;
end architecture bh;
