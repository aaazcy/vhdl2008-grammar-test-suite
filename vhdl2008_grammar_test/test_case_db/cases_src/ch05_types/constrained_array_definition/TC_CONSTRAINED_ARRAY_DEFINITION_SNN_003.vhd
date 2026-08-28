-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Missing "of" keyword between index_constraint and
--            element_subtype_indication. The BNF requires the
--            literal token "of" in constrained_array_definition.
-- Expected Result: Triggers syntax error (missing "of")
-- Dependencies: None
-- =============================================================
entity bad_constrained_no_of is
  port (
    z : out integer
  );
end entity bad_constrained_no_of;

architecture rtl of bad_constrained_no_of is
  -- ERROR: missing "of" keyword
  type bad_arr is array (0 to 3) integer;
  signal s : bad_arr;
begin
  z <= 1;
end architecture rtl;
