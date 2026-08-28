-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Minimal record with single field and end record with matching identifier, verifying the optional identifier clause of the production
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_min_ent is port(z:out bit_vector(3 downto 0)); end entity;
architecture rec_min_arch of rec_min_ent is
  type t_nibble is record
    bits : bit_vector(3 downto 0);
  end record t_nibble;
  signal s_nib : t_nibble := (bits => "1010");
begin
  z <= s_nib.bits;
end architecture rec_min_arch;
