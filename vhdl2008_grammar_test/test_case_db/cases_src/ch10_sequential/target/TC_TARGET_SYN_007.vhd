-- =============================================================
-- Case ID: TC_TARGET_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: target: port signal as target — output port y directly assigned in process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity target_syn7_ent is port(clk:in bit; d:in integer; y:out integer); end entity;
architecture bh of target_syn7_ent is
  signal s_reg:integer:=0;
begin
  process(clk) is
  begin
    if clk'event and clk='1' then
      s_reg <= d;
    end if;
  end process;
  y <= s_reg;
end architecture bh;
