-- =============================================================
-- Case ID: TC_CONDITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: condition: boolean signal and relational expression combined with 'and' in elsif chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity condition_syn6_ent is port(clk,en:in bit; thresh:in integer; val:in integer; y:out integer); end entity;
architecture bh of condition_syn6_ent is
  signal s_reg:integer:=0;
begin
  process(clk) is
  begin
    if clk'event and clk='1' then
      if en='1' and val>thresh then
        s_reg<=val;
      elsif en='1' and val<thresh then
        s_reg<=thresh;
      elsif en='0' then
        s_reg<=s_reg;
      else
        s_reg<=val;
      end if;
    end if;
  end process;
  y<=s_reg;
end architecture bh;
