-- =============================================================
-- Case ID: TC_CONDITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: Relational expression as the condition: the if a > b form, where the condition is a relational expression comparing two signals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_rel is
  port (
    a, b  : in  integer;
    dout  : out bit
  );
end entity ent_cond_rel;

architecture relational of ent_cond_rel is
begin
  process(a, b)
  begin
    if a > b then
      dout <= '1';
    else
      dout <= '0';
    end if;
  end process;
end architecture relational;
