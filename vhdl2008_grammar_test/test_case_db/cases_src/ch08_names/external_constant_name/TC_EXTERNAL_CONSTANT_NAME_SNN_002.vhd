-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: Missing 'constant' keyword in external constant name —
--   Using << external_pathname : subtype_indication >> without the required 'constant' token.
--   This targets the specific BNF keyword 'constant' that must appear after '<<'.
-- Expected Result: Triggers syntax error (missing 'constant' keyword)
-- Dependencies: None
-- =============================================================

entity ext_const_nokw_e is
  port (
    err_flag : out bit
  );
end entity ext_const_nokw_e;

architecture bh of ext_const_nokw_e is
  -- ERROR: Missing 'constant' keyword after <<
  -- BNF requires: << constant external_pathname : subtype_indication >>
  alias bad_alias is
    << @work.config_pkg.MAX_VAL : integer >>;
begin
  err_flag <= '0';
end architecture bh;
