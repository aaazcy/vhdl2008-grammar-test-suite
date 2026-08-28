-- =============================================================
-- Case ID: TC_CONDITION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition in an assert statement: the assert valid='1' report... form, where the condition serves as the boolean expression of the assertion check
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_assert is
  port (
    valid : in  boolean;
    data  : in  integer;
    dout  : out integer
  );
end entity ent_cond_assert;

architecture assert_cond of ent_cond_assert is
begin
  process(valid, data)
  begin
    assert valid report "Data not valid" severity warning;
    if valid then
      dout <= data;
    end if;
  end process;
end architecture assert_cond;
