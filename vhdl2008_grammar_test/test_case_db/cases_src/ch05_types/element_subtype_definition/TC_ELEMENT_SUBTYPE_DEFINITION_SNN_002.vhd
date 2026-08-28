-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: element_subtype_definition using an undeclared
--            type_mark in the subtype_indication. The type name
--            must be visible at the point of declaration.
-- Expected Result: Triggers name resolution error
-- Dependencies: None
-- =============================================================
entity bad_element_subtype_unknown is
  port (
    q : out integer
  );
end entity bad_element_subtype_unknown;

architecture rtl of bad_element_subtype_unknown is
  -- ERROR: "nonexistent_type" is not declared
  type bad_arr is array (0 to 7) of nonexistent_type range 0 to 15;
  signal s : bad_arr;
begin
  q <= 0;
end architecture rtl;
