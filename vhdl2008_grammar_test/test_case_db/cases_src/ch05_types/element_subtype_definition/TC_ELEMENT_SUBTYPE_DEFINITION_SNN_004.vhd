-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: element_subtype_definition with incomplete
--            subtype_indication: type_mark followed by constraint
--            that has a malformed range expression (missing bound).
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_element_subtype_incomplete is
  port (
    y : out integer
  );
end entity bad_element_subtype_incomplete;

architecture rtl of bad_element_subtype_incomplete is
  -- ERROR: range missing right bound expression
  subtype bad_range is integer range 0 to;
  signal s : bad_range;
begin
  y <= 0;
end architecture rtl;
