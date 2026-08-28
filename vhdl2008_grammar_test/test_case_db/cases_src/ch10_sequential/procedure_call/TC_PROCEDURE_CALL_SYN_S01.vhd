-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.7
-- Test Focus: Procedure call: procedure_name [(actual_parameter_part)] — invocation of procedure returning no value
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_procedure_call_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_procedure_call_syn_s01 is
  procedure p_inc(signal v:inout integer) is begin v<=v+1; end procedure;
  signal s_pc:integer:=0;
begin
  p_inc(s_pc); r<=s_pc;end architecture bh;
