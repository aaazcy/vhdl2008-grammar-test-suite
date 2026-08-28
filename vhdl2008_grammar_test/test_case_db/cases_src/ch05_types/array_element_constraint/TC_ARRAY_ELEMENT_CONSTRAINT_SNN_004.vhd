-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: In a constrained array subtype, the element_constraint
--            is missing the closing parenthesis of the array_constraint.
--            Tests that the parser catches the unbalanced delimiter
--            in the element_constraint of an array_element_constraint.
-- Expected Result: Triggers syntax error (unbalanced parenthesis)
-- Dependencies: None
-- =============================================================
entity bad_paren_element_constraint is
  port (
    d : out bit
  );
end entity bad_paren_element_constraint;

architecture rtl of bad_paren_element_constraint is
  -- ERROR: missing closing ')' in array_constraint of element_constraint
  type bad_sub is array (0 to 3) of bit_vector(7 downto 0;
  signal s : bad_sub;
begin
  d <= '0';
end architecture rtl;
