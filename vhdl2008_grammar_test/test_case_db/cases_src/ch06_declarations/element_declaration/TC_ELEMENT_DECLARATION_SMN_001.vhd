-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SMN_001
-- Related Rule ID: SMN_ELEMENT_001
-- Rule Type: Semantic
-- BNF Production: ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3, Section 12.3
-- Production: element_declaration ::=
--   identifier_list : element_subtype_definition ;
-- Test Focus: Duplicate element identifier in the same record
--   type — element names within a record must be unique;
--   here 'payload' appears twice in the same record type
--   definition, violating element name uniqueness
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Expected Result: Triggers semantic error: duplicate element name
-- Dependencies: None
-- =============================================================
entity element_declaration_smn_001 is
  port (
    header_in  : in  bit_vector(3 downto 0);
    body_in    : in  bit_vector(7 downto 0);
    pkt_out_hi : out bit_vector(3 downto 0);
    pkt_out_lo : out bit_vector(7 downto 0)
  );
end entity element_declaration_smn_001;

architecture rtl of element_declaration_smn_001 is
  -- ERROR: duplicate element name 'payload' in same record
  type t_packet_hdr is record
    payload : bit_vector(3 downto 0);   -- first payload
    cmd     : bit_vector(1 downto 0);
    payload : bit_vector(7 downto 0);   -- DUPLICATE element name
  end record;

  signal s_pkt : t_packet_hdr;
begin
  s_pkt.cmd     <= header_in(1 downto 0);
  pkt_out_hi <= header_in;
  pkt_out_lo <= body_in;
end architecture rtl;
