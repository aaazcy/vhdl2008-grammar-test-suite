-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: element_subtype_definition with mismatched constraint
--            on the subtype_indication. Using a range constraint
--            that is incompatible with the base type.
--            Here, boolean range 0 to 1 is invalid because boolean
--            is not an integer type.
-- Expected Result: Triggers type error
-- Dependencies: None
-- =============================================================
entity bad_element_subtype_mismatch is
  port (
    x : out boolean
  );
end entity bad_element_subtype_mismatch;

architecture rtl of bad_element_subtype_mismatch is
  -- ERROR: boolean is not an integer type, cannot have integer range
  subtype bad_bool is boolean range 0 to 1;
  signal s : bad_bool;
begin
  s <= true;
  x <= s;
end architecture rtl;
