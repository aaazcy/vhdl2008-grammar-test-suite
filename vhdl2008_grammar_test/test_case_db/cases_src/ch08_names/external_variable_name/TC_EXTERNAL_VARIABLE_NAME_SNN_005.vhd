-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: keyword misspelling — <<var .path.count : natural>> uses the abbreviation 'var' instead of the full keyword 'variable'
-- Expected Result: Triggers syntax error at abbreviated keyword
-- Dependencies: None
-- =============================================================
entity ext_var_abbrev is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_var_abbrev is
  -- ERROR: 'var' is not a valid VHDL keyword - must be 'variable'
  alias bad_ref is <<var .tb.uut.txn_id : natural>>;
begin
  q <= d;
end architecture vhdl2008;
