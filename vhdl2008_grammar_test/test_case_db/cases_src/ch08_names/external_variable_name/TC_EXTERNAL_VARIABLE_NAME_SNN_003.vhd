-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: Missing closing '>>' — external_variable_name must end with '>>'; single '>' is invalid syntax
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ext_var_snn3_ent is port(r:out bit); end entity;
architecture bh of ext_var_snn3_ent is
  -- ERROR: only one '>' instead of required '>>'
  alias bad_var is <<variable @work.pkg.my_var : integer >;
begin
  r <= '0';
end architecture bh;
