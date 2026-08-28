-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: missing subtype_indication — in <<variable .path.count >> the '>>' closes directly after the external_pathname, missing the required ': subtype_indication' part
-- Expected Result: Triggers syntax error at missing subtype_indication
-- Dependencies: None
-- =============================================================
entity ext_var_miss_subtype is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_var_miss_subtype is
  -- ERROR: Missing ': subtype_indication' after external_pathname
  alias bad_ref is <<variable .tb.uut.txn_id>>;
begin
  q <= d;
end architecture vhdl2008;
