-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: element_subtype_definition with invalid
--            subtype_indication: missing the type_mark entirely.
--            "range 0 to 7" without a preceding type name is not
--            a valid subtype_indication.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_element_subtype_no_type is
  port (
    d : out integer
  );
end entity bad_element_subtype_no_type;

architecture rtl of bad_element_subtype_no_type is
  -- ERROR: "range 0 to 7" without type_mark is invalid
  type bad_arr is array (0 to 3) of range 0 to 7;
  signal s : bad_arr;
begin
  d <= 0;
end architecture rtl;
