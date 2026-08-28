-- =============================================================
-- Case ID: TC_TERM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Positive
-- Test Focus: * / mixed chain: a three-item chain factor * factor / factor, verifying left-to-right association
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity term_chain_ent is
  port(a, b, c : in integer; result : out integer);
end entity;
architecture rtl of term_chain_ent is
begin
  result <= a * b / c;
end architecture rtl;
