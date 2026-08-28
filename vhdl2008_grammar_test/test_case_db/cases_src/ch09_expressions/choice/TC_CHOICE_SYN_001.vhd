-- =============================================================
-- Case ID: TC_CHOICE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Case Type: Positive
-- Test Focus: Minimal form: a single simple_expression as a choice — the integer literal 0 matches the sel=0 path in a case statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ch_minimal is
  port (
    sel : in  integer range 0 to 1;
    y   : out integer
  );
end entity ch_minimal;

architecture minimal of ch_minimal is
begin
  with sel select
    y <= 10 when 0,   -- simple_expression as choice
         20 when 1;
end architecture minimal;
