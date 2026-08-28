-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: Missing 'variable' keyword — external_variable_name requires 'variable' keyword after <<; omitting it violates the BNF production
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ext_var_snn2_ent is port(r:out bit); end entity;
architecture bh of ext_var_snn2_ent is
  -- ERROR: missing 'variable' keyword after <<
  alias bad_var is << @work.pkg.my_var : integer >>;
begin
  r <= '0';
end architecture bh;
