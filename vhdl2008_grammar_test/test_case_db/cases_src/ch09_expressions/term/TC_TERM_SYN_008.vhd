-- =============================================================
-- Case ID: TC_TERM_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: physical type multiplication: physical * integer, a physical quantity multiplied by an integer factor yields the same physical type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_phys_mul_ent is
  port(count : in integer; delay_val : out time);
end entity;
architecture rtl of term_phys_mul_ent is
  constant UNIT_DELAY : time := 5 ns;
begin
  delay_val <= UNIT_DELAY * count;
end architecture rtl;
