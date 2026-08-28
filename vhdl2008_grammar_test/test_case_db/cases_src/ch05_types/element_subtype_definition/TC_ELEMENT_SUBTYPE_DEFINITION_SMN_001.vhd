-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Negative
-- Test Focus: Static model negative: element subtype range violation
--            in assignment. The element_subtype_definition constrains
--            to 0..7 but the value 15 is assigned.
-- Expected Result: Triggers static range violation
-- Dependencies: None
-- =============================================================
entity bad_element_subtype_value is
  port (
    flag : out bit
  );
end entity bad_element_subtype_value;

architecture rtl of bad_element_subtype_value is
  subtype small_t is integer range 0 to 7;
  type small_arr is array (0 to 2) of small_t;
  signal arr : small_arr;
begin
  -- ERROR: value 15 exceeds element_subtype range 0 to 7
  arr(0) <= 15;
  flag <= '1';
end architecture rtl;
