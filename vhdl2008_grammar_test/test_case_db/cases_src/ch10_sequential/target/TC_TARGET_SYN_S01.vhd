-- =============================================================
-- Case ID: TC_TARGET_SYN_S01
-- Rule Type: Syntax
-- BNF Production: TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Test Focus: Target: name / aggregate — left side of signal/variable assignment (signal, variable, port, aggregate of signals)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_target_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_target_syn_s01 is
  type t_pair is record f1:integer; f2:integer; end record;
  signal s_t1,s_t2:integer:=0;
begin
  (s_t1,s_t2)<=t_pair'(1,1);  -- aggregate target
  r<=s_t1+s_t2;end architecture bh;
