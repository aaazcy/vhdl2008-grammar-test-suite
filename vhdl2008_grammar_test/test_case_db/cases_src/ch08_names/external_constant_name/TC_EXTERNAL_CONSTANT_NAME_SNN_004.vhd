-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: missing colon separator — in <<constant .path.name integer>> there is no required colon (':') separator between external_pathname and subtype_indication
-- Expected Result: Triggers syntax error at missing colon
-- Dependencies: None
-- =============================================================
entity ext_const_miss_colon is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_const_miss_colon is
  -- ERROR: Missing colon ':' between external_pathname and subtype_indication
  alias bad_ref is <<constant .cfg_pkg.MAX_VAL integer>>;
begin
  q <= d;
end architecture vhdl2008;
