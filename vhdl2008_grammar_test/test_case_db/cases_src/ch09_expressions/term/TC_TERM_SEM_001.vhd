-- =============================================================
-- Case ID: TC_TERM_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Rule Description: Multiplication * allows numeric * numeric, physical * integer, integer * physical
-- Test Focus: physical * integer type combination is correct: time constant (physical) * integer signal, conforming to the IEEE multiplication type rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_sem1_ent is
  port(multiplier : in integer; output_delay : out time);
end entity;
architecture rtl of term_sem1_ent is
  constant BASE : time := 1 ns;
begin
  output_delay <= BASE * multiplier;
end architecture rtl;
