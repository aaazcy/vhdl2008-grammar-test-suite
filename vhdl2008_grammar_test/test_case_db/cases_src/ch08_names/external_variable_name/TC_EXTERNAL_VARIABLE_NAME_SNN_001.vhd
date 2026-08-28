-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: missing 'variable' keyword — <<.path.count : natural>> starts directly with the path, missing the required 'variable' entity class keyword
-- Expected Result: Triggers syntax error at missing 'variable' keyword
-- Dependencies: None
-- =============================================================
entity ext_var_miss_kw is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_var_miss_kw is
  -- ERROR: Missing 'variable' keyword after '<<'
  alias bad_ref is <<.tb.uut.txn_id : natural>>;
begin
  q <= d;
end architecture vhdl2008;
