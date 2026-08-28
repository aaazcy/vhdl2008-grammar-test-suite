-- =============================================================
-- Case ID: TC_CHOICES_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHOICES
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: choices ::= choice { | choice }
-- Case Type: Positive
-- Test Focus: choices: enumeration literals combined with pipe (IDLE｜READ｜WRITE) and others
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity choices_syn4_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of choices_syn4_ent is
  type t_op is (NOP, LOAD, STORE, ADD, SUB, MUL, DIV, HALT);
  signal s_op:t_op:=NOP;
  signal s_val:integer:=0;
begin
  process(clk) is
  begin
    if clk'event and clk='1' then
      case s_op is
        when NOP => s_val<=0;
        when LOAD|STORE => s_val<=s_val+1;
        when ADD|SUB|MUL|DIV => s_val<=s_val+2;
        when others => s_val<=s_val-1;
      end case;
    end if;
  end process;
  y<=s_val;
end architecture bh;
