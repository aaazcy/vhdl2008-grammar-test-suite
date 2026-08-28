-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: missing opening bracket '<<' — using 'constant .path.name : integer >>' directly has no leading '<<', and external_constant_name must begin with '<<'
-- Expected Result: Triggers syntax error at missing '<<'
-- Dependencies: None
-- =============================================================
entity ext_const_miss_open is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_const_miss_open is
  -- ERROR: Missing opening '<<' delimiter
  alias bad_ref is constant .cfg_pkg.MAX : integer >>;
begin
  q <= d;
end architecture vhdl2008;
