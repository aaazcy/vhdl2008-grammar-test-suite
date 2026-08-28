-- =============================================================
-- Case ID: TC_CONDITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: Minimal form: a boolean signal used directly as the condition of an if statement, verifying that a condition can be a simple boolean expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_if is
  port (
    en : in boolean
  );
end entity ent_cond_if;

architecture simple_if of ent_cond_if is
begin
  process(en)
  begin
    if en then
      null;
    end if;
  end process;
end architecture simple_if;
