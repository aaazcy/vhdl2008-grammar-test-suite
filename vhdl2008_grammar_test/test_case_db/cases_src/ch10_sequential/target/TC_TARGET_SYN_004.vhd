-- =============================================================
-- Case ID: TC_TARGET_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: target ::= name | aggregate
-- Case Type: Positive
-- Test Focus: target: aggregate target with two signals — (s_hi, s_lo) receives split bus assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity target_syn4_ent is port(data:in integer; y_hi,y_lo:out integer); end entity;
architecture bh of target_syn4_ent is
  type t_pair is record hi:integer; lo:integer; end record;
  signal s_hi, s_lo:integer:=0;
begin
  process(data) is
  begin
    (s_hi, s_lo) <= t_pair'(hi=>data+1, lo=>data);
  end process;
  y_hi <= s_hi;
  y_lo <= s_lo;
end architecture bh;
