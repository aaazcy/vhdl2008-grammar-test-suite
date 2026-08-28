-- =============================================================
-- Case ID: TC_CONDITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: simple relational expression in if statement (a > b)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of condition_syn1_ent is
begin
  process(a,b) is
  begin
    if a > b then y <= a; else y <= b; end if;
  end process;
end architecture bh;
