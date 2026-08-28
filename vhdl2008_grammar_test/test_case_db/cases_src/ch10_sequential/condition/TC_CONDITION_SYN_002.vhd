-- =============================================================
-- Case ID: TC_CONDITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: compound expression with and/or in if-elsif chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn2_ent is port(clk,rst:in bit; d:in integer; y:out integer); end entity;
architecture bh of condition_syn2_ent is
  signal s_reg:integer:=0;
begin
  process(clk) is
  begin
    if clk'event and clk='1' then
      if rst='1' then s_reg<=0;
      elsif d>=0 and d<256 then s_reg<=d;
      elsif d>=256 and d<512 then s_reg<=d/2;
      else s_reg<=s_reg;
      end if;
    end if;
  end process;
  y<=s_reg;
end architecture bh;
