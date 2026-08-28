-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: Static model negative -- integer value assigned to
--            an enum type signal. Enum types are not numeric; assigning
--            an integer literal to an enum signal without conversion
--            is a type mismatch.
-- Expected Result: Triggers type mismatch error
-- Dependencies: None
-- =============================================================
entity enum_lit_smn_type_mismatch is
  port ( dout : out integer );
end entity enum_lit_smn_type_mismatch;
architecture rtl of enum_lit_smn_type_mismatch is
  type t_state is (IDLE, RUN);
  signal s_bad : t_state := 0;  -- ERROR: integer 0 not assignable to enum type
begin
  dout <= 0;
end architecture rtl;
