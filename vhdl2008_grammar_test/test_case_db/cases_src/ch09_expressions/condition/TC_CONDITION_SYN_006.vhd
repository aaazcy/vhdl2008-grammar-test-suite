-- =============================================================
-- Case ID: TC_CONDITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition in a while loop: the while count < 10 form, where the condition serves as the control expression for continuing or exiting the loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_while is
  port (
    clk   : in  bit;
    dout  : out integer
  );
end entity ent_cond_while;

architecture while_loop of ent_cond_while is
begin
  process(clk)
    variable v_count : integer := 0;
  begin
    if clk'event and clk = '1' then
      while v_count < 10 loop
        v_count := v_count + 1;
      end loop;
      dout <= v_count;
      v_count := 0;
    end if;
  end process;
end architecture while_loop;
