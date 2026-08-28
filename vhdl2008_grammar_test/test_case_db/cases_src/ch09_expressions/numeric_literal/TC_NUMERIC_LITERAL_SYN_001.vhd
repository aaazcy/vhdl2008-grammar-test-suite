-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Test Focus: minimal form: a single integer abstract_literal used for signal default value initialization, verifying the most basic form of abstract_literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_minimal is
  port (
    x : out integer
  );
end entity num_lit_minimal;

architecture minimal of num_lit_minimal is
  constant C_VAL : integer := 42;  -- abstract_literal
begin
  x <= C_VAL;
end architecture minimal;
