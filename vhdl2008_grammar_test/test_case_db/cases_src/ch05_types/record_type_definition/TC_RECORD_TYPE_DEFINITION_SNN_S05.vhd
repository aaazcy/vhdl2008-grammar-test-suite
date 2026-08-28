-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_S05
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: End record identifier does not match the declared record type name — the optional identifier after "end record" must match the type name, triggering a syntax or semantic error
-- Expected Result: Triggers error: end record identifier mismatch
-- Dependencies: None
-- =============================================================
entity rec_mismatch_ent is port(r:out integer); end entity;
architecture rec_mismatch_arch of rec_mismatch_ent is
  type t_frame is record
    sop : bit_vector(7 downto 0);
    eop : bit_vector(7 downto 0);
  end record t_packet;        -- ERROR: identifier "t_packet" does not match "t_frame"
  signal s_pkt : t_frame;
begin
  s_pkt.sop <= X"AB";
  r <= 0;
end architecture rec_mismatch_arch;
