-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Negative
-- Test Focus: Static model negative: constrained element range
--            violation. The element is constrained to range 0 to 15,
--            but the value 20 is assigned statically.
-- Expected Result: Triggers static range violation error
-- Dependencies: None
-- =============================================================
entity bad_element_range_assignment is
  port (
    err_flag : out bit
  );
end entity bad_element_range_assignment;

architecture rtl of bad_element_range_assignment is
  -- element_constraint: integer range 0 to 15
  subtype nibble is integer range 0 to 15;
  type nibble_array is array (0 to 3) of nibble;
  signal arr : nibble_array;
begin
  -- ERROR: value 20 exceeds the element range 0 to 15
  arr(0) <= 20;
  err_flag <= '1';
end architecture rtl;
