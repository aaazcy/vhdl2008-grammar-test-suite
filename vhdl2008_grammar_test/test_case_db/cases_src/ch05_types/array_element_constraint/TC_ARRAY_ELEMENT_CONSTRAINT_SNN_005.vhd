-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: Syntax error -- element constraint applied with wrong
--            syntax, using 'range' keyword instead of proper element
--            constraint notation for array element subtype.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity arr_elem_con_snn_bad_syntax is
end entity arr_elem_con_snn_bad_syntax;
architecture rtl of arr_elem_con_snn_bad_syntax is
  type t_bad is array (0 to 7) of integer range 0 255;  -- ERROR: missing 'to' in range
  signal s : t_bad;
begin
end architecture rtl;
