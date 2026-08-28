-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Negative
-- Test Focus: array_constraint in element_constraint with invalid
--            discrete_range: missing the right bound in a range.
--            The element_constraint requires a valid array_constraint
--            which itself requires complete discrete_ranges.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_element_constraint_range is
  port (
    d : out bit
  );
end entity bad_element_constraint_range;

architecture rtl of bad_element_constraint_range is
  -- ERROR: incomplete discrete_range "0 to" in array_constraint
  subtype bad_sub is bit_vector(0 to);
  signal s : bad_sub;
begin
  d <= '0';
end architecture rtl;
