-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: Basic subtype with array_element_constraint wrapping an
--            array_constraint. A constrained integer array subtype is
--            declared and exercised in a magnitude comparator.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity magnitude_comparator is
  port (
    a_val     : in  integer range 0 to 255;
    b_val     : in  integer range 0 to 255;
    a_gt_b    : out boolean
  );
end entity magnitude_comparator;

architecture rtl of magnitude_comparator is
  -- array_element_constraint via array_constraint on integer element
  subtype byte_element is integer range 0 to 255;
  type sample_buffer is array (0 to 7) of byte_element;
  signal samples : sample_buffer := (others => 0);
begin
  samples(0) <= a_val;
  samples(1) <= b_val;
  a_gt_b <= samples(0) > samples(1);
end architecture rtl;
