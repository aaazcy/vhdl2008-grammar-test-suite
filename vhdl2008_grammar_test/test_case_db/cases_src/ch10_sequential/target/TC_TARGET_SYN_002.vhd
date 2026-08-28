-- =============================================================
-- Case ID: TC_TARGET_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: target: simple signal name as target in variable assignment with arithmetic right-hand side
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity target_syn2_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of target_syn2_ent is
  signal s_result:integer:=0;
begin
  process(a,b) is
    variable v_tmp:integer;
  begin
    v_tmp := a + b;
    s_result <= v_tmp;
  end process;
  y <= s_result;
end architecture bh;
