-- =============================================================
-- Case ID: TC_CONDITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: Logical combination condition: the if (a and b) or c form, where the condition logically combines multiple boolean expressions with and/or
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_logic is
  port (
    x, y, z : in  boolean;
    flag    : out boolean
  );
end entity ent_cond_logic;

architecture logical of ent_cond_logic is
begin
  process(x, y, z)
  begin
    if (x and y) or z then
      flag <= true;
    else
      flag <= false;
    end if;
  end process;
end architecture logical;
