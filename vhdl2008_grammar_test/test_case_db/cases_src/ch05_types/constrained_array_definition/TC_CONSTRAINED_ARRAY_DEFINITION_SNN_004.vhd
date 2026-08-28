-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Missing element_subtype_indication after "of".
--            The BNF requires a complete subtype_indication
--            after the "of" keyword. A bare "bit" without proper
--            context following the "of" is not the issue, but
--            using an invalid expression as the element type is.
--            Here, the element type is replaced with a string literal.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_constrained_element is
  port (
    w : out bit
  );
end entity bad_constrained_element;

architecture rtl of bad_constrained_element is
  -- ERROR: invalid element_subtype_indication
  type bad_arr is array (0 to 7) of "hello";
  signal s : bad_arr;
begin
  w <= '0';
end architecture rtl;
