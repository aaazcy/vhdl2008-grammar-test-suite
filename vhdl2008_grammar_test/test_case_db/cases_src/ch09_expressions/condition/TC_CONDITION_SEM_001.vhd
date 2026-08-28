-- =============================================================
-- Case ID: TC_CONDITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITION_BOOLEAN
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Rule Description: A condition in an if statement, while loop, or conditional signal assignment must be of type boolean.
-- Test Focus: SEM: the condition type must be boolean — the conditions in if and while use correct boolean expressions, verifying the boolean type requirement of conditions in multiple contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_sem_001 is
  port (
    clk  : in  bit;
    rst  : in  bit;
    dout : out integer
  );
end entity ent_cond_sem_001;

architecture boolean_req of ent_cond_sem_001 is
begin
  process(clk, rst)
    variable v : integer := 0;
  begin
    if rst = '1' then
      v := 0;
    elsif clk'event and clk = '1' then
      while v < 255 loop
        v := v + 1;
      end loop;
    end if;
    dout <= v;
  end process;
end architecture boolean_req;
