-- =============================================================
-- Case ID: TC_TARGET_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: target: indexed name target — array element s_mem(addr) as signal assignment target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity target_syn3_ent is port(addr:in integer range 0 to 3; data:in integer; y:out integer); end entity;
architecture bh of target_syn3_ent is
  type t_mem is array(0 to 3) of integer;
  signal s_mem:t_mem:=(others=>0);
begin
  process(addr, data) is
  begin
    s_mem(addr) <= data;
  end process;
  y <= s_mem(addr);
end architecture bh;
