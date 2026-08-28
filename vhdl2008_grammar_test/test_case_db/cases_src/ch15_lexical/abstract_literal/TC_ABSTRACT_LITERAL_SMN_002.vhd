-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: Real value of abstract_literal assigned to integer type: 3.14159 (real) assigned to an integer signal, verify semantic analysis detects floating-to-fixed point type mismatch and reports a type error
-- Expected Result: Triggers semantic error on real-to-integer type mismatch
-- Dependencies: None
-- =============================================================
entity al_real_to_int is
  port (
    bad_val : out integer
  );
end entity al_real_to_int;

architecture rtl of al_real_to_int is
  constant C_REAL : integer := 3.14159;
begin
  bad_val <= C_REAL;
end architecture rtl;
