-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: keyword misspelled — in <<const .path.name : integer>>, 'const' is used instead of the complete 'constant' keyword; external_constant_name requires the fully spelled 'constant'
-- Expected Result: Triggers syntax error at misspelled keyword
-- Dependencies: None
-- =============================================================
entity ext_const_bad_kw is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_const_bad_kw is
  -- ERROR: 'const' is not a valid keyword - must be 'constant'
  alias bad_ref is <<const .cfg_pkg.MAX_VAL : integer>>;
begin
  q <= d;
end architecture vhdl2008;
